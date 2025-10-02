import colorsys
import importlib
import json
import os
# Use absolute imports instead of relative
from Attribute_Connector.class_widget_registry import widget_registry
from Attribute_Connector.ui_class_curve_overlay import CurveOverlay
from Attribute_Connector.attribute_connector_maya_utils import connect_node_attribute
from Attribute_Connector.attribute_connector_templates import load_templates, save_current_connections_as_template


def _get_pyside_modules():
    """
    Get the appropriate PySide/Qt modules based on the environment.
    
    Returns:
        tuple: (QtWidgets, QtCore, QtGui, qt_binding)
    
    For Maya 2025+, uses PySide6.
    For Maya 2024 and earlier, uses PySide2.
    Falls back to PySide6 if outside Maya.
    """
    in_maya = False
    maya_version = None
    qt_binding = None
    
    print("Detecting appropriate Qt binding...")
    
    try:
        # Import maya modules conditionally to avoid errors when not in Maya
        import importlib.util
        if importlib.util.find_spec("maya"):
            import maya
            in_maya = True
            import maya.cmds as cmds
            maya_version = int(cmds.about(version=True))
            print(f"Detected Maya version: {maya_version}")
    except Exception as e:
        print(f"Not running in Maya or couldn't detect version: {e}")
    
    # For Maya 2025+, use PySide6
    if in_maya and maya_version and maya_version >= 2025:
        try:
            print("Attempting to use PySide6 (Maya 2025+)")
            PySide6 = importlib.import_module('PySide6')
            QtWidgets = importlib.import_module('PySide6.QtWidgets')
            QtCore = importlib.import_module('PySide6.QtCore')
            QtGui = importlib.import_module('PySide6.QtGui')
            qt_binding = "PySide6"
            print("Successfully loaded PySide6")
            return QtWidgets, QtCore, QtGui, qt_binding
        except ImportError as e:
            print(f"Failed to import PySide6: {e}")
    
    # For Maya 2024 and earlier, use PySide2
    if in_maya:
        try:
            print("Attempting to use PySide2 (Maya 2024 or earlier)")
            PySide2 = importlib.import_module('PySide2')
            QtWidgets = importlib.import_module('PySide2.QtWidgets')
            QtCore = importlib.import_module('PySide2.QtCore')
            QtGui = importlib.import_module('PySide2.QtGui')
            qt_binding = "PySide2"
            print("Successfully loaded PySide2")
            return QtWidgets, QtCore, QtGui, qt_binding
        except ImportError as e:
            print(f"Failed to import PySide2: {e}")
    
    # Final fallback to PySide6 (if available)
    try:
        print("Attempting to use PySide6 as fallback")
        PySide6 = importlib.import_module('PySide6')
        QtWidgets = importlib.import_module('PySide6.QtWidgets')
        QtCore = importlib.import_module('PySide6.QtCore')
        QtGui = importlib.import_module('PySide6.QtGui')
        qt_binding = "PySide6"
        print("Successfully loaded PySide6")
        return QtWidgets, QtCore, QtGui, qt_binding
    except ImportError as e:
        print(f"Failed to import PySide6 as fallback: {e}")
    
    # Last resort - try PySide2
    try:
        print("Attempting to use PySide2 as last resort")
        PySide2 = importlib.import_module('PySide2')
        QtWidgets = importlib.import_module('PySide2.QtWidgets')
        QtCore = importlib.import_module('PySide2.QtCore')
        QtGui = importlib.import_module('PySide2.QtGui')
        qt_binding = "PySide2"
        print("Successfully loaded PySide2")
        return QtWidgets, QtCore, QtGui, qt_binding
    except ImportError as e:
        error_msg = f"Could not import either PySide2 or PySide6. Error: {e}"
        print(error_msg)
        raise ImportError(error_msg)

QtWidgets, QtCore, QtGui, qt_binding = _get_pyside_modules()
print(f"Using {qt_binding} for Attribute Connector")


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

        # Install event filter for keyboard shortcuts
        self.installEventFilter(self)

        # Optimize window management
        self.setAttribute(QtCore.Qt.WA_DeleteOnClose, True)  # Release memory when closed
        self.setAttribute(QtCore.Qt.WA_QuitOnClose, False)   # Don't quit app when this window closes
        
        # Set window flags - Use Widget instead of Tool to reduce window count
        self.setWindowFlags(QtCore.Qt.Widget | QtCore.Qt.WindowStaysOnTopHint)
        self.setWindowTitle("Attribute Connector")

        # Main layout
        main_layout = QtWidgets.QVBoxLayout(self)
        
                # Add source node selection row at the top
        source_node_row = QtWidgets.QHBoxLayout()
        self.source_node_label = QtWidgets.QLabel("Source Node: None")
        self.source_node_label.setStyleSheet("""
            QLabel {
                color: #EEE;
                font-weight: bold;
                font-size: 12px;
                background-color: #333;
                padding: 4px 8px;
                border-radius: 4px;
                border: 1px solid #555;
                min-width: 300px;
            }
        """)
        self.source_node_label.setSizePolicy(
            QtWidgets.QSizePolicy.Expanding,
            QtWidgets.QSizePolicy.Preferred
        )
        self.source_node_label.setWordWrap(True)
        
        self.assign_source_button = QtWidgets.QPushButton("Assign Source Node")
        source_node_row.addWidget(self.source_node_label)
        source_node_row.addWidget(self.assign_source_button)
        main_layout.addLayout(source_node_row)
        
        # Add options row with checkbox for auto-populating attributes and template selection
        options_row = QtWidgets.QHBoxLayout()
        
        # Auto-populate checkbox
        self.auto_populate_checkbox = QtWidgets.QCheckBox("Auto-populate source attributes")
        self.auto_populate_checkbox.setChecked(True)  # Default to enabled for now (can change to False later)
        self.auto_populate_checkbox.setToolTip("When enabled, source attributes will be automatically populated when selecting a source node")
        options_row.addWidget(self.auto_populate_checkbox)
        
        # Add template selection combobox
        options_row.addWidget(QtWidgets.QLabel("Templates:"))
        self.template_combo = QtWidgets.QComboBox()
        self.template_combo.setMinimumWidth(150)
        self.template_combo.setToolTip("Select a connection template")
        widget_registry.register(self.template_combo, "template_combo")
        options_row.addWidget(self.template_combo)
        
        # Template action buttons
        self.apply_template_button = QtWidgets.QPushButton("Apply")
        self.apply_template_button.setToolTip("Apply the selected template")
        self.apply_template_button.setMaximumWidth(60)
        widget_registry.register(self.apply_template_button, "apply_template_button")
        options_row.addWidget(self.apply_template_button)
        
        self.save_template_button = QtWidgets.QPushButton("Save")
        self.save_template_button.setToolTip("Save current connections as a template")
        self.save_template_button.setMaximumWidth(60)
        widget_registry.register(self.save_template_button, "save_template_button")
        options_row.addWidget(self.save_template_button)
        
        options_row.addStretch()  # Add stretch to push everything to the left
        main_layout.addLayout(options_row)
        
        # Connect template buttons
        self.apply_template_button.clicked.connect(self.apply_template)
        self.save_template_button.clicked.connect(self.save_template)
        
        # Load available templates
        self.load_templates()
        
        # Connect source node button
        self.assign_source_button.clicked.connect(self.assign_source_node)
        
        # Store the source node name
        self.source_node_name = None
        
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


        # Add labels to columns for debug output
        self.source_column["label"] = "Source Attributes"
        self.target_column["label"] = "Target Attributes"

        self.curve_overlay = CurveOverlay(
            self,
            get_connections=lambda: self.connections,
            get_dragging=lambda: hasattr(self, 'dragging_connection') and self.dragging_connection,
            get_drag_info=self._get_drag_info,

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

    def eventFilter(self, obj, event):
        try:
            # Handle keyboard shortcuts with PySide2/PySide6 compatibility
            # Get the correct event type enum based on PySide version
            key_press_event = QtCore.QEvent.KeyPress
            if hasattr(QtCore.QEvent, 'Type'):  # PySide6 style
                if hasattr(QtCore.QEvent.Type, 'KeyPress'):
                    key_press_event = QtCore.QEvent.Type.KeyPress
            
            if event.type() == key_press_event:
                # Get the correct key constants based on PySide version
                key_f2 = QtCore.Qt.Key_F2
                key_delete = QtCore.Qt.Key_Delete
                
                # PySide6 uses different enum structure
                if hasattr(QtCore.Qt, 'Key'):  # PySide6 style
                    if hasattr(QtCore.Qt.Key, 'F2'):
                        key_f2 = QtCore.Qt.Key.F2
                    if hasattr(QtCore.Qt.Key, 'Delete'):
                        key_delete = QtCore.Qt.Key.Delete
                
                # F2 key for renaming
                if event.key() == key_f2:
                    # Get the current active list widget
                    active_list = None
                    if hasattr(self, 'source_column') and self.source_column["list_widget"].hasFocus():
                        active_list = self.source_column["list_widget"]
                    elif hasattr(self, 'target_column') and self.target_column["list_widget"].hasFocus():
                        active_list = self.target_column["list_widget"]
                    
                    # If we have an active list and a selected item, rename it
                    if active_list and active_list.currentItem():
                        self.handle_item_double_clicked(active_list.currentItem())
                        return True
                        
                # Delete key for removing items
                elif event.key() == key_delete:
                    # Get the current active list widget
                    active_list = None
                    if hasattr(self, 'source_column') and self.source_column["list_widget"].hasFocus():
                        active_list = self.source_column["list_widget"]
                    elif hasattr(self, 'target_column') and self.target_column["list_widget"].hasFocus():
                        active_list = self.target_column["list_widget"]
                    
                    # If we have an active list, remove the selected items
                    if active_list:
                        self.remove_item(active_list)
                        return True
            
            # Always update overlay and grid boxes on paint, scroll, resize, or move events from list widget viewports
            # Get the correct event types based on PySide version
            event_types = []
            
            # Handle differences between PySide2 and PySide6 enums
            if hasattr(QtCore.QEvent, 'Type'):  # PySide6 style
                event_map = {
                    'Paint': QtCore.QEvent.Type.Paint if hasattr(QtCore.QEvent.Type, 'Paint') else None,
                    'Resize': QtCore.QEvent.Type.Resize if hasattr(QtCore.QEvent.Type, 'Resize') else None,
                    'Wheel': QtCore.QEvent.Type.Wheel if hasattr(QtCore.QEvent.Type, 'Wheel') else None,
                    'Move': QtCore.QEvent.Type.Move if hasattr(QtCore.QEvent.Type, 'Move') else None,
                    'LayoutRequest': QtCore.QEvent.Type.LayoutRequest if hasattr(QtCore.QEvent.Type, 'LayoutRequest') else None,
                    'UpdateRequest': QtCore.QEvent.Type.UpdateRequest if hasattr(QtCore.QEvent.Type, 'UpdateRequest') else None,
                    'Scroll': QtCore.QEvent.Type.Scroll if hasattr(QtCore.QEvent.Type, 'Scroll') else None
                }
                event_types = [e for e in event_map.values() if e is not None]
            else:  # PySide2 style
                event_types = [
                    QtCore.QEvent.Paint, 
                    QtCore.QEvent.Resize, 
                    QtCore.QEvent.Wheel, 
                    QtCore.QEvent.Move, 
                    QtCore.QEvent.LayoutRequest, 
                    QtCore.QEvent.UpdateRequest, 
                    QtCore.QEvent.Scroll
                ]
            
            if event.type() in event_types:
                if hasattr(self, 'curve_overlay'):
                    self.curve_overlay.update()
            
            # Use direct parent method call
            return QtWidgets.QWidget.eventFilter(self, obj, event)
            
        except Exception as e:
            # This helps prevent cascade errors
            print(f"Error in eventFilter: {e}")
            # Fallback to default behavior
            return False


    # Note: Main terminate_script and apply_connections methods are defined below







    def resizeEvent(self, event):
        super().resizeEvent(event)
        self.curve_overlay.setGeometry(0, 0, self.width(), self.height())

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
        
        # Enable selection and clicking behavior
        list_widget.setSelectionMode(QtWidgets.QAbstractItemView.ExtendedSelection)
        list_widget.setFocusPolicy(QtCore.Qt.StrongFocus)
        list_widget.itemClicked.connect(self.handle_item_clicked)
        
        # Enable editing on double-click (both on the item and through our custom handler)
        list_widget.itemDoubleClicked.connect(self.handle_item_double_clicked)
        # Set edit triggers but also handle F2 key press for renaming
        list_widget.setEditTriggers(QtWidgets.QAbstractItemView.DoubleClicked | 
                                    QtWidgets.QAbstractItemView.EditKeyPressed)
        
        # Add context menu for renaming
        list_widget.setContextMenuPolicy(QtCore.Qt.CustomContextMenu)
        list_widget.customContextMenuRequested.connect(
            lambda pos, lw=list_widget: self.show_context_menu(pos, lw)
        )
        
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
        
        # Make the entire widget respond to mouse events
        widget.setAutoFillBackground(True)
        widget.setAttribute(QtCore.Qt.WA_StyledBackground, True)
        widget.setStyleSheet("QWidget:hover { background-color: rgba(100, 100, 100, 50); }")

        # Assign color for source sockets
        if socket_position == "left":
            # Create the socket button on the left
            socket = QtWidgets.QPushButton()
            socket.setFixedSize(12, 12)  # Revert to fixed size
            socket.setStyleSheet("background-color: white; border-radius: 6px;")
            socket._is_target = True
            socket._color = QtGui.QColor("white")
            layout.addWidget(socket)

        # Create the label for the item text (without ID/counter suffix)
        label = QtWidgets.QLabel(text)  # Removed the counter suffix
        label.setStyleSheet("border: none; font-weight: normal; color: white;")
        # Make the label handle double-clicks (for more intuitive editing)
        label.mouseDoubleClickEvent = lambda event: self.handle_label_double_click(event, label, widget)
        # Make the label handle single clicks for selection
        label.mousePressEvent = lambda event: self.handle_label_click(event, label, widget)
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
        widget.label_widget = label  # Store reference to the label widget directly
        widget.label = label.text()  # Store the label text for reference
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
            
            # Get the parent widgets for both sockets
            start_parent = self.connection_start_socket.parent()
            end_parent = end_socket.parent()
            
            # Get the label widgets and their text
            start_label_text = "Unknown"
            end_label_text = "Unknown"
            
            if hasattr(start_parent, 'label_widget'):
                start_label_text = start_parent.label_widget.text()
            
            if hasattr(end_parent, 'label_widget'):
                end_label_text = end_parent.label_widget.text()
            
            print(f"Creating visual connection: {start_label_text} -> {end_label_text}")
            
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
        
        # Select the new item but don't automatically trigger renaming
        list_widget.setCurrentItem(item)
        
        # Increment the counter for the next item
        self.item_counter += 1
        
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
        # First check if we have any selected items
        selected_items = list_widget.selectedItems()
        
        if not selected_items:
            print("No items selected to remove")
            return
        
        # Remove selected items and update connections
        for item in selected_items:
            # Get the widget for this item to find its socket
            widget = list_widget.itemWidget(item)
            if widget and hasattr(widget, 'socket'):
                # Remove any connections involving this socket
                socket = widget.socket
                self.connections = [(src, tgt, color) for src, tgt, color in self.connections 
                                   if src != socket and tgt != socket]
            
            # Remove the item from the list widget
            row = list_widget.row(item)
            list_widget.takeItem(row)
        
        # Update the UI after removing items
        self.update_item_backgrounds(list_widget)
        self.update()  # Update the curve overlay

    def apply_connections(self):
        try:
            import maya.cmds as cmds
        except ImportError:
            print("Error: maya.cmds module not available. Are you running in Maya?")
            return
        
        # Check if source node is assigned
        if not self.source_node_name:
            print("No source node assigned. Please use 'Assign Source Node' first.")
            return
            
        # Check if source node still exists
        if not cmds.objExists(self.source_node_name):
            print(f"Error: Source node '{self.source_node_name}' no longer exists.")
            return
            
        # Get target objects from current selection
        target_objects_list = cmds.ls(selection=True)
        print(f"Selected target objects: {target_objects_list}")
        if not target_objects_list:
            print("No target objects selected. Please select at least one object.")
            return

        # Check if we have visual connections in the UI
        if not self.connections:
            print("No connections visualized in the UI. Please connect attributes first.")
            return
        
        # Open an undo chunk to group all connection operations
        cmds.undoInfo(openChunk=True, chunkName="Attribute Connector - Apply Connections")
        
        try:
            # Process the visualized connections
            for source_socket, target_socket, color in self.connections:
                # Get the parent widgets containing the labels
                source_parent = source_socket.parent()
                target_parent = target_socket.parent()
                
                if hasattr(source_parent, 'label_widget') and hasattr(target_parent, 'label_widget'):
                    source_attribute = source_parent.label_widget.text()
                    target_attribute = target_parent.label_widget.text()
                    
                    print(f"Connecting: {self.source_node_name}.{source_attribute} -> *.{target_attribute}")
                    
                    # For each selected target object, create the connection
                    for target_node in target_objects_list:
                        # Skip if the target is the source node (unless we want to allow self-connections)
                        if target_node == self.source_node_name:
                            continue
                            
                        # Connect attributes using our helper function
                        from Attribute_Connector.attribute_connector_maya_utils import connect_node_attribute
                        connect_node_attribute(self.source_node_name, source_attribute, target_attribute, operation_selection=1, target_node=target_node)
        finally:
            # Always close the undo chunk, even if an error occurs
            cmds.undoInfo(closeChunk=True)
                
        # Outside the for loop
        print("Connections applied successfully")
        
    def load_templates(self):
        """Load connection templates into the combobox"""
        try:
            # Clear the combobox
            self.template_combo.clear()
            
            # Add default empty option
            self.template_combo.addItem("-- Select Template --", None)
            
            # Load templates from file
            templates = load_templates()
            
            # Populate combobox
            for template in templates:
                self.template_combo.addItem(template["name"], template)
                
            print(f"Loaded {len(templates)} templates")
        except Exception as e:
            print(f"Error loading templates: {e}")
            import traceback
            traceback.print_exc()
    
    def apply_template(self):
        """Apply the selected template to the current UI"""
        try:
            # Get the selected template
            current_index = self.template_combo.currentIndex()
            if current_index <= 0:  # Skip the default "Select Template" item
                print("No template selected")
                return
                
            template = self.template_combo.itemData(current_index)
            if not template:
                print("Invalid template data")
                return
                
            print(f"Applying template: {template['name']}")
            
            # Clear existing attributes and connections
            self.clear_all_attributes()
            self.connections = []
            
            # Add attributes from template
            for conn in template["connections"]:
                source_attr = conn["source_attribute"]
                target_attr = conn["target_attribute"]
                
                # Add source attribute
                source_item = self.add_attribute_item(
                    self.source_column["list_widget"], 
                    source_attr, 
                    socket_position=self.source_column["socket_position"]
                )
                
                # Add target attribute
                target_item = self.add_attribute_item(
                    self.target_column["list_widget"], 
                    target_attr, 
                    socket_position=self.target_column["socket_position"]
                )
                
                # Create connection between them
                if source_item and target_item:
                    source_socket = source_item.data(QtCore.Qt.UserRole)["socket"]
                    target_socket = target_item.data(QtCore.Qt.UserRole)["socket"]
                    
                    color_index = len(self.connections) % len(self.pastel_colors)
                    color = self.pastel_colors[color_index]
                    
                    self.connections.append((source_socket, target_socket, color))
            
            # Update the UI
            self.curve_overlay.update()
            print(f"Template applied with {len(template['connections'])} connections")
            
        except Exception as e:
            print(f"Error applying template: {e}")
            import traceback
            traceback.print_exc()
    
    def save_template(self):
        """Save the current connections as a new template"""
        try:
            # Check if we have any connections
            if not self.connections:
                print("No connections to save")
                # Show a warning dialog
                QtWidgets.QMessageBox.warning(
                    self, 
                    "No Connections", 
                    "There are no connections to save as a template."
                )
                return
                
            # Create a dialog to get the template name and description
            dialog = QtWidgets.QDialog(self)
            dialog.setWindowTitle("Save Template")
            dialog.setMinimumWidth(300)
            
            layout = QtWidgets.QVBoxLayout(dialog)
            
            # Template name field
            name_layout = QtWidgets.QHBoxLayout()
            name_layout.addWidget(QtWidgets.QLabel("Name:"))
            name_input = QtWidgets.QLineEdit()
            name_layout.addWidget(name_input)
            layout.addLayout(name_layout)
            
            # Template description field
            desc_layout = QtWidgets.QHBoxLayout()
            desc_layout.addWidget(QtWidgets.QLabel("Description:"))
            desc_input = QtWidgets.QLineEdit()
            desc_layout.addWidget(desc_input)
            layout.addLayout(desc_layout)
            
            # OK/Cancel buttons - handle PySide2/PySide6 compatibility for button types
            if qt_binding == "PySide6":
                # PySide6 style enum
                button_box = QtWidgets.QDialogButtonBox(
                    QtWidgets.QDialogButtonBox.StandardButton.Ok | 
                    QtWidgets.QDialogButtonBox.StandardButton.Cancel
                )
            else:
                # PySide2 style enum
                button_box = QtWidgets.QDialogButtonBox(
                    QtWidgets.QDialogButtonBox.Ok | QtWidgets.QDialogButtonBox.Cancel
                )
            button_box.accepted.connect(dialog.accept)
            button_box.rejected.connect(dialog.reject)
            layout.addWidget(button_box)
            
            # Show the dialog
            if dialog.exec_() == QtWidgets.QDialog.Accepted:
                template_name = name_input.text().strip()
                template_desc = desc_input.text().strip()
                
                # Validate inputs
                if not template_name:
                    QtWidgets.QMessageBox.warning(
                        self, 
                        "Invalid Name", 
                        "Please provide a name for the template."
                    )
                    return
                    
                # Convert current connections to template format
                template_connections = []
                for source_socket, target_socket, _ in self.connections:
                    # Get parent widgets from sockets
                    source_parent = source_socket.parent()
                    target_parent = target_socket.parent()
                    
                    # Get attribute names from the parent widgets
                    source_attr = source_parent.label if hasattr(source_parent, 'label') else "Unknown"
                    target_attr = target_parent.label if hasattr(target_parent, 'label') else "Unknown"
                    
                    template_connections.append({
                        "source_attribute": source_attr,
                        "target_attribute": target_attr
                    })
                
                # Save the template
                success = save_current_connections_as_template(
                    template_name,
                    template_desc,
                    template_connections
                )
                
                if success:
                    print(f"Template '{template_name}' saved successfully")
                    # Reload the templates to update the combobox
                    self.load_templates()
                    # Select the newly added template
                    index = self.template_combo.findText(template_name)
                    if index >= 0:
                        self.template_combo.setCurrentIndex(index)
                else:
                    QtWidgets.QMessageBox.warning(
                        self, 
                        "Save Error", 
                        "Failed to save the template. Please check the console for details."
                    )
            
        except Exception as e:
            print(f"Error saving template: {e}")
            import traceback
            traceback.print_exc()
            
    def clear_all_attributes(self):
        """Clear all attribute items from both columns"""
        try:
            # Clear source attributes
            self.source_column["list_widget"].clear()
            # Clear target attributes
            self.target_column["list_widget"].clear()
            # Clear connections
            self.connections = []
            # Update the overlay
            self.curve_overlay.update()
        except Exception as e:
            print(f"Error clearing attributes: {e}")
            import traceback
            traceback.print_exc()

    def terminate_script(self):
        """Clean up and close the UI window."""
        print("Closing Attribute Connector UI")
        self.setWindowOpacity(0)  # Make the window fully transparent
        self.close()  # Close only the UI window
        
    def closeEvent(self, event):
        """Handle window close event - properly clean up resources."""
        try:
            # Clean up curve overlay
            if hasattr(self, 'curve_overlay'):
                self.curve_overlay.setParent(None)
                self.curve_overlay.deleteLater()
                
            # Clean up any timers
            for child in self.findChildren(QtCore.QTimer):
                child.stop()
            
            # Remove event filters
            self.removeEventFilter(self)
            
            # Clear connections list to release references
            if hasattr(self, 'connections'):
                self.connections.clear()
                
            # Print debug info to help track window count
            print("Successfully closed and cleaned up Attribute Connector UI")
        except Exception as e:
            print(f"Error during window cleanup: {e}")
            
        # Accept the close event
        event.accept()

    def handle_item_double_clicked(self, item):
        """Handle double-click event on list item to edit its text."""
        # Get the current item's widget
        list_widget = item.listWidget()
        widget = list_widget.itemWidget(item)
        if widget:
            # Find the label widget and get its text
            label_text = ""
            label_widget = None
            for child in widget.children():
                if isinstance(child, QtWidgets.QLabel):
                    label_text = child.text()
                    label_widget = child
                    break
            
            # Create a dialog for editing
            dialog = QtWidgets.QInputDialog(self)
            dialog.setWindowTitle("Rename Item")
            dialog.setLabelText("Enter new name:")
            dialog.setTextValue(label_text)
            
            if dialog.exec_() == QtWidgets.QDialog.Accepted:
                # Apply the new name to the label
                new_name = dialog.textValue()
                if new_name:  # Only update if the name isn't empty
                    # Update the label widget text
                    if label_widget:
                        label_widget.setText(new_name)
                    
                    # Update the widget's label property
                    widget.label = new_name
                    
                    print(f"Renamed item to: {new_name}")
                    
                    # This ensures the UI is updated correctly
                    list_widget.update()
    
    def rename_item(self, item):
        # Ensure the item is editable
        item.setFlags(item.flags() | QtCore.Qt.ItemIsEditable)
        # Trigger editing for the item
        list_widget = item.listWidget()
        if list_widget:  # Ensure the item belongs to a list widget
            list_widget.editItem(item)

    def show_context_menu(self, position, list_widget):
        """Show context menu for list widget items."""
        # Get the item at the position
        item = list_widget.itemAt(position)
        if not item:
            return
            
        # Create context menu
        context_menu = QtWidgets.QMenu(self)
        
        # Add rename action
        rename_action = context_menu.addAction("Rename")
        rename_action.triggered.connect(lambda: self.handle_item_double_clicked(item))
        
        # Add delete action
        delete_action = context_menu.addAction("Delete")
        delete_action.triggered.connect(lambda: self.remove_item(list_widget))
        
        # Show the menu at the cursor position
        context_menu.exec_(list_widget.mapToGlobal(position))
    
    def deselect_items(self):
        """Deselect all items in both list widgets."""
        self.source_column["list_widget"].clearSelection()
        self.target_column["list_widget"].clearSelection()

    def handle_label_double_click(self, event, label_widget, parent_widget):
        """Handle double-click directly on a label widget"""
        # Get the current text
        current_text = label_widget.text()
            
        # Create a dialog for editing
        dialog = QtWidgets.QInputDialog(self)
        dialog.setWindowTitle("Rename Item")
        dialog.setLabelText("Enter new name:")
        dialog.setTextValue(current_text)
        
        if dialog.exec_() == QtWidgets.QDialog.Accepted:
            # Apply the new name to the label
            new_name = dialog.textValue()
            if new_name:  # Only update if the name isn't empty
                # Update the label widget text
                label_widget.setText(new_name)
                
                # Update the parent widget's label property
                parent_widget.label = new_name
                
                print(f"Renamed item to: {new_name}")
    
    def handle_item_clicked(self, item):
        """Handle when a list item is clicked directly."""
        list_widget = item.listWidget()
        
        # Make sure the list widget has focus
        list_widget.setFocus()
        
        # This will trigger selection state change
        item.setSelected(True)
        list_widget.setCurrentItem(item)
    
    def assign_source_node(self):
        """Assign the currently selected Maya object as the source node"""
        try:
            import maya.cmds as cmds
            selected = cmds.ls(selection=True)
            
            if not selected:
                self.source_node_label.setText("No objects selected")
                self.source_node_name = None
                return
                
            # Use the first selected object as the source node
            self.source_node_name = selected[0]
            self.source_node_label.setText(f"Source Node: {self.source_node_name}")
            self.source_node_label.setStyleSheet("color: lime; font-weight: bold;")
            print(f"Assigned '{self.source_node_name}' as the source node")
            
            # Set window title to show source node
            self.setWindowTitle(f"Attribute Connector - {self.source_node_name}")
            
            # Check if auto-populate is enabled
            if hasattr(self, 'auto_populate_checkbox') and self.auto_populate_checkbox.isChecked():
                # Populate the source attributes list with attributes from the selected node
                self.populate_attributes(self.source_column["list_widget"], self.source_node_name)
                print("Auto-populated source attributes")
            else:
                print("Auto-populate is disabled - source attributes not populated")
            
        except ImportError:
            print("Error: maya.cmds module not available. Are you running in Maya?")
            self.source_node_label.setText("Error: Not running in Maya")
            self.source_node_name = None
    
    def populate_attributes(self, list_widget, node_name):
        """Populate the given list widget with attributes from the specified node"""
        try:
            import maya.cmds as cmds
            
            # Clear existing items
            list_widget.clear()
            
            # Get attributes from the node
            if not cmds.objExists(node_name):
                print(f"Error: Node '{node_name}' does not exist")
                return
                
            # Get keyable attributes (these are usually the ones we want to connect)
            attrs = cmds.listAttr(node_name, keyable=True) or []
            
            # Add each attribute to the list
            for attr in attrs:
                self.add_item_with_text(list_widget, attr)
                
            print(f"Populated {len(attrs)} attributes from {node_name}")
            
        except ImportError:
            print("Error: maya.cmds module not available. Are you running in Maya?")
    
    def add_item_with_text(self, list_widget, text):
        """Add a new item with specific text"""
        item = QtWidgets.QListWidgetItem()
        socket_position = "left" if list_widget == self.target_column["list_widget"] else "right"
        item_widget = self.create_list_item_with_socket(text, socket_position)
        item.setSizeHint(item_widget.sizeHint())
        list_widget.addItem(item)
        list_widget.setItemWidget(item, item_widget)
        self.item_counter += 1
        self.update_item_backgrounds(list_widget)
        
    def add_attribute_item(self, list_widget, attribute_name, socket_position=None):
        """Add a new attribute item and return it with socket data for templates"""
        # Determine socket position if not provided
        if socket_position is None:
            socket_position = "left" if list_widget == self.target_column["list_widget"] else "right"
            
        # Create the list item
        item = QtWidgets.QListWidgetItem()
        item_widget = self.create_list_item_with_socket(attribute_name, socket_position)
        item.setSizeHint(item_widget.sizeHint())
        list_widget.addItem(item)
        list_widget.setItemWidget(item, item_widget)
        
        # Store socket reference in item's data for easier access
        item.setData(QtCore.Qt.UserRole, {
            "socket": item_widget.socket,
            "attribute_name": attribute_name
        })
        
        self.item_counter += 1
        self.update_item_backgrounds(list_widget)
        return item

    def handle_label_click(self, event, label_widget, parent_widget):
        """Handle click on a label to select the corresponding list item"""
        # Find the list widget and list item that contain this label
        for column in [self.source_column, self.target_column]:
            list_widget = column["list_widget"]
            for i in range(list_widget.count()):
                item = list_widget.item(i)
                widget = list_widget.itemWidget(item)
                
                # If this is our widget, select its item
                if widget == parent_widget:
                    # Make sure the list widget has focus
                    list_widget.setFocus()
                    
                    # If CTRL key is not pressed, clear other selections first
                    if not (event.modifiers() & QtCore.Qt.ControlModifier):
                        self.deselect_items()
                    
                    # Select this item
                    item.setSelected(True)
                    list_widget.setCurrentItem(item)
                    return
        
        # Call the base implementation
        QtWidgets.QLabel.mousePressEvent(label_widget, event)
    
    def select_item_by_widget(self, parent_widget):
        """Select a list item based on its custom widget."""
        for column in [self.source_column, self.target_column]:
            list_widget = column["list_widget"]
            for i in range(list_widget.count()):
                item = list_widget.item(i)
                widget = list_widget.itemWidget(item)
                
                if widget == parent_widget:
                    list_widget.setFocus()
                    item.setSelected(True)
                    list_widget.setCurrentItem(item)
                    return True
        return False

