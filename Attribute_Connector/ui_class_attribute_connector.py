import colorsys
from .class_widget_registry import widget_registry
from .ui_class_curve_overlay import CurveOverlay
import importlib


from .attribute_connector_maya_utils import connect_node_attribute


def _get_pyside_modules():
    in_maya = False
    maya_version = None
    try:
        import maya
        in_maya = True
        import maya.cmds as cmds
        maya_version = int(cmds.about(version=True))
    except Exception:
        pass
    if in_maya:
        if maya_version and maya_version >= 2025:
            try:
                PySide6 = importlib.import_module('PySide6')
                QtWidgets = importlib.import_module('PySide6.QtWidgets')
                QtCore = importlib.import_module('PySide6.QtCore')
                QtGui = importlib.import_module('PySide6.QtGui')
                return QtWidgets, QtCore, QtGui
            except ImportError:
                pass
        else:
            try:
                PySide2 = importlib.import_module('PySide2')
                QtWidgets = importlib.import_module('PySide2.QtWidgets')
                QtCore = importlib.import_module('PySide2.QtCore')
                QtGui = importlib.import_module('PySide2.QtGui')
                return QtWidgets, QtCore, QtGui
            except ImportError:
                pass
    try:
        PySide6 = importlib.import_module('PySide6')
        QtWidgets = importlib.import_module('PySide6.QtWidgets')
        QtCore = importlib.import_module('PySide6.QtCore')
        QtGui = importlib.import_module('PySide6.QtGui')
        return QtWidgets, QtCore, QtGui
    except ImportError:
        raise ImportError("Could not import PySide2 or PySide6. Please install PySide6.")

QtWidgets, QtCore, QtGui = _get_pyside_modules()


class AttributeConnectorUI(QtWidgets.QWidget):
    def __del__(self):
        print(f"[DEBUG] __del__ called for AttributeConnectorUI: {self}")

    def __init__(self):
        super(AttributeConnectorUI, self).__init__()
        widget_registry.register(self, "AttributeConnectorUI")
        self.item_counter = 0  # Counter to assign unique IDs to items
        self.setMouseTracking(True)
        self.connections = []  # Store (source_socket, target_socket, color)
        self.pastel_colors = self.generate_pastel_palette(12)

        # Set window flags
        self.setWindowFlags(QtCore.Qt.Tool | QtCore.Qt.WindowStaysOnTopHint)
        self.setWindowTitle("Attribute Connector")

        # Main layout
        main_layout = QtWidgets.QVBoxLayout(self)

        # Create two columns for Source and Target Attributes inside rounded frames
        self.source_frame = QtWidgets.QFrame()
        self.source_frame.setStyleSheet("QFrame { background: #222; border-radius: 16px; border: 2px solid #444; }")
        widget_registry.register(self.source_frame, "source_frame")
        self.source_column = self.create_attribute_column("Source Attributes", socket_position="right", parent_frame=self.source_frame)
        self.target_frame = QtWidgets.QFrame()
        self.target_frame.setStyleSheet("QFrame { background: #222; border-radius: 16px; border: 2px solid #444; }")
        widget_registry.register(self.target_frame, "target_frame")
        self.target_column = self.create_attribute_column("Target Attributes", socket_position="left", parent_frame=self.target_frame)

        # Layout for columns
        columns_layout = QtWidgets.QHBoxLayout()
        columns_layout.addWidget(self.source_frame)
        columns_layout.addWidget(self.target_frame)
        main_layout.addLayout(columns_layout)

        # Add grid position info to columns
        self.source_column["grid_positions"] = {
            "top_right": (1, 0),   # Example: (x_offset, y_offset) for top right
            "bottom_right": (1, 1) # Example: (x_offset, y_offset) for bottom right
        }
        self.target_column["grid_positions"] = {
            "top_left": (0, 0),    # Example: (x_offset, y_offset) for top left
            "bottom_left": (0, 1)  # Example: (x_offset, y_offset) for bottom left
        }

        # Add labels to columns for debug output
        self.source_column["label"] = "Source Attributes"
        self.target_column["label"] = "Target Attributes"

        # Create occlusion grids for each corner and collect them in a list
        self.occlusion_grids = [
            self.create_occlusion_grid(self.source_column, corner="top_right", occluded_sockets=[], occlusion_direction="top"),
            self.create_occlusion_grid(self.source_column, corner="bottom_right", occluded_sockets=[], occlusion_direction="bottom"),
            self.create_occlusion_grid(self.target_column, corner="top_left", occluded_sockets=[], occlusion_direction="top"),
            self.create_occlusion_grid(self.target_column, corner="bottom_left", occluded_sockets=[], occlusion_direction="bottom"),
        ]

        # Overlay for curves (added after columns, before bottom row)
        # You can adjust the grid_x_offset and grid_y_offset here (in pixels)
        self.curve_overlay = CurveOverlay(
            self,
            get_connections=lambda: self.connections,
            get_dragging=lambda: hasattr(self, 'dragging_connection') and self.dragging_connection,
            get_drag_info=self._get_drag_info,
            get_target_socket_connection_count=self.get_target_socket_connection_count,
            grid_x_offset=0,  # Example: 20 to shift right
            grid_y_offset=0   # Example: -10 to shift up
        )
        self.curve_overlay.setGeometry(0, 0, self.width(), self.height())
        self.curve_overlay.raise_()
        widget_registry.register(self.curve_overlay, "curve_overlay")

        # --- Robust overlay update: install event filter on list widget viewports ---
        self.source_column["list_widget"].viewport().installEventFilter(self)
        self.target_column["list_widget"].viewport().installEventFilter(self)

        # --- Ensure curve overlay updates on scroll ---
        self.source_column["list_widget"].verticalScrollBar().valueChanged.connect(self.curve_overlay.update)
        self.target_column["list_widget"].verticalScrollBar().valueChanged.connect(self.curve_overlay.update)
        # --- Ensure grid boxes update on scroll/resize ---
        self.source_column["list_widget"].verticalScrollBar().valueChanged.connect(self.update_grid_boxes)
        self.target_column["list_widget"].verticalScrollBar().valueChanged.connect(self.update_grid_boxes)

        # --- Bottom row with Close and Apply buttons ---
        bottom_row = QtWidgets.QHBoxLayout()
        self.close_button = QtWidgets.QPushButton("Close")
        self.apply_button = QtWidgets.QPushButton("Apply")
        widget_registry.register(self.close_button, "close_button")
        widget_registry.register(self.apply_button, "apply_button")
        bottom_row.addWidget(self.close_button)
        bottom_row.addWidget(self.apply_button)
        main_layout.addLayout(bottom_row)

        # Connect signals to slots for bottom row
        self.close_button.clicked.connect(self.terminate_script)
        self.apply_button.clicked.connect(self.apply_connections)
    def safe_get_widget(self, name=None, obj_id=None):
        # Use the registry for safe widget access
        return widget_registry.get(name=name, obj_id=obj_id)

    def safe_delete_widget(self, widget):
        # Helper to safely delete a widget, only if not referenced elsewhere
        if widget is not None:
            widget_registry.unregister(widget)
            widget.setParent(None)
            widget.deleteLater()

    def update_grid_boxes(self):
        # Recalculate and move all grid anchor boxes to the list widget edges in main window coordinates
        if not hasattr(self, '_grid_boxes'):
            return
        for grid in self.occlusion_grids:
            corner = grid['corner']
            column = grid['parent_column']
            list_widget = column["list_widget"]
            rect = list_widget.rect()
            if corner == "top_left":
                pt = list_widget.mapTo(self, rect.topLeft())
            elif corner == "top_right":
                pt = list_widget.mapTo(self, rect.topRight())
            elif corner == "bottom_left":
                pt = list_widget.mapTo(self, rect.bottomLeft())
            elif corner == "bottom_right":
                pt = list_widget.mapTo(self, rect.bottomRight())
            else:
                continue
            if corner in self._grid_boxes:
                box = self._grid_boxes[corner]
                if widget_registry.is_valid(box):
                    box.move(pt.x() - 12, pt.y() - 12)

    def eventFilter(self, obj, event):
        # Always update overlay and grid boxes on paint, scroll, resize, or move events from list widget viewports
        if event.type() in [QtCore.QEvent.Paint, QtCore.QEvent.Resize, QtCore.QEvent.Wheel, QtCore.QEvent.Move, QtCore.QEvent.LayoutRequest, QtCore.QEvent.UpdateRequest, QtCore.QEvent.Scroll]:
            if hasattr(self, 'curve_overlay'):
                self.curve_overlay.update()
            if hasattr(self, 'update_grid_boxes'):
                self.update_grid_boxes()
        return super(AttributeConnectorUI, self).eventFilter(obj, event)

    def get_target_socket_connection_count(self, socket):
        """Return the number of connections to a given target socket."""
        return sum(1 for _, t, _ in self.connections if t == socket)


    def terminate_script(self):
        print("Close button pressed. Closing UI.")
        self.close()

    def apply_connections(self):
        print("Apply button pressed. (Implement connection logic here)")
        # Placeholder: implement actual apply logic as needed







    def resizeEvent(self, event):
        super().resizeEvent(event)
        self.curve_overlay.setGeometry(0, 0, self.width(), self.height())
        if hasattr(self, 'update_grid_boxes'):
            self.update_grid_boxes()

    def _get_drag_info(self):
        # Always use the center of the socket for the start
        if hasattr(self, 'dragging_connection') and self.dragging_connection:
            # Map start to overlay coordinates
            start = self.curve_overlay.mapFromGlobal(self.connection_start_socket.mapToGlobal(self.connection_start_socket.rect().center()))
            snap_radius = 20
            nearest_socket = self.find_nearest_socket(self.current_drag_pos, snap_radius=snap_radius, exclude_socket=self.connection_start_socket)
            if nearest_socket:
                end = self.curve_overlay.mapFromGlobal(nearest_socket.mapToGlobal(nearest_socket.rect().center()))
            else:
                end = self.curve_overlay.mapFromGlobal(self.current_drag_pos)
            color = self.connection_start_socket._color if hasattr(self, 'connection_start_socket') else QtCore.Qt.white
            return start, end, color
        return None, None, QtCore.Qt.white

    def generate_pastel_palette(self, n):
        """Generate n pastel colors as QColor objects evenly spaced in hue."""
        colors = []
        for i in range(n):
            hue = i / n
            r, g, b = colorsys.hsv_to_rgb(hue, 0.5, 1.0)
            colors.append(QtGui.QColor(int(r*255), int(g*255), int(b*255)))
        return colors

    def create_custom_icon(self, color, shape="plus"):
        """
        Create a custom icon using QPainter.
        :param color: The outline color of the icon (e.g., QtCore.Qt.white).
        :param shape: The shape of the icon ("plus" or "minus").
        :return: QIcon object.
        """
        pixmap = QtGui.QPixmap(32, 32)
        pixmap.fill(QtCore.Qt.transparent)
        painter = QtGui.QPainter(pixmap)
        painter.setRenderHint(QtGui.QPainter.Antialiasing)  # Enable anti-aliasing

        # Draw outline
        pen = QtGui.QPen(color)
        pen.setWidth(3)
        painter.setPen(pen)

        if shape == "plus":
            # Draw a plus sign outline
            painter.drawLine(16, 8, 16, 24)  # Vertical line
            painter.drawLine(8, 16, 24, 16)  # Horizontal line
        elif shape == "minus":
            # Draw a minus sign outline
            painter.drawLine(8, 16, 24, 16)  # Horizontal line

        painter.end()
        return QtGui.QIcon(pixmap)

    def create_attribute_column(self, label_text, socket_position, parent_frame=None):
        column = {}
        layout = QtWidgets.QVBoxLayout()
        layout.setContentsMargins(12, 12, 12, 12)
        # Top row with label and buttons
        top_row = QtWidgets.QHBoxLayout()
        label = QtWidgets.QLabel(label_text)
        label.setStyleSheet("border: none; font-weight: bold; color: white;")
        add_button = QtWidgets.QPushButton()
        add_button.setIcon(self.create_custom_icon(QtCore.Qt.white, "plus"))
        remove_button = QtWidgets.QPushButton()
        remove_button.setIcon(self.create_custom_icon(QtCore.Qt.white, "minus"))
        top_row.addWidget(label)
        top_row.addWidget(add_button)
        top_row.addWidget(remove_button)
        layout.addLayout(top_row)
        # List widget
        list_widget = QtWidgets.QListWidget()
        list_widget.setFixedWidth(200)
        layout.addWidget(list_widget)
        column["layout"] = layout
        column["list_widget"] = list_widget
        column["add_button"] = add_button
        column["remove_button"] = remove_button
        column["socket_position"] = socket_position

        # Connect add/remove buttons to their slots
        add_button.clicked.connect(lambda: self.add_item(list_widget, socket_position))
        remove_button.clicked.connect(lambda: self.remove_item(list_widget))

        if parent_frame is not None:
            parent_frame.setLayout(layout)
        return column

    def create_list_item_with_socket(self, text, socket_position="right"):
        """Create a custom list item with an embedded socket."""
        widget = QtWidgets.QWidget()
        layout = QtWidgets.QHBoxLayout(widget)
        layout.setContentsMargins(8, 6, 8, 6)  # Increased margins: left, top, right, bottom

        # Assign color for source sockets
        if socket_position == "left":
            # Create the socket button on the left
            socket = QtWidgets.QPushButton()
            socket.setFixedSize(12, 12)  # Revert to fixed size
            socket.setStyleSheet("background-color: white; border-radius: 6px;")
            socket._is_target = True
            socket._color = QtGui.QColor("white")
            layout.addWidget(socket)

        # Create the label for the item text
        label = QtWidgets.QLabel(f"{text} [{self.item_counter}]")  # Add unique ID to label
        label.setStyleSheet("border: none; font-weight: normal; color: white;")
        layout.addWidget(label)

        if socket_position == "right":
            # Create the socket button on the right
            socket = QtWidgets.QPushButton()
            socket.setFixedSize(12, 12)
            color = self.pastel_colors[self.item_counter % len(self.pastel_colors)]
            socket.setStyleSheet(f"background-color: {color.name()}; border-radius: 6px;")
            socket._is_target = False
            socket._color = color
            layout.addWidget(socket)

        # Enable drag-and-drop for the socket
        socket.setAcceptDrops(True)
        socket.mousePressEvent = lambda event: self.start_connection(event, socket)
        socket.mouseReleaseEvent = lambda event: self.complete_connection(event, socket)

        widget.socket = socket  # Store the socket for reference
        widget.label = label.text()  # Store the label text for reference
        self.item_counter += 1  # Increment the counter for the next item
        return widget

    def start_connection(self, event, socket):
        """Start a connection from the given socket."""
        self.connection_start_socket = socket
        self.connection_start_pos = socket.mapToGlobal(socket.rect().center())
        self.dragging_connection = True  # Flag to indicate active dragging
        self.current_drag_pos = self.connection_start_pos  # Initialize drag position
        print(f"Connection started from socket: {socket.parent().label}")
        self.grabMouse()  # Ensure we receive all mouse move events
        self.update()

    def mouseMoveEvent(self, event):
        """Track the mouse movement to update the drag position."""
        if hasattr(self, 'dragging_connection') and self.dragging_connection:
            pos = event.position().toPoint() if hasattr(event, 'position') else event.pos()
            self.current_drag_pos = self.mapToGlobal(pos)
            self.update()

    def complete_connection(self, event, socket):
        """Complete a connection to the nearest valid socket or discard it."""
        if hasattr(self, 'dragging_connection') and self.dragging_connection:
            self.dragging_connection = False
            pos = event.position().toPoint() if hasattr(event, 'position') else event.pos()
            self.connection_end_pos = self.mapToGlobal(pos)
            print(f"Bezier curve final end position: {self.connection_end_pos}")

            # Find the nearest socket
            nearest_socket = self.find_nearest_socket(self.connection_end_pos)

            if nearest_socket and self.is_valid_connection(self.connection_start_socket, nearest_socket):
                start_label = self.connection_start_socket.parent().label
                end_label = nearest_socket.parent().label
                print(f"Connection made between {start_label} and {end_label}.")
                self.visualize_connection(nearest_socket)
            else:
                print("Connection discarded.")

            self.connection_start_socket = None
            self.releaseMouse()  # Release mouse grab after drag
            self.update()

    def mouseReleaseEvent(self, event):
        """Ensure drag operation ends and mouse is released on mouse button release anywhere."""
        if hasattr(self, 'dragging_connection') and self.dragging_connection:
            self.dragging_connection = False
            pos = event.position().toPoint() if hasattr(event, 'position') else event.pos()
            self.connection_end_pos = self.mapToGlobal(pos)
            print(f"Bezier curve final end position: {self.connection_end_pos}")
            # Find the nearest socket
            nearest_socket = self.find_nearest_socket(self.connection_end_pos)
            if nearest_socket and self.is_valid_connection(self.connection_start_socket, nearest_socket):
                start_label = self.connection_start_socket.parent().label
                end_label = nearest_socket.parent().label
                print(f"Connection made between {start_label} and {end_label}.")
                self.visualize_connection(nearest_socket)
            else:
                print("Connection discarded.")
            self.connection_start_socket = None
            self.releaseMouse()  # Release mouse grab after drag
            self.update()
        # Call base implementation for normal event propagation
        super().mouseReleaseEvent(event)

    def find_nearest_socket(self, position, snap_radius=50, exclude_socket=None):
        """Find the nearest socket to the given position within snap_radius. Optionally exclude a socket."""
        min_distance = float('inf')
        nearest_socket = None
        for column in [self.source_column, self.target_column]:
            for i in range(column["list_widget"].count()):
                item = column["list_widget"].item(i)
                widget = column["list_widget"].itemWidget(item)
                socket = widget.socket
                if exclude_socket is not None and socket == exclude_socket:
                    continue
                socket_pos = socket.mapToGlobal(socket.rect().center())
                distance = (socket_pos - position).manhattanLength()
                if distance < min_distance and distance < snap_radius:
                    min_distance = distance
                    nearest_socket = socket
        return nearest_socket

    def is_valid_connection(self, start_socket, end_socket):
        """Check if the connection between two sockets is valid."""
        if start_socket == end_socket:
            print("Invalid connection: Cannot connect a socket to itself.")
            return False

        start_column = self.get_socket_column(start_socket)
        end_column = self.get_socket_column(end_socket)

        if start_column == end_column:
            print("Invalid connection: Cannot connect sockets within the same column.")
            return False

        print("Valid connection.")
        return True

    def get_socket_column(self, socket):
        """Determine if the socket belongs to the Source or Target column."""
        if socket in [self.source_column["list_widget"].itemWidget(self.source_column["list_widget"].item(i)).socket
                      for i in range(self.source_column["list_widget"].count())]:
            return "source"
        elif socket in [self.target_column["list_widget"].itemWidget(self.target_column["list_widget"].item(i)).socket
                        for i in range(self.target_column["list_widget"].count())]:
            return "target"
        return None

    def visualize_connection(self, end_socket):
        """Visualize the connection between two sockets using a proper Bezier curve, preventing duplicates."""
        if hasattr(self, 'connection_start_socket') and end_socket:
            # Prevent duplicate connections (order matters: source, target)
            for src, tgt, _ in self.connections:
                if src == self.connection_start_socket and tgt == end_socket:
                    print("Connection already exists. No new curve created.")
                    return
            color = self.connection_start_socket._color
            self.connections.append((self.connection_start_socket, end_socket, color))
            # Set the target socket color to match the source
            if hasattr(end_socket, '_is_target') and end_socket._is_target:
                end_socket._color = color
                end_socket.setStyleSheet(f"background-color: {color.name()}; border-radius: 6px;")
            print("Bezier curve visualized.")
        self.update()

    def update(self, *args, **kwargs):
        super().update(*args, **kwargs)
        if hasattr(self, 'curve_overlay'):
            self.curve_overlay.update()

    def paintEvent(self, event):
        # Only paint the widget itself, not the curves
        super(AttributeConnectorUI, self).paintEvent(event)

    def add_item(self, list_widget, socket_position="right"):
        """Add a new item with an embedded socket to the list widget."""
        item = QtWidgets.QListWidgetItem()
        item_widget = self.create_list_item_with_socket("New Item", socket_position)
        item.setSizeHint(item_widget.sizeHint())
        list_widget.addItem(item)
        list_widget.setItemWidget(item, item_widget)
        self.update_item_backgrounds(list_widget)

    def update_item_backgrounds(self, list_widget):
        """Update the background colors of items in the list widget based on their index."""
        for i in range(list_widget.count()):
            list_item = list_widget.item(i)
            widget = list_widget.itemWidget(list_item)
            if i % 2 == 0:
                widget.setStyleSheet("background-color: rgb(36, 36, 36); border: none;")  # Dark gray, no border
            else:
                widget.setStyleSheet("background-color: rgb(30, 30, 30); border: none;")  # Darker gray, no border

    def remove_item(self, list_widget):
        """Remove selected items and their associated sockets."""
        for item in list_widget.selectedItems():
            row = list_widget.row(item)
            list_widget.takeItem(row)
        self.update_item_backgrounds(list_widget)

    def apply_connections(self):
        selected_objects_list = cmds.ls(selection=True)
        print(f"selected_objects_list: {selected_objects_list}")
        if not selected_objects_list:
            print("No objects selected. Please select at least one curve.")
            return

        active_object = selected_objects_list[-1]
        print(f"active_object: {active_object}")

        target_objects_list = selected_objects_list[:-1]
        print(f"target_objects_list: {target_objects_list}")

        if not target_objects_list:
            print("Only one object selected. Need at least two objects (targets + source).")
            return

        # Use connect_node_attribute function
        # DO NOT MODIFY: Fixed syntax error in this for loop
        for i in range(self.target_column["list_widget"].count()):
            target_attribute = self.target_column["list_widget"].item(i).text()
            for j in range(self.source_column["list_widget"].count()):
                source_attribute = self.source_column["list_widget"].item(j).text()
                connect_node_attribute(active_object, source_attribute, target_attribute, operation_selection=1)

    def terminate_script(self):
        self.setWindowOpacity(0)  # Make the window fully transparent
        self.close()  # Close only the UI window

    def rename_item(self, item):
        # Ensure the item is editable
        item.setFlags(item.flags() | QtCore.Qt.ItemIsEditable)
        # Trigger editing for the item
        list_widget = item.listWidget()
        if list_widget:  # Ensure the item belongs to a list widget
            list_widget.editItem(item)

    def deselect_items(self):
        """Deselect all items in both list widgets."""
        self.source_column["list_widget"].clearSelection()
        self.target_column["list_widget"].clearSelection()

    def toggle_selection(self, item):
        """Toggle selection state of the clicked item on mouse release."""
        list_widget = item.listWidget()

        def handle_mouse_release():
            if item.isSelected():
                item.setSelected(False)  # Deselect the item
            else:
                item.setSelected(True)  # Select the item

        list_widget.viewport().setMouseTracking(True)
        list_widget.viewport().mouseReleaseEvent = lambda event: handle_mouse_release()

    def create_occlusion_grid(self, column, corner, occluded_sockets, occlusion_direction, grid_x_offset=0, grid_y_offset=0):
        # Print all 4 corners of the viewport in global coordinates
        viewport = column["list_widget"].viewport()
        rect = viewport.rect()
        tl = viewport.mapToGlobal(rect.topLeft())
        tr = viewport.mapToGlobal(rect.topRight())
        bl = viewport.mapToGlobal(rect.bottomLeft())
        br = viewport.mapToGlobal(rect.bottomRight())
        print(f"[ViewportCorners] {column.get('label', 'unknown')}: TL={{ {tl.x()}, {tl.y()} }} TR={{ {tr.x()}, {tr.y()} }} BL={{ {bl.x()}, {bl.y()} }} BR={{ {br.x()}, {br.y()} }}")
        """
        Create an occlusion grid for a specific column and corner.
        Args:
            column: The column dict (e.g., self.source_column or self.target_column)
            corner: One of 'top_left', 'top_right', 'bottom_left', 'bottom_right'
            occluded_sockets: List of socket widgets that are occluded for this grid
            occlusion_direction: 'top' or 'bottom' (where the sockets are occluded from)
            grid_x_offset, grid_y_offset: Additional pixel offsets for fine-tuning
        Returns: dict with grid info (for future use)
        """

        # Determine base position for the grid based on corner (in global coordinates)
        viewport = column["list_widget"].viewport()
        rect = viewport.rect()
        grid_offset_y = 32  # px, adjust as needed for grid size
        if corner == "top_left":
            pt = viewport.mapToGlobal(rect.topLeft())
        elif corner == "top_right":
            pt = viewport.mapToGlobal(rect.topRight())
        elif corner in ("bottom_left", "bottom_right"):
            list_widget = column["list_widget"]
            last_visible_y = None
            for i in reversed(range(list_widget.count())):
                item = list_widget.item(i)
                widget = list_widget.itemWidget(item)
                if widget is not None:
                    widget_center = widget.mapTo(viewport, widget.rect().center())
                    if 0 <= widget_center.y() <= rect.height():
                        global_center = widget.mapToGlobal(widget.rect().center())
                        last_visible_y = global_center.y()
                        break
            viewport_bottom_y = viewport.mapToGlobal(rect.bottomLeft()).y()
            anchor_y = min(last_visible_y, viewport_bottom_y) if last_visible_y is not None else viewport_bottom_y
            if corner == "bottom_left":
                anchor_x = viewport.mapToGlobal(rect.bottomLeft()).x()
            else:
                anchor_x = viewport.mapToGlobal(rect.bottomRight()).x()
            pt = QtCore.QPoint(anchor_x, anchor_y - grid_offset_y)
        else:
            raise ValueError(f"Unknown corner: {corner}")
        base_x, base_y = pt.x(), pt.y()
        print(f"[OcclusionGrid] Created grid at corner '{corner}' with anchor ({{ {pt.x()}, {pt.y()} }}) for column '{column.get('label', 'unknown')}'")

        # --- Debug: Add colored GroupBox at grid anchor (dynamic) ---
        if not hasattr(self, '_grid_boxes'):
            self._grid_boxes = {}
        color_map = {
            'top_left': 'red',
            'top_right': 'green',
            'bottom_left': 'blue',
            'bottom_right': 'yellow',
        }
        if corner not in self._grid_boxes:
            box = QtWidgets.QGroupBox(f"{corner}", self)
            box.setStyleSheet(f"QGroupBox {{ background: {color_map.get(corner, 'gray')}; border: 2px solid black; border-radius: 6px; }}")
            box.setFixedSize(24, 24)
            box.show()
            box.raise_()
            self._grid_boxes[corner] = box
        box = self._grid_boxes[corner]
        box.move(pt.x() - 12, pt.y() - 12)
        # Store grid info for later use (actual widget/overlay creation can be added as needed)
        grid_info = {
            "parent_column": column,
            "corner": corner,
            "base_x": base_x,
            "base_y": base_y,
            "occluded_sockets": occluded_sockets,
            "occlusion_direction": occlusion_direction,
            "grid_x_offset": grid_x_offset,
            "grid_y_offset": grid_y_offset
        }
        return grid_info

