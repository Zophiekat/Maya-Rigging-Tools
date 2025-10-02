import weakref

# WidgetRegistry for safe widget tracking and access
class WidgetRegistry:
    def __init__(self):
        self._widgets_by_name = {}
        self._widgets_by_id = {}

    def register(self, widget, name=None):
        if name is None:
            name = widget.objectName() or f"widget_{id(widget)}"
        widget.setObjectName(name)
        self._widgets_by_name[name] = weakref.ref(widget)
        self._widgets_by_id[id(widget)] = weakref.ref(widget)

    def get(self, name=None, obj_id=None):
        if name and name in self._widgets_by_name:
            w = self._widgets_by_name[name]()
            if w is not None and self.is_valid(w):
                return w
        if obj_id and obj_id in self._widgets_by_id:
            w = self._widgets_by_id[obj_id]()
            if w is not None and self.is_valid(w):
                return w
        return None

    def unregister(self, widget):
        name = widget.objectName()
        obj_id = id(widget)
        self._widgets_by_name.pop(name, None)
        self._widgets_by_id.pop(obj_id, None)

    def is_valid(self, widget):
        try:
            return widget is not None and hasattr(widget, 'parent') and widget.parent() is not None
        except RuntimeError:
            return False

    def all_widgets(self):
        return [w() for w in self._widgets_by_id.values() if w() is not None]

# Instantiate a global registry
widget_registry = WidgetRegistry()
import sys
import os
import math
import colorsys


# Check if running in Maya environment
is_maya = False
if "maya" in sys.executable.lower():
    is_maya = True

if is_maya:
    from maya import cmds
else:
    print("Not running in Maya environment. Maya packages will not be imported.")

# Adjust PySide import based on environment
if is_maya:
    from PySide2 import QtWidgets, QtCore, QtGui
else:
    try:
        from PySide6 import QtWidgets, QtCore, QtGui
    except ImportError as e:
        print("PySide6 is not installed. Please install it using 'pip install PySide6'.")
        raise e


############################################################
# Standalone per-corner grid get_socket_pos_and_occlusion (for reference/testing, not used in class)
def get_socket_pos_and_occlusion(
    column, index, total, grid_positions, occlusion_grid, occluded_indices, corner=None
):
    """
    Returns the position for a socket, handling occlusion via per-corner grids.
    If the socket is occluded, it is placed on the grid at the specified corner.
    Otherwise, it is placed at its normal position in the column.
    Args:
        column: The column (input/output) this socket belongs to.
        index: The index of the socket in the column.
        total: Total number of sockets in the column.
        grid_positions: List of normal (non-occluded) socket positions for this column.
        occlusion_grid: Dict of per-corner grid positions, e.g. {'top_left': [...], 'bottom_right': [...]}.
        occluded_indices: List of indices in this column that are occluded.
        corner: Which corner's grid to use for occluded sockets (e.g. 'top_left').
    Returns:
        (pos, is_occluded, corner):
            pos: (x, y) position for the socket
            is_occluded: True if the socket is occluded
            corner: Which corner grid was used (if occluded)
    """
    if index in occluded_indices:
        # Occluded: use the per-corner grid
        if corner is None:
            # Default to 'top_left' if not specified
            corner = 'top_left'
        grid = occlusion_grid.get(corner, [])
        grid_index = occluded_indices.index(index)
        if grid_index < len(grid):
            pos = grid[grid_index]
            return pos, True, corner
        else:
            # Fallback: use the last grid position
            return grid[-1] if grid else (0, 0), True, corner
    else:
        # Not occluded: use the normal column position
        pos = grid_positions[index]
        return pos, False, None


def connect_node_attribute(source_node, source_attribute, target_attribute, operation_selection):
    """
    Connects or disconnects the source_node.source_attribute to selected target nodes' target_attribute.
    
    operation_selection: 0 = disconnect, 1 = connect
    
    When connecting (operation_selection = 1), automatically disconnects any existing 
    connections to the target attribute before making the new connection.
    """
    
    target_nodes_list = cmds.ls(selection=True)
    operation_type = [cmds.disconnectAttr, cmds.connectAttr]
    
    for target_node in target_nodes_list:
        full_target_attr = f"{target_node}.{target_attribute}"
        
        # Check existing connections
        connections = cmds.listConnections(full_target_attr, source=True, destination=False, plugs=True)
        
        if connections:
            print(f"{full_target_attr} is already connected to: {connections}")
            
            # If we're connecting (operation_selection = 1), disconnect existing connections first
            if operation_selection == 1:
                print(f"Disconnecting existing connections before new connection...")
                for existing_connection in connections:
                    try:
                        cmds.disconnectAttr(existing_connection, full_target_attr)
                        print(f"Disconnected: {existing_connection} -> {full_target_attr}")
                    except Exception as e:
                        print(f"Failed to disconnect {existing_connection}: {e}")
        else:
            print(f"No existing connections found for {full_target_attr}")
        
        # Perform the main operation
        try:
            connection_result = operation_type[operation_selection](f"{source_node}.{source_attribute}", full_target_attr, force=True)
            print(f"{operation_type[operation_selection].__name__} executed for {source_node}.{source_attribute} -> {full_target_attr}")
        except Exception as e:
            print(f"Failed to {operation_type[operation_selection].__name__} {full_target_attr}: {e}")


class CurveOverlay(QtWidgets.QWidget):
    def __init__(self, parent, get_connections, get_dragging, get_drag_info, get_target_socket_connection_count, grid_x_offset=0, grid_y_offset=0):
        super().__init__(parent)
        self.get_connections = get_connections
        self.get_dragging = get_dragging
        self.get_drag_info = get_drag_info
        self.get_target_socket_connection_count = get_target_socket_connection_count
        self.setAttribute(QtCore.Qt.WA_TransparentForMouseEvents)
        self.setAttribute(QtCore.Qt.WA_NoSystemBackground)
        self.setAttribute(QtCore.Qt.WA_TranslucentBackground)
        self.setMouseTracking(True)
        # Grid position offsets in pixels
        self.grid_x_offset = grid_x_offset
        self.grid_y_offset = grid_y_offset

    def paintEvent(self, event):
        painter = QtGui.QPainter(self)
        painter.setRenderHint(QtGui.QPainter.Antialiasing)

        # Track occluded sockets for arc placement
        occlusion_map = {}

        for source_socket, target_socket, color in self.get_connections():
            # Unpack occluded diameter if present
            start_result = self.get_socket_pos_and_occlusion(source_socket, occlusion_map)
            if len(start_result) == 5:
                start, start_occluded, start_arc_side, start_side, start_diam = start_result
            else:
                start, start_occluded, start_arc_side, start_side = start_result
                start_diam = 16
            end_result = self.get_socket_pos_and_occlusion(target_socket, occlusion_map)
            if len(end_result) == 5:
                end, end_occluded, end_arc_side, end_side, end_diam = end_result
            else:
                end, end_occluded, end_arc_side, end_side = end_result
                end_diam = 16
            path = QtGui.QPainterPath()
            path.moveTo(start)
            control_point_1 = QtCore.QPointF(start.x() + 50, start.y())
            control_point_2 = QtCore.QPointF(end.x() - 50, end.y())
            path.cubicTo(control_point_1, control_point_2, end)
            # Draw black outline (no fill)
            pen = QtGui.QPen(QtCore.Qt.black)
            pen.setWidth(5)
            pen.setCapStyle(QtCore.Qt.RoundCap)
            painter.setPen(pen)
            painter.setBrush(QtCore.Qt.NoBrush)
            painter.drawPath(path)
            # Draw colored curve (no fill)
            pen = QtGui.QPen(color)
            pen.setWidth(2)
            pen.setCapStyle(QtCore.Qt.RoundCap)
            painter.setPen(pen)
            painter.setBrush(QtCore.Qt.NoBrush)
            painter.drawPath(path)
            # Draw tapers at occluded ends (always set brush and pen right before drawing)
            if start_occluded:
                painter.setBrush(color)
                painter.setPen(QtGui.QPen(QtCore.Qt.black, 2))
                painter.drawEllipse(start, start_diam // 2, start_diam // 2)
            if end_occluded:
                painter.setBrush(color)
                painter.setPen(QtGui.QPen(QtCore.Qt.black, 2))
                painter.drawEllipse(end, end_diam // 2, end_diam // 2)
        # Draw dragging connection with tapers at both ends (smaller circles)
        if self.get_dragging():
            start, end, color = self.get_drag_info()
            path = QtGui.QPainterPath()
            path.moveTo(start)
            control_point_1 = QtCore.QPointF(start.x() + 50, start.y())
            control_point_2 = QtCore.QPointF(end.x() - 50, end.y())
            path.cubicTo(control_point_1, control_point_2, end)
            pen = QtGui.QPen(QtCore.Qt.black)
            pen.setWidth(5)
            pen.setCapStyle(QtCore.Qt.RoundCap)
            painter.setPen(pen)
            painter.drawPath(path)
            pen = QtGui.QPen(color)
            pen.setWidth(2)
            pen.setCapStyle(QtCore.Qt.RoundCap)
            painter.setPen(pen)
            painter.drawPath(path)
            # Draw smaller tapers (circles) at both ends
            painter.setBrush(color)
            painter.setPen(QtGui.QPen(QtCore.Qt.black, 2))
            painter.drawEllipse(start, 5, 5)
            painter.drawEllipse(end, 5, 5)

    def get_socket_pos_and_occlusion(self, socket, occlusion_map=None):
        """
        Returns the position of the socket for curve drawing.
        - If visible, returns its position.
        - If occluded, finds the correct occlusion grid and computes the position based on grid anchor (list widget edge in main window coordinates) and offset.
        Terminology:
            position: location in overlay coordinates
            origin: grid's reference corner in main window coordinates
            offset: (x, y) translation from origin
        """
        parent = socket.parent()
        list_widget = None
        side = None
        item_index = None
        for col_name in ("source_column", "target_column"):
            col = getattr(self.parent(), col_name, None)
            if col and hasattr(col["list_widget"], "itemWidget"):
                for i in range(col["list_widget"].count()):
                    item = col["list_widget"].item(i)
                    widget = col["list_widget"].itemWidget(item)
                    if widget and widget.socket is socket:
                        list_widget = col["list_widget"]
                        side = col_name
                        item_index = i
                        break
        if not list_widget:
            return self.mapFromGlobal(socket.mapToGlobal(socket.rect().center())), False, None, None

        # Use the socket widget's rect in the viewport
        socket_rect = socket.geometry()
        socket_pos_in_viewport = socket.mapTo(list_widget.viewport(), socket.rect().center())
        viewport_rect = list_widget.viewport().rect()
        # If the socket is visible in the viewport, use its center
        if viewport_rect.contains(socket_pos_in_viewport):
            return self.mapFromGlobal(socket.mapToGlobal(socket.rect().center())), False, None, None

        # --- Determine if occlusion happened at the top or bottom of the viewport list ---
        if socket_pos_in_viewport.y() < viewport_rect.top():
            occlusion_direction = 'top'
        elif socket_pos_in_viewport.y() > viewport_rect.bottom():
            occlusion_direction = 'bottom'
        else:
            occlusion_direction = 'top'

        # --- Determine which grid (corner) this occluded socket belongs to ---
        parent_ui = self.parent()
        occlusion_grids = getattr(parent_ui, 'occlusion_grids', [])
        grid = None
        if side == 'source_column':
            grid_corner = 'top_right' if occlusion_direction == 'top' else 'bottom_right'
        else:
            grid_corner = 'top_left' if occlusion_direction == 'top' else 'bottom_left'
        for g in occlusion_grids:
            if g['parent_column']['list_widget'] is list_widget and g['corner'] == grid_corner:
                grid = g
                break
        # --- New anchor logic: use list widget edge in main window coordinates ---
        if grid is None:
            # Fallback: use top left of list widget
            anchor_pt = list_widget.mapTo(self, list_widget.rect().topLeft())
        else:
            rect = list_widget.rect()
            if grid_corner == 'top_left':
                anchor_pt = list_widget.mapTo(self, rect.topLeft())
            elif grid_corner == 'top_right':
                anchor_pt = list_widget.mapTo(self, rect.topRight())
            elif grid_corner == 'bottom_left':
                anchor_pt = list_widget.mapTo(self, rect.bottomLeft())
            elif grid_corner == 'bottom_right':
                anchor_pt = list_widget.mapTo(self, rect.bottomRight())
            else:
                anchor_pt = list_widget.mapTo(self, rect.topLeft())
        # Gather all occluded sockets for this grid (by occlusion_map)
        if occlusion_map is not None:
            key = (list_widget, side, grid_corner)
            if key not in occlusion_map:
                occlusion_map[key] = []
            occlusion_map[key].append(socket)
            idx = occlusion_map[key].index(socket)
            total = len(occlusion_map[key])
        else:
            idx = 0
            total = 1
        # Determine grid size
        if total <= 4:
            grid_size = 2
        elif total <= 9:
            grid_size = 3
        else:
            grid_size = 4
        cell_size = 8  # px, can be adjusted
        grid_length = cell_size * grid_size
        # The grid origin is anchor_pt
        grid_origin_x = anchor_pt.x()
        grid_origin_y = anchor_pt.y()
        # Distribute sockets along the perimeter (clockwise from top-left)
        perimeter = (grid_size - 1) * 4
        if total > perimeter:
            perimeter = total  # fallback: allow overlap if too many
        pos_on_perimeter = idx % perimeter
        if pos_on_perimeter < grid_size - 1:
            row = 0
            col = pos_on_perimeter
        elif pos_on_perimeter < 2 * (grid_size - 1):
            row = pos_on_perimeter - (grid_size - 1)
            col = grid_size - 1
        elif pos_on_perimeter < 3 * (grid_size - 1):
            row = grid_size - 1
            col = (grid_size - 1) - (pos_on_perimeter - 2 * (grid_size - 1))
        else:
            row = (grid_size - 1) - (pos_on_perimeter - 3 * (grid_size - 1))
            col = 0
        grid_x = grid_origin_x + col * cell_size + cell_size // 2
        grid_y = grid_origin_y + row * cell_size + cell_size // 2
        overlay_point = QtCore.QPoint(int(round(grid_x)), int(round(grid_y)))
        occluded_diameter = int(16 * 0.5)
        return overlay_point, True, side, None, occluded_diameter


class AttributeConnectorUI(QtWidgets.QWidget):

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


if __name__ == "__main__":
    try:
        app = QtWidgets.QApplication.instance()
        if app is None:
            app = QtWidgets.QApplication([])
        else:
            print("Using existing QApplication instance.")

        ui = AttributeConnectorUI()
        ui.show()
        app.exec()  # Replace deprecated exec_ with exec
    except Exception as e:
        print(f"Error: {e}")


