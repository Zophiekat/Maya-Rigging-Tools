import maya.cmds as maya_commands
from PySide2 import QtWidgets, QtCore, QtGui

# Constants
STATUS_DEFAULT = "default"
STATUS_KEYED = "keyed"
STATUS_CONNECTED = "connected"
STATUS_LOCKED = "locked"

# Default Style Configuration
DEFAULT_STYLE_CONFIG = {
    "default_bg": "#2b2b2b",
    "default_border": "#555555",
    "default_text": "#eeeeee",
    "selection_bg": "#5285a6",
    "focus_border": "#88ccff",
    
    "keyed_bg": "#60353d",
    "keyed_text": "#ffcccc",
    "keyed_focus_border": "#ff9999",
    
    "connected_bg": "#534f20",
    "connected_text": "#ffffcc",
    "connected_focus_border": "#ffff99",
    
    "locked_bg": "#444444",
    "locked_text": "#999999",
    "locked_border": "#666666",
    
    "bool_indicator": "#dddddd",
    
    "border_radius": 2
}

def generate_stylesheet(config):
    # This helper might be used for generating strings, but we use per-widget logic now.
    pass

def get_widget_stylesheet(widget_type_name, status, config):
    """
    Generates a localized stylesheet for a specific widget instance and status.
    """
    
    if status == STATUS_KEYED:
        background_color = config["keyed_bg"]
        foreground_color = config["keyed_text"]
        border_focus = config["keyed_focus_border"]
        border_normal = config["default_border"]
    elif status == STATUS_CONNECTED:
        background_color = config["connected_bg"]
        foreground_color = config["connected_text"]
        border_focus = config["connected_focus_border"]
        border_normal = config["default_border"]
    elif status == STATUS_LOCKED:
        background_color = config["locked_bg"]
        foreground_color = config["locked_text"]
        border_focus = config["locked_border"]
        border_normal = config["locked_border"]
    else:
        background_color = config["default_bg"]
        foreground_color = config["default_text"]
        border_focus = config["focus_border"]
        border_normal = config["default_border"]
        
    border_radius = config["border_radius"]
    selection_background = config["selection_bg"]
    
    border_style = "dashed" if status == STATUS_LOCKED else "solid"

    if widget_type_name in ["QDoubleSpinBox", "QComboBox"]:
        return f"""
            {widget_type_name} {{
                background-color: {background_color};
                border: 1px {border_style} {border_normal};
                border-radius: {border_radius}px;
                color: {foreground_color};
                padding: 1px;
                selection-background-color: {selection_background};
            }}
            {widget_type_name}:focus {{
                border: 1px solid {border_focus};
                background-color: {background_color};
            }}
            {widget_type_name}::drop-down {{
                border: 0px;
                background: transparent;
            }}
            {widget_type_name}:disabled {{
                background-color: {config['locked_bg']};
                color: {config['locked_text']};
            }}
        """
    elif widget_type_name == "QCheckBox":
        return f"""
            QCheckBox {{
                color: {foreground_color};
                spacing: 5px;
            }}
            QCheckBox::indicator {{
                width: 13px;
                height: 13px;
                background-color: {background_color};
                border: 1px {border_style} {border_normal};
                border-radius: {int(border_radius/2)}px;
            }}
            QCheckBox::indicator:checked {{
                background-color: {config['bool_indicator']};
                border: 1px solid {border_focus};
            }}
             QCheckBox::indicator:unchecked {{
                 background-color: {background_color};
            }}
        """
    return ""

def get_attribute_status(node_name, attribute_name):
    full_attribute_path = f"{node_name}.{attribute_name}"
    if not maya_commands.objExists(full_attribute_path):
        return STATUS_DEFAULT
        
    is_locked = maya_commands.getAttr(full_attribute_path, lock=True)
    if is_locked:
        return STATUS_LOCKED

    connections = maya_commands.listConnections(full_attribute_path, source=True, destination=False)
    if connections:
        if maya_commands.filterExpand(connections, selectionMask=9): # 9 is animCurve
             return STATUS_KEYED
        return STATUS_CONNECTED
    
    return STATUS_DEFAULT

class BaseStyledWidget:
    """Mixin to handle style updates"""
    def set_outliner_parent(self, outliner_instance):
        self._outliner_instance = outliner_instance
        
    def update_style(self):
        if hasattr(self, '_outliner_instance') and self._outliner_instance:
            config = self._outliner_instance.style_configuration
            if hasattr(self, 'current_status'):
                sheet = get_widget_stylesheet(self.metaObject().className(), self.current_status, config)
                self.setStyleSheet(sheet)

class JointAttributeFloatField(QtWidgets.QDoubleSpinBox, BaseStyledWidget):
    def __init__(self, node_name, attribute_name, parent=None):
        super().__init__(parent)
        self.node_name = node_name
        self.attribute_name = attribute_name
        
        self.setFixedWidth(60)
        self.setAlignment(QtCore.Qt.AlignRight)
        self.setToolTip(f"{attribute_name}")
        self.setButtonSymbols(QtWidgets.QAbstractSpinBox.NoButtons)
        self.setDecimals(3)
        self.setRange(-9999999.0, 9999999.0)
        
        self.editingFinished.connect(self.on_editing_finished)
        self.current_status = STATUS_DEFAULT
        
        self.refresh_value()

    def wheelEvent(self, event):
        event.ignore()

    def refresh_value(self):
        full_attribute_path = f"{self.node_name}.{self.attribute_name}"
        if not maya_commands.objExists(full_attribute_path):
            self.setEnabled(False)
            return

        current_value = maya_commands.getAttr(full_attribute_path)
        self.blockSignals(True)
        self.setValue(current_value)
        self.blockSignals(False)
        
        self.current_status = get_attribute_status(self.node_name, self.attribute_name)
        self.update_style()

    def on_editing_finished(self):
        new_value = self.value()
        try:
            full_attribute_path = f"{self.node_name}.{self.attribute_name}"
            maya_commands.setAttr(full_attribute_path, new_value)
        except RuntimeError:
            self.refresh_value()

class JointAttributeVector3Widget(QtWidgets.QWidget):
    def __init__(self, node_name, attribute_base_name, parent=None):
        super().__init__(parent)
        self.layout_container = QtWidgets.QHBoxLayout(self)
        self.layout_container.setContentsMargins(2, 0, 2, 0)
        self.layout_container.setSpacing(2)
        
        self.input_fields = []
        for axis_char in "xyz":
            field_widget = JointAttributeFloatField(node_name, f"{attribute_base_name}{axis_char.upper()}")
            self.layout_container.addWidget(field_widget)
            self.input_fields.append(field_widget)

    def set_outliner_parent(self, outliner_instance):
        for field in self.input_fields:
            field.set_outliner_parent(outliner_instance)
            
    def update_style(self):
        for field in self.input_fields:
            field.update_style()
            
    def refresh_value(self):
        for field in self.input_fields:
            field.refresh_value()

class JointAttributeEnumWidget(QtWidgets.QComboBox, BaseStyledWidget):
    def __init__(self, node_name, attribute_name, options_list, parent=None):
        super().__init__(parent)
        self.node_name = node_name
        self.attribute_name = attribute_name
        self.addItems(options_list)
        
        self.currentIndexChanged.connect(self.on_value_changed)
        self.current_status = STATUS_DEFAULT
        self.refresh_value()
    
    def wheelEvent(self, event):
        event.ignore()
        
    def refresh_value(self):
        full_attribute_path = f"{self.node_name}.{self.attribute_name}"
        current_index = maya_commands.getAttr(full_attribute_path)
        self.blockSignals(True)
        self.setCurrentIndex(current_index)
        self.blockSignals(False)
        
        self.current_status = get_attribute_status(self.node_name, self.attribute_name)
        self.update_style()

    def on_value_changed(self, index):
        full_attribute_path = f"{self.node_name}.{self.attribute_name}"
        try:
            maya_commands.setAttr(full_attribute_path, index)
        except:
             self.refresh_value()

class JointAttributeBooleanWidget(QtWidgets.QCheckBox, BaseStyledWidget):
    def __init__(self, node_name, attribute_name, parent=None):
        super().__init__(parent)
        self.node_name = node_name
        self.attribute_name = attribute_name
        self.setStyleSheet("QCheckBox { margin-left: 10px; }")
        self.clicked.connect(self.on_toggle_clicked)
        self.current_status = STATUS_DEFAULT
        self.refresh_value()
        
    def refresh_value(self):
        full_attribute_path = f"{self.node_name}.{self.attribute_name}"
        current_value = maya_commands.getAttr(full_attribute_path)
        self.blockSignals(True)
        self.setChecked(current_value)
        self.blockSignals(False)
        
        self.current_status = get_attribute_status(self.node_name, self.attribute_name)
        self.update_style()

    def on_toggle_clicked(self, checked):
        full_attribute_path = f"{self.node_name}.{self.attribute_name}"
        try:
             maya_commands.setAttr(full_attribute_path, checked)
        except:
             self.refresh_value()

class JointOutlinerStyleEditor(QtWidgets.QWidget):
    def __init__(self, target_window, parent=None):
        super().__init__(parent, QtCore.Qt.Window)
        self.setWindowTitle("Style Editor")
        self.resize(400, 600)
        self.target_window = target_window
        
        self.main_layout = QtWidgets.QVBoxLayout(self)
        
        scroll_area = QtWidgets.QScrollArea()
        content_widget = QtWidgets.QWidget()
        self.form_layout = QtWidgets.QFormLayout(content_widget)
        
        self.editor_widgets = {}
        
        sorted_keys = sorted(self.target_window.style_configuration.keys())
        
        for key in sorted_keys:
            value = self.target_window.style_configuration[key]
            if isinstance(value, str) and value.startswith("#"):
                 color_button = QtWidgets.QPushButton()
                 color_button.setStyleSheet(f"background-color: {value}; border: 1px solid #555;")
                 color_button.setMinimumHeight(25)
                 color_button.clicked.connect(lambda *args, key_param=key: self.pick_color(key_param))
                 
                 self.form_layout.addRow(key.replace("_", " ").title(), color_button)
                 self.editor_widgets[key] = color_button
            elif isinstance(value, int):
                 spin_box = QtWidgets.QSpinBox()
                 spin_box.setValue(value)
                 spin_box.valueChanged.connect(lambda value_param, key_param=key: self.update_configuration_value(key_param, value_param))
                 self.form_layout.addRow(key.replace("_", " ").title(), spin_box)
                 self.editor_widgets[key] = spin_box
                 
        scroll_area.setWidget(content_widget)
        scroll_area.setWidgetResizable(True)
        self.main_layout.addWidget(scroll_area)
        
        reset_button = QtWidgets.QPushButton("Reset to Defaults")
        reset_button.clicked.connect(self.reset_to_defaults)
        self.main_layout.addWidget(reset_button)
        
    def pick_color(self, key):
        current_hex = self.target_window.style_configuration[key]
        current_color = QtGui.QColor(current_hex)
        
        picked_color = QtWidgets.QColorDialog.getColor(
            current_color, 
            self, 
            "Pick Color", 
            QtWidgets.QColorDialog.ShowAlphaChannel
        )
        
        if picked_color.isValid():
            hex_color_string = picked_color.name(QtGui.QColor.HexArgb)
            self.update_configuration_value(key, hex_color_string)
            self.editor_widgets[key].setStyleSheet(f"background-color: {hex_color_string}; border: 1px solid #555;")

    def update_configuration_value(self, key, value):
        self.target_window.style_configuration[key] = value
        self.target_window.update_stylesheet()
        
    def reset_to_defaults(self):
        self.target_window.style_configuration = DEFAULT_STYLE_CONFIG.copy()
        
        for key, value in self.target_window.style_configuration.items():
            if key in self.editor_widgets:
                widget = self.editor_widgets[key]
                if isinstance(widget, QtWidgets.QPushButton):
                    widget.setStyleSheet(f"background-color: {value}; border: 1px solid #555;")
                elif isinstance(widget, QtWidgets.QSpinBox):
                    widget.blockSignals(True)
                    widget.setValue(value)
                    widget.blockSignals(False)
        
        self.target_window.update_stylesheet()


class JointOutliner(QtWidgets.QWidget):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.setWindowTitle("Joint Outliner")
        self.resize(1100, 600)
        
        self.style_configuration = DEFAULT_STYLE_CONFIG.copy()
        
        main_layout = QtWidgets.QVBoxLayout(self)
        main_layout.setContentsMargins(5, 5, 5, 5)

        # Toolbar
        toolbar_layout = QtWidgets.QHBoxLayout()
        
        self.search_line_edit = QtWidgets.QLineEdit()
        self.search_line_edit.setPlaceholderText("Search items...")
        self.search_line_edit.textChanged.connect(self.filter_list_items)
        toolbar_layout.addWidget(self.search_line_edit)
        
        self.column_visibility_button = QtWidgets.QPushButton("Columns")
        self.column_menu = QtWidgets.QMenu(self.column_visibility_button)
        self.column_visibility_button.setMenu(self.column_menu)
        toolbar_layout.addWidget(self.column_visibility_button)

        self.refresh_button = QtWidgets.QPushButton("Refresh")
        self.refresh_button.clicked.connect(self.populate_list_items)
        toolbar_layout.addWidget(self.refresh_button)
        
        self.style_editor_button = QtWidgets.QPushButton("Style Editor")
        self.style_editor_button.clicked.connect(self.open_style_editor)
        toolbar_layout.addWidget(self.style_editor_button)

        main_layout.addLayout(toolbar_layout)

        # Tree Widget
        self.tree_widget = QtWidgets.QTreeWidget()
        self.tree_widget.setAlternatingRowColors(True)
        self.tree_widget.setSelectionMode(QtWidgets.QAbstractItemView.ExtendedSelection)
        self.tree_widget.setIndentation(0)
        
        self.tree_widget.setStyleSheet("""
            QTreeWidget::item { 
                border-right: 1px solid #444; 
                padding-right: 5px;
            }
        """)

        self.header_labels = [
            "Joint Name", 
            "Shear", 
            "Rotate Order", 
            "Inherits", 
            "Radius", 
            "Joint Orient", 
            "SSC"
        ]
        self.tree_widget.setHeaderLabels(self.header_labels)
        
        # Column Actions
        for index, header_text in enumerate(self.header_labels):
            if index == 0: continue
            action = QtWidgets.QAction(header_text, self.column_menu)
            action.setCheckable(True)
            action.setChecked(True)
            action.setData(index)
            action.toggled.connect(self.toggle_column_visibility)
            self.column_menu.addAction(action)

        main_layout.addWidget(self.tree_widget)

        self.tree_widget.itemSelectionChanged.connect(self.on_item_selection_changed)

        self.populate_list_items()

    def toggle_column_visibility(self, checked):
        action = self.sender()
        column_index = action.data()
        self.tree_widget.setColumnHidden(column_index, not checked)

    def get_joint_icon(self):
        return QtGui.QIcon(":out_joint.png")

    def populate_list_items(self):
        self.tree_widget.clear()
        self.tree_widget.setSortingEnabled(False)
        
        all_joints = maya_commands.ls(type="joint", long=True) or []
        all_joints.sort()
        
        # Mapping rotation order enum integers to string names
        rotate_order_names = ["xyz", "yzx", "zxy", "xzy", "yxz", "zyx"]
        
        for joint_path in all_joints:
            joint_short_name = joint_path.split("|")[-1]
            tree_item = QtWidgets.QTreeWidgetItem(self.tree_widget)
            tree_item.setText(0, joint_short_name)
            tree_item.setData(0, QtCore.Qt.UserRole, joint_path)
            tree_item.setIcon(0, self.get_joint_icon())
            
            # 1. Shear
            shear_widget = JointAttributeVector3Widget(joint_path, "shear")
            self.tree_widget.setItemWidget(tree_item, 1, shear_widget)
            
            # 2. Rotate Order
            rotate_order_widget = JointAttributeEnumWidget(joint_path, "rotateOrder", rotate_order_names)
            self.tree_widget.setItemWidget(tree_item, 2, rotate_order_widget)
            
            # 3. Inherits Transform
            inherits_widget = JointAttributeBooleanWidget(joint_path, "inheritsTransform")
            self.tree_widget.setItemWidget(tree_item, 3, inherits_widget)
            
            # 4. Radius
            radius_field = JointAttributeFloatField(joint_path, "radius")
            radius_container = QtWidgets.QWidget()
            layout_radius = QtWidgets.QHBoxLayout(radius_container)
            layout_radius.setContentsMargins(0,0,0,0)
            layout_radius.setAlignment(QtCore.Qt.AlignCenter)
            layout_radius.addWidget(radius_field)
            self.tree_widget.setItemWidget(tree_item, 4, radius_container)
            
            # 5. Joint Orient
            joint_orient_widget = JointAttributeVector3Widget(joint_path, "jointOrient")
            self.tree_widget.setItemWidget(tree_item, 5, joint_orient_widget)
            
            # 6. SSC
            ssc_widget = JointAttributeBooleanWidget(joint_path, "segmentScaleCompensate")
            self.tree_widget.setItemWidget(tree_item, 6, ssc_widget)

        self.update_stylesheet()

        for column_index in range(self.tree_widget.columnCount()):
            self.tree_widget.resizeColumnToContents(column_index)
            column_width = self.tree_widget.columnWidth(column_index)
            self.tree_widget.setColumnWidth(column_index, column_width + 20)

        self.tree_widget.setSortingEnabled(True)

    def filter_list_items(self, text_input):
        search_text = text_input.lower()
        root_item = self.tree_widget.invisibleRootItem()
        child_count = root_item.childCount()
        
        for i in range(child_count):
            item = root_item.child(i)
            item_text = item.text(0).lower()
            item.setHidden(search_text not in item_text)

    def on_item_selection_changed(self):
        selected_items = self.tree_widget.selectedItems()
        selected_nodes = [item.data(0, QtCore.Qt.UserRole) for item in selected_items]
        
        valid_nodes = [node for node in selected_nodes if maya_commands.objExists(node)]
        if valid_nodes:
            maya_commands.select(valid_nodes)
        else:
            maya_commands.select(clear=True)

    def update_stylesheet(self):
        # Propagate style to all known widgets
        # Replaces previous 'apply_style'
        
        # Check if tree_widget exists before trying to access it
        if not hasattr(self, 'tree_widget'):
            return
            
        root_item = self.tree_widget.invisibleRootItem()
        child_count = root_item.childCount()
        
        for i in range(child_count):
            item = root_item.child(i)
            # Iterate columns 1-6 which contain our custom widgets
            for column_index in range(1, 7):
                widget_instance = self.tree_widget.itemWidget(item, column_index)
                if widget_instance:
                    if hasattr(widget_instance, "set_outliner_parent"):
                        widget_instance.set_outliner_parent(self)
                        widget_instance.update_style()
                        
                    elif isinstance(widget_instance, QtWidgets.QWidget): 
                         # Handle container widgets (like the Radius container)
                         container_layout = widget_instance.layout()
                         if container_layout:
                             for j in range(container_layout.count()):
                                 child_widget = container_layout.itemAt(j).widget()
                                 if hasattr(child_widget, "set_outliner_parent"):
                                     child_widget.set_outliner_parent(self)
                                     child_widget.update_style()
        
    def open_style_editor(self):
        if not hasattr(self, 'style_editor_window') or not self.style_editor_window.isVisible():
            self.style_editor_window = JointOutlinerStyleEditor(self)
        self.style_editor_window.show()
        self.style_editor_window.raise_()


def show():
    global joint_outliner_ui_instance
    try:
        joint_outliner_ui_instance.deleteLater()
    except:
        pass
        
    joint_outliner_ui_instance = JointOutliner()
    joint_outliner_ui_instance.show()

if __name__ == "__main__":
    show()
