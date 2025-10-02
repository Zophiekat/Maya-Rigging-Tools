"""
Maya PySide2 Widget Controller
Allows clicking on Maya UI widgets to load them into a custom UI and control their states
"""

import sys
from PySide2 import QtWidgets, QtCore, QtGui
from PySide2.QtCore import Qt
from shiboken2 import wrapInstance
import maya.OpenMayaUI as omui
import maya.cmds as cmds


def maya_main_window():
    """Get the Maya main window as a Python object"""
    main_window_ptr = omui.MQtUtil.mainWindow()
    return wrapInstance(int(main_window_ptr), QtWidgets.QWidget)


class WidgetInspector(QtCore.QObject):
    """Helper class to capture widget clicks in Maya UI"""
    
    widget_clicked = QtCore.Signal(QtWidgets.QWidget)
    
    def __init__(self):
        super(WidgetInspector, self).__init__()
        self.capturing = False
        self.original_cursor = None
    
    def start_capture(self):
        """Start capturing widget clicks"""
        self.capturing = True
        self.original_cursor = QtWidgets.QApplication.overrideCursor()
        QtWidgets.QApplication.setOverrideCursor(Qt.CrossCursor)
        QtWidgets.QApplication.instance().installEventFilter(self)
    
    def stop_capture(self):
        """Stop capturing widget clicks"""
        self.capturing = False
        QtWidgets.QApplication.instance().removeEventFilter(self)
        QtWidgets.QApplication.restoreOverrideCursor()
    
    def eventFilter(self, obj, event):
        """Filter mouse click events to capture widget selection"""
        if not self.capturing:
            return False
            
        if event.type() == QtCore.QEvent.MouseButtonPress:
            if event.button() == Qt.LeftButton:
                # Try multiple methods to get the widget at cursor position
                widget = None
                
                try:
                    # Method 1: Standard Qt way
                    widget = QtWidgets.QApplication.widgetAt(event.globalPos())
                except:
                    pass
                
                if not widget:
                    try:
                        # Method 2: Use cursor position
                        cursor_pos = QtGui.QCursor.pos()
                        widget = QtWidgets.QApplication.widgetAt(cursor_pos)
                    except:
                        pass
                
                if not widget:
                    try:
                        # Method 3: Get from the event object itself
                        if hasattr(obj, 'childAt'):
                            local_pos = obj.mapFromGlobal(event.globalPos())
                            widget = obj.childAt(local_pos)
                            if not widget:
                                widget = obj
                    except:
                        pass
                
                if widget:
                    print(f"Captured widget: {widget.__class__.__name__ if hasattr(widget, '__class__') else 'Unknown'}")
                    
                    # Validate the widget before emitting
                    if self.is_widget_valid_for_capture(widget):
                        self.widget_clicked.emit(widget)
                        self.stop_capture()
                        return True
                    else:
                        print("Widget is not valid for capture, trying parent...")
                        # Try to get a valid parent
                        parent = widget.parent() if hasattr(widget, 'parent') else None
                        if parent and self.is_widget_valid_for_capture(parent):
                            print(f"Using parent widget: {parent.__class__.__name__ if hasattr(parent, '__class__') else 'Unknown'}")
                            self.widget_clicked.emit(parent)
                            self.stop_capture()
                            return True
                
                print("No valid widget found at click position")
        
        return False
    
    def is_widget_valid_for_capture(self, widget):
        """Check if a widget is valid for capture (more lenient than is_widget_valid)"""
        if not widget:
            return False
            
        try:
            # Basic existence check
            if hasattr(widget, '__class__'):
                widget.__class__.__name__
                return True
            elif hasattr(widget, 'metaObject'):
                widget.metaObject().className()
                return True
            else:
                return False
        except:
            return False


class WidgetHierarchyWindow(QtWidgets.QMainWindow):
    """Separate window for widget hierarchy display"""
    
    def __init__(self, parent=None):
        super(WidgetHierarchyWindow, self).__init__(parent)
        
        self.setWindowTitle("Widget Hierarchy")
        self.setMinimumSize(600, 400)
        self.setWindowFlags(Qt.Tool | Qt.WindowStaysOnTopHint)
        
        # Create UI
        central_widget = QtWidgets.QWidget()
        self.setCentralWidget(central_widget)
        
        layout = QtWidgets.QVBoxLayout(central_widget)
        
        # Hierarchy tree widget
        self.hierarchy_tree = QtWidgets.QTreeWidget()
        self.hierarchy_tree.setHeaderLabels(["Widget", "Type", "Enabled", "Visible", "Object Name"])
        self.hierarchy_tree.setAlternatingRowColors(True)
        self.hierarchy_tree.setRootIsDecorated(True)
        layout.addWidget(self.hierarchy_tree)
        
        # Buttons
        button_layout = QtWidgets.QHBoxLayout()
        
        self.refresh_btn = QtWidgets.QPushButton("Refresh Hierarchy")
        button_layout.addWidget(self.refresh_btn)
        
        self.close_btn = QtWidgets.QPushButton("Close")
        self.close_btn.clicked.connect(self.close)
        button_layout.addWidget(self.close_btn)
        
        layout.addLayout(button_layout)


class WidgetInfoWindow(QtWidgets.QMainWindow):
    """Separate window for widget information display"""
    
    def __init__(self, parent=None):
        super(WidgetInfoWindow, self).__init__(parent)
        
        self.setWindowTitle("Widget Information")
        self.setMinimumSize(500, 600)
        self.setWindowFlags(Qt.Tool | Qt.WindowStaysOnTopHint)
        
        # Store reference to parent controller
        self.controller = parent
        
        # Create UI
        central_widget = QtWidgets.QWidget()
        self.setCentralWidget(central_widget)
        
        layout = QtWidgets.QVBoxLayout(central_widget)
        
        # Widget info display
        info_group = QtWidgets.QGroupBox("Widget Information")
        info_layout = QtWidgets.QVBoxLayout(info_group)
        
        self.widget_info_label = QtWidgets.QLabel("No widget selected")
        self.widget_info_label.setWordWrap(True)
        self.widget_info_label.setAlignment(Qt.AlignTop)
        self.widget_info_label.setStyleSheet("QLabel { background-color: #f0f0f0; padding: 8px; border: 1px solid #ccc; }")
        info_layout.addWidget(self.widget_info_label)
        
        layout.addWidget(info_group)
        
        # Widget Hierarchy List
        hierarchy_group = QtWidgets.QGroupBox("Widget Hierarchy - Click to Navigate")
        hierarchy_layout = QtWidgets.QVBoxLayout(hierarchy_group)
        
        self.hierarchy_list = QtWidgets.QListWidget()
        self.hierarchy_list.setAlternatingRowColors(True)
        self.hierarchy_list.itemClicked.connect(self.on_hierarchy_item_clicked)
        hierarchy_layout.addWidget(self.hierarchy_list)
        
        layout.addWidget(hierarchy_group)
        
        # Widget State Information
        state_group = QtWidgets.QGroupBox("Widget State")
        state_layout = QtWidgets.QVBoxLayout(state_group)
        
        self.state_info_label = QtWidgets.QLabel("No widget selected")
        self.state_info_label.setWordWrap(True)
        self.state_info_label.setStyleSheet("QLabel { background-color: #f9f9f9; padding: 8px; border: 1px solid #ddd; }")
        state_layout.addWidget(self.state_info_label)
        
        layout.addWidget(state_group)
        
        # Buttons
        button_layout = QtWidgets.QHBoxLayout()
        
        self.refresh_state_btn = QtWidgets.QPushButton("Refresh State")
        button_layout.addWidget(self.refresh_state_btn)
        
        self.close_btn = QtWidgets.QPushButton("Close")
        self.close_btn.clicked.connect(self.close)
        button_layout.addWidget(self.close_btn)
        
        layout.addLayout(button_layout)
    
    def on_hierarchy_item_clicked(self, item):
        """Handle clicking on a hierarchy item"""
        if not self.controller:
            return
            
        try:
            # Get the stored widget from the item
            widget_data = item.data(Qt.UserRole)
            if widget_data and isinstance(widget_data, dict):
                widget = widget_data.get('widget')
                if widget and self.controller.is_widget_valid(widget):
                    print(f"Switching to widget from hierarchy: {widget_data.get('type', 'Unknown')}")
                    self.controller.switch_to_widget(widget)
                else:
                    print("Selected widget is no longer valid")
            else:
                print("No valid widget data found for this item")
                    
        except Exception as e:
            print(f"Error handling hierarchy item click: {str(e)}")
            import traceback
            traceback.print_exc()
    
    def populate_hierarchy_list(self, widget):
        """Populate the hierarchy list widget"""
        self.info_window.hierarchy_list.clear()
        
        if not widget or not self.is_widget_valid(widget):
            no_widget_item = QtWidgets.QListWidgetItem("No valid widget selected")
            no_widget_item.setBackground(QtGui.QColor(255, 200, 200))
            self.info_window.hierarchy_list.addItem(no_widget_item)
            return
        
        try:
            # Build parent chain
            parent_chain = []
            current = widget
            depth = 0
            max_depth = 15
            
            while depth < max_depth and current and self.is_widget_valid(current):
                try:
                    # Capture widget data
                    widget_data = {
                        'widget': current,
                        'type': 'Unknown',
                        'object_name': 'No name',
                        'classification': 'Unknown',
                        'enabled': 'Unknown',
                        'visible': 'Unknown',
                        'text': ''
                    }
                    
                    # Get widget type
                    if hasattr(current, '__class__') and hasattr(current.__class__, '__name__'):
                        widget_data['type'] = current.__class__.__name__
                    elif hasattr(current, 'metaObject') and hasattr(current.metaObject(), 'className'):
                        widget_data['type'] = current.metaObject().className()
                    
                    # Get object name
                    if hasattr(current, 'objectName'):
                        try:
                            name = current.objectName()
                            widget_data['object_name'] = name if name else "No name"
                        except:
                            pass
                    
                    # Get classification
                    widget_data['classification'] = self.get_widget_type_classification(current)
                    
                    # Get states
                    if hasattr(current, 'isEnabled'):
                        try:
                            widget_data['enabled'] = current.isEnabled()
                        except:
                            pass
                            
                    if hasattr(current, 'isVisible'):
                        try:
                            widget_data['visible'] = current.isVisible()
                        except:
                            pass
                    
                    # Get text
                    for text_method in ['text', 'title', 'windowTitle']:
                        if hasattr(current, text_method):
                            try:
                                text_func = getattr(current, text_method)
                                if callable(text_func):
                                    text = text_func()
                                    if text:
                                        widget_data['text'] = text[:30] + ('...' if len(text) > 30 else '')
                                        break
                            except:
                                continue
                    
                    parent_chain.append(widget_data)
                    
                    # Move to parent
                    parent = current.parent() if hasattr(current, 'parent') else None
                    if not parent or not self.is_widget_valid(parent):
                        break
                    current = parent
                    depth += 1
                except:
                    break
            
            # Add items to list (reverse order - parents at top)
            for i, widget_data in enumerate(reversed(parent_chain)):
                # Create display text
                indent = "  " * i
                type_text = widget_data['type']
                name_text = f" ({widget_data['object_name']})" if widget_data['object_name'] != "No name" else ""
                text_preview = f" - '{widget_data['text']}'" if widget_data['text'] else ""
                
                # Classification icon
                classification = widget_data['classification']
                if "Maya Internal" in classification:
                    icon = "🅜"
                elif "C++" in classification:
                    icon = "🔧"
                elif "PySide2" in classification or "Python" in classification:
                    icon = "🐍"
                else:
                    icon = "❓"
                
                display_text = f"{indent}{icon} {type_text}{name_text}{text_preview}"
                
                # Create list item
                item = QtWidgets.QListWidgetItem(display_text)
                
                # Store widget data
                item.setData(Qt.UserRole, widget_data)
                
                # Color coding
                if widget_data['widget'] == widget:
                    # Current widget - green
                    item.setBackground(QtGui.QColor(200, 255, 200))
                    item.setToolTip("Current selected widget")
                elif widget_data['enabled'] == False:
                    # Disabled - yellow
                    item.setBackground(QtGui.QColor(255, 255, 200))
                    item.setToolTip(f"{classification} - Disabled")
                else:
                    item.setToolTip(f"{classification}")
                
                self.info_window.hierarchy_list.addItem(item)
            
            # Add children section
            try:
                children = []
                if hasattr(widget, 'children') and callable(widget.children):
                    children = widget.children()
                elif hasattr(widget, 'findChildren'):
                    all_children = widget.findChildren(QtCore.QObject)
                    children = [child for child in all_children if child.parent() == widget]
                
                if children:
                    # Add separator
                    separator_item = QtWidgets.QListWidgetItem("── Children ──")
                    separator_item.setBackground(QtGui.QColor(220, 220, 220))
                    separator_item.setFlags(Qt.ItemIsEnabled)  # Not selectable
                    self.info_window.hierarchy_list.addItem(separator_item)
                    
                    # Add children (limit to 15)
                    for i, child in enumerate(children[:15]):
                        if self.is_widget_valid(child):
                            try:
                                child_data = {
                                    'widget': child,
                                    'type': 'Unknown',
                                    'object_name': 'No name',
                                    'classification': 'Unknown'
                                }
                                
                                if hasattr(child, '__class__'):
                                    child_data['type'] = child.__class__.__name__
                                elif hasattr(child, 'metaObject'):
                                    child_data['type'] = child.metaObject().className()
                                
                                if hasattr(child, 'objectName'):
                                    try:
                                        name = child.objectName()
                                        child_data['object_name'] = name if name else "No name"
                                    except:
                                        pass
                                
                                child_data['classification'] = self.get_widget_type_classification(child)
                                
                                # Get text preview
                                text_preview = ""
                                for text_method in ['text', 'title', 'windowTitle']:
                                    if hasattr(child, text_method):
                                        try:
                                            text_func = getattr(child, text_method)
                                            if callable(text_func):
                                                text = text_func()
                                                if text:
                                                    text_preview = f" - '{text[:20]}{'...' if len(text) > 20 else ''}'"
                                                    break
                                        except:
                                            continue
                                
                                # Classification icon
                                classification = child_data['classification']
                                if "Maya Internal" in classification:
                                    icon = "🅜"
                                elif "C++" in classification:
                                    icon = "🔧"
                                elif "PySide2" in classification or "Python" in classification:
                                    icon = "🐍"
                                else:
                                    icon = "❓"
                                
                                name_text = f" ({child_data['object_name']})" if child_data['object_name'] != "No name" else ""
                                display_text = f"    ↳ {icon} {child_data['type']}{name_text}{text_preview}"
                                
                                child_item = QtWidgets.QListWidgetItem(display_text)
                                child_item.setData(Qt.UserRole, child_data)
                                child_item.setToolTip(f"{classification}")
                                
                                self.info_window.hierarchy_list.addItem(child_item)
                                
                            except Exception as e:
                                error_item = QtWidgets.QListWidgetItem(f"    ↳ ❌ Error: {str(e)}")
                                error_item.setBackground(QtGui.QColor(255, 200, 200))
                                error_item.setFlags(Qt.ItemIsEnabled)
                                self.info_window.hierarchy_list.addItem(error_item)
                    
                    if len(children) > 15:
                        more_item = QtWidgets.QListWidgetItem(f"    ... and {len(children) - 15} more children")
                        more_item.setBackground(QtGui.QColor(240, 240, 240))
                        more_item.setFlags(Qt.ItemIsEnabled)
                        self.info_window.hierarchy_list.addItem(more_item)
                        
            except Exception as e:
                error_item = QtWidgets.QListWidgetItem(f"Error getting children: {str(e)}")
                error_item.setBackground(QtGui.QColor(255, 200, 200))
                error_item.setFlags(Qt.ItemIsEnabled)
                self.info_window.hierarchy_list.addItem(error_item)
                
        except Exception as e:
            error_item = QtWidgets.QListWidgetItem(f"Error building hierarchy: {str(e)}")
            error_item.setBackground(QtGui.QColor(255, 200, 200))
            self.info_window.hierarchy_list.addItem(error_item)


class WidgetControllerUI(QtWidgets.QMainWindow):
    """Main UI for controlling Maya widgets"""
    
    def __init__(self, parent=maya_main_window()):
        super(WidgetControllerUI, self).__init__(parent)
        
        self.setWindowTitle("Maya Widget Controller - Main")
        self.setMinimumSize(400, 300)
        self.setWindowFlags(Qt.Tool | Qt.WindowStaysOnTopHint)
        
        # Store the currently selected widget
        self.current_widget = None
        
        # Initialize the widget inspector
        self.inspector = WidgetInspector()
        self.inspector.widget_clicked.connect(self.load_widget)
        
        # Create separate windows
        self.hierarchy_window = WidgetHierarchyWindow(self)
        self.info_window = WidgetInfoWindow(self)
        
        # Set controller reference for info window
        self.info_window.controller = self
        
        # Connect signals
        self.hierarchy_window.refresh_btn.clicked.connect(self.refresh_hierarchy)
        self.hierarchy_window.hierarchy_tree.itemClicked.connect(self.on_hierarchy_item_clicked)
        self.info_window.refresh_state_btn.clicked.connect(self.update_widget_state)
        
        # Create UI
        self.create_ui()
        
    def create_ui(self):
        """Create the main UI layout"""
        central_widget = QtWidgets.QWidget()
        self.setCentralWidget(central_widget)
        
        main_layout = QtWidgets.QVBoxLayout(central_widget)
        
        # Widget Selection Section
        selection_group = QtWidgets.QGroupBox("Widget Selection")
        selection_layout = QtWidgets.QVBoxLayout(selection_group)
        
        self.select_widget_btn = QtWidgets.QPushButton("Click to Select Maya Widget")
        self.select_widget_btn.setStyleSheet("QPushButton { background-color: #4CAF50; color: white; font-weight: bold; }")
        self.select_widget_btn.clicked.connect(self.start_widget_selection)
        selection_layout.addWidget(self.select_widget_btn)
        
        # Current widget summary
        self.current_widget_label = QtWidgets.QLabel("No widget selected")
        self.current_widget_label.setWordWrap(True)
        self.current_widget_label.setStyleSheet("QLabel { background-color: #f0f0f0; padding: 8px; border: 1px solid #ccc; }")
        selection_layout.addWidget(self.current_widget_label)
        
        main_layout.addWidget(selection_group)
        
        # Window Control Section
        window_group = QtWidgets.QGroupBox("Window Controls")
        window_layout = QtWidgets.QGridLayout(window_group)
        
        self.show_hierarchy_btn = QtWidgets.QPushButton("Show Hierarchy Window")
        self.show_hierarchy_btn.clicked.connect(self.show_hierarchy_window)
        window_layout.addWidget(self.show_hierarchy_btn, 0, 0)
        
        self.show_info_btn = QtWidgets.QPushButton("Show Info Window")
        self.show_info_btn.clicked.connect(self.show_info_window)
        window_layout.addWidget(self.show_info_btn, 0, 1)
        
        main_layout.addWidget(window_group)
        
        # Widget Control Section
        control_group = QtWidgets.QGroupBox("Widget Controls")
        control_layout = QtWidgets.QGridLayout(control_group)
        
        # Enable/Disable controls
        self.enable_btn = QtWidgets.QPushButton("Enable Widget")
        self.enable_btn.clicked.connect(self.enable_widget)
        self.enable_btn.setEnabled(False)
        control_layout.addWidget(self.enable_btn, 0, 0)
        
        self.disable_btn = QtWidgets.QPushButton("Disable Widget")
        self.disable_btn.clicked.connect(self.disable_widget)
        self.disable_btn.setEnabled(False)
        control_layout.addWidget(self.disable_btn, 0, 1)
        
        # Parent controls
        self.enable_parent_btn = QtWidgets.QPushButton("Enable Parent")
        self.enable_parent_btn.clicked.connect(self.enable_parent)
        self.enable_parent_btn.setEnabled(False)
        control_layout.addWidget(self.enable_parent_btn, 1, 0)
        
        self.disable_parent_btn = QtWidgets.QPushButton("Disable Parent")
        self.disable_parent_btn.clicked.connect(self.disable_parent)
        self.disable_parent_btn.setEnabled(False)
        control_layout.addWidget(self.disable_parent_btn, 1, 1)
        
        # Active/Inactive controls (for widgets that support it)
        self.set_active_btn = QtWidgets.QPushButton("Set Active")
        self.set_active_btn.clicked.connect(self.set_widget_active)
        self.set_active_btn.setEnabled(False)
        control_layout.addWidget(self.set_active_btn, 2, 0)
        
        self.set_inactive_btn = QtWidgets.QPushButton("Set Inactive")
        self.set_inactive_btn.clicked.connect(self.set_widget_inactive)
        self.set_inactive_btn.setEnabled(False)
        control_layout.addWidget(self.set_inactive_btn, 2, 1)
        
        # Show/Hide controls
        self.show_btn = QtWidgets.QPushButton("Show Widget")
        self.show_btn.clicked.connect(self.show_widget)
        self.show_btn.setEnabled(False)
        control_layout.addWidget(self.show_btn, 3, 0)
        
        self.hide_btn = QtWidgets.QPushButton("Hide Widget")
        self.hide_btn.clicked.connect(self.hide_widget)
        self.hide_btn.setEnabled(False)
        control_layout.addWidget(self.hide_btn, 3, 1)
        
        main_layout.addWidget(control_group)
        
        # Close button
        close_group = QtWidgets.QGroupBox("Application")
        close_layout = QtWidgets.QHBoxLayout(close_group)
        
        self.close_all_btn = QtWidgets.QPushButton("Close All Windows")
        self.close_all_btn.setStyleSheet("QPushButton { background-color: #f44336; color: white; font-weight: bold; }")
        self.close_all_btn.clicked.connect(self.close_all_windows)
        close_layout.addWidget(self.close_all_btn)
        
        main_layout.addWidget(close_group)
        
        # Spacer
        main_layout.addStretch()
    
    def show_hierarchy_window(self):
        """Show the hierarchy window"""
        self.hierarchy_window.show()
        self.hierarchy_window.raise_()
        self.hierarchy_window.activateWindow()
    
    def show_info_window(self):
        """Show the info window"""
        self.info_window.show()
        self.info_window.raise_()
        self.info_window.activateWindow()
    
    def close_all_windows(self):
        """Close all windows"""
        self.hierarchy_window.close()
        self.info_window.close()
        self.close()
    
    def is_widget_valid_for_capture(self, widget):
        """Check if a widget is valid for capture (more lenient than is_widget_valid)"""
        if not widget:
            return False
            
        try:
            # Basic existence check
            if hasattr(widget, '__class__'):
                widget.__class__.__name__
                return True
            elif hasattr(widget, 'metaObject'):
                widget.metaObject().className()
                return True
            else:
                return False
        except:
            return False
        
    def start_widget_selection(self):
        """Start the widget selection process"""
        self.select_widget_btn.setText("Click on a Maya widget...")
        self.select_widget_btn.setStyleSheet("QPushButton { background-color: #FF9800; color: white; font-weight: bold; }")
        self.inspector.start_capture()
        
    def load_widget(self, widget):
        """Load the selected widget into the controller"""
        # Validate widget before doing anything
        if not self.is_widget_valid_for_capture(widget):
            print("Selected widget is not valid for loading")
            return
            
        # IMMEDIATELY capture all information while widget is valid
        print(f"\n{'='*50}")
        print("CAPTURING WIDGET INFORMATION IMMEDIATELY...")
        
        # Store widget reference
        self.current_widget = widget
        
        # Capture all information in one go to avoid widget deletion issues
        widget_summary = None
        widget_info = None
        hierarchy_data = None
        
        try:
            # Get basic widget info first
            widget_name = widget.__class__.__name__ if hasattr(widget, '__class__') else 'Unknown'
            print(f"WIDGET SELECTED: {widget_name}")
            
            if hasattr(widget, 'objectName'):
                print(f"Object Name: {widget.objectName() or 'No name'}")
            
            if hasattr(widget, 'isEnabled'):
                print(f"Enabled: {widget.isEnabled()}")
            
            if hasattr(widget, 'isVisible'):
                print(f"Visible: {widget.isVisible()}")
            
            # Print parent information safely
            if hasattr(widget, 'parent'):
                parent = widget.parent()
                if parent and self.is_widget_valid(parent):
                    parent_name = parent.__class__.__name__ if hasattr(parent, '__class__') else 'Unknown'
                    print(f"Parent: {parent_name}")
                    if hasattr(parent, 'isEnabled'):
                        print(f"Parent Enabled: {parent.isEnabled()}")
                    if hasattr(parent, 'isVisible'):
                        print(f"Parent Visible: {parent.isVisible()}")
            
            # Print children count safely
            if hasattr(widget, 'children'):
                try:
                    children = widget.children()
                    print(f"Children count: {len(children)}")
                except:
                    print("Children count: Unknown")
            
            # Capture widget summary immediately
            widget_summary = self.get_widget_summary(widget)
            
            # Capture detailed widget info immediately
            widget_info = self.get_widget_info(widget)
            
            # Capture hierarchy data for tree population
            hierarchy_data = self.capture_hierarchy_data(widget)
                    
        except Exception as e:
            print(f"Error getting widget info: {str(e)}")
            
        print(f"{'='*50}")
        
        # Reset button appearance
        self.select_widget_btn.setText("Click to Select Maya Widget")
        self.select_widget_btn.setStyleSheet("QPushButton { background-color: #4CAF50; color: white; font-weight: bold; }")
        
        # Update UI with captured information (safe operations)
        if widget_summary:
            self.current_widget_label.setText(widget_summary)
        
        if widget_info:
            self.info_window.widget_info_label.setText(widget_info)
        
        # Populate hierarchy list
        self.populate_hierarchy_list(widget)
        
        # Enable control buttons
        self.enable_control_buttons(True)
        
        # Update widget state (check if widget is still valid first)
        if self.is_widget_valid(self.current_widget):
            self.update_widget_state()
        else:
            self.info_window.state_info_label.setText("Widget was deleted after capture")
            self.current_widget_label.setText("Widget was deleted after capture")
    
    def get_widget_summary(self, widget):
        """Get a brief summary of the widget for the main window"""
        if not widget:
            return "No widget selected"
        
        if not self.is_widget_valid(widget):
            return "Widget has been deleted or is invalid"
        
        try:
            # Get widget type
            widget_type = "Unknown"
            if hasattr(widget, '__class__') and hasattr(widget.__class__, '__name__'):
                widget_type = widget.__class__.__name__
            elif hasattr(widget, 'metaObject') and hasattr(widget.metaObject(), 'className'):
                widget_type = widget.metaObject().className()
            
            # Get object name
            object_name = "No name"
            if hasattr(widget, 'objectName'):
                try:
                    name = widget.objectName()
                    object_name = name if name else "No name"
                except:
                    pass
            
            # Get enabled/visible state
            enabled_state = "Unknown"
            visible_state = "Unknown"
            
            if hasattr(widget, 'isEnabled'):
                try:
                    enabled_state = "Enabled" if widget.isEnabled() else "Disabled"
                except:
                    pass
                    
            if hasattr(widget, 'isVisible'):
                try:
                    visible_state = "Visible" if widget.isVisible() else "Hidden"
                except:
                    pass
            
            return f"Type: {widget_type}\nName: {object_name}\nState: {enabled_state}, {visible_state}"
            
        except Exception as e:
            return f"Error getting widget summary: {str(e)}"
        
    def get_widget_type_classification(self, widget):
        """Classify widget as C++, PySide2, or Maya Internal"""
        if not widget:
            return "Unknown"
            
        try:
            # Check if it's a C++ widget using shiboken2
            try:
                import shiboken2
                if shiboken2.isValid(widget):
                    # Check if it has metaObject (C++ Qt widget)
                    if hasattr(widget, 'metaObject') and hasattr(widget.metaObject(), 'className'):
                        class_name = widget.metaObject().className()
                        
                        # Check for Maya-specific widgets
                        maya_widgets = [
                            'MQtUtil', 'mayaCommand', 'mayaWidget', 'mayaWindow',
                            'MayaQWidgetDockableMixin', 'MayaQDockWidget',
                            'workspaceControl', 'scriptedPanel', 'modelPanel'
                        ]
                        
                        # Check if object name or class suggests Maya internal
                        object_name = ""
                        if hasattr(widget, 'objectName'):
                            try:
                                object_name = widget.objectName() or ""
                            except:
                                pass
                        
                        maya_indicators = [
                            'maya', 'Maya', 'MAYA', 'outliner', 'channelBox',
                            'timeSlider', 'playbackControls', 'shelf', 'menuBar',
                            'statusLine', 'commandLine', 'helpLine'
                        ]
                        
                        # Check for Maya indicators
                        if any(indicator in class_name for indicator in maya_widgets):
                            return "Maya Internal (C++)"
                        elif any(indicator in object_name.lower() for indicator in maya_indicators):
                            return "Maya Internal (C++)"
                        elif any(indicator in class_name.lower() for indicator in maya_indicators):
                            return "Maya Internal (C++)"
                        else:
                            return "C++ Qt Widget"
                    else:
                        return "C++ Object"
                else:
                    return "Invalid C++ Object"
            except ImportError:
                pass
            
            # Check if it's a Python/PySide2 widget
            if hasattr(widget, '__class__') and hasattr(widget.__class__, '__module__'):
                module = widget.__class__.__module__
                if 'PySide2' in module or 'PySide' in module:
                    return "PySide2 Widget"
                elif 'PyQt' in module:
                    return "PyQt Widget"
                elif 'maya' in module.lower():
                    return "Maya Internal (Python)"
                else:
                    return "Python Widget"
            
            # Fallback check
            if hasattr(widget, '__class__'):
                return "Python Object"
            else:
                return "Unknown Object"
                
        except Exception as e:
            return f"Error: {str(e)}"

    def get_widget_info(self, widget):
        """Get information about the widget"""
        if not widget:
            return "No widget selected"
        
        if not self.is_widget_valid(widget):
            return "Widget has been deleted or is invalid"
            
        info_lines = []
        
        try:
            # Get widget type and classification
            widget_type = "Unknown"
            if hasattr(widget, '__class__') and hasattr(widget.__class__, '__name__'):
                widget_type = widget.__class__.__name__
            elif hasattr(widget, 'metaObject') and hasattr(widget.metaObject(), 'className'):
                widget_type = widget.metaObject().className()
            
            # Get widget classification
            classification = self.get_widget_type_classification(widget)
            
            info_lines.append(f"Type: {widget_type}")
            info_lines.append(f"Classification: {classification}")
            
            # Get object name
            object_name = "No name"
            if hasattr(widget, 'objectName'):
                try:
                    name = widget.objectName()
                    object_name = name if name else "No name"
                except:
                    pass
            info_lines.append(f"Object Name: {object_name}")
            
            # Get size and position
            try:
                if hasattr(widget, 'size') and hasattr(widget, 'pos'):
                    size = widget.size()
                    pos = widget.pos()
                    info_lines.append(f"Size: {size.width()} x {size.height()}")
                    info_lines.append(f"Position: ({pos.x()}, {pos.y()})")
            except:
                info_lines.append("Size/Position: Not available")
            
            # Try to get text content
            text_found = False
            for text_method in ['text', 'title', 'windowTitle', 'toolTip']:
                if hasattr(widget, text_method):
                    try:
                        text_func = getattr(widget, text_method)
                        if callable(text_func):
                            text = text_func()
                            if text:
                                info_lines.append(f"{text_method.title()}: {text[:50]}{'...' if len(text) > 50 else ''}")
                                text_found = True
                                break
                    except:
                        continue
            
            if not text_found:
                info_lines.append("Text: No text content")
        
        except Exception as e:
            info_lines.append(f"Error getting basic info: {str(e)}")
        
        return "\n".join(info_lines)
    
    def capture_hierarchy_data(self, widget):
        """Capture hierarchy data while widget is still valid"""
        if not widget or not self.is_widget_valid(widget):
            return None
            
        try:
            hierarchy_data = {
                'root_chain': [],
                'selected_widget': widget,
                'widget_data': {}
            }
            
            # Capture the full parent chain
            current = widget
            depth = 0
            max_depth = 20
            
            while depth < max_depth and current and self.is_widget_valid(current):
                # Capture widget data
                widget_data = {
                    'widget': current,
                    'type': 'Unknown',
                    'object_name': 'No name',
                    'enabled': 'Unknown',
                    'visible': 'Unknown',
                    'text': '',
                    'children': []
                }
                
                # Get widget type
                if hasattr(current, '__class__') and hasattr(current.__class__, '__name__'):
                    widget_data['type'] = current.__class__.__name__
                elif hasattr(current, 'metaObject') and hasattr(current.metaObject(), 'className'):
                    widget_data['type'] = current.metaObject().className()
                
                # Get object name
                if hasattr(current, 'objectName'):
                    try:
                        name = current.objectName()
                        widget_data['object_name'] = name if name else "No name"
                    except:
                        pass
                
                # Get states
                if hasattr(current, 'isEnabled'):
                    try:
                        widget_data['enabled'] = current.isEnabled()
                    except:
                        pass
                        
                if hasattr(current, 'isVisible'):
                    try:
                        widget_data['visible'] = current.isVisible()
                    except:
                        pass
                
                # Get text
                for text_method in ['text', 'title', 'windowTitle']:
                    if hasattr(current, text_method):
                        try:
                            text_func = getattr(current, text_method)
                            if callable(text_func):
                                text = text_func()
                                if text:
                                    widget_data['text'] = text[:20] + ('...' if len(text) > 20 else '')
                                    break
                        except:
                            continue
                
                # Get children
                try:
                    children = []
                    if hasattr(current, 'children') and callable(current.children):
                        children = current.children()
                    elif hasattr(current, 'findChildren'):
                        all_children = current.findChildren(QtCore.QObject)
                        children = [child for child in all_children if child.parent() == current]
                    
                    # Capture limited child data
                    for child in children[:10]:  # Limit to first 10
                        if self.is_widget_valid(child):
                            child_data = {
                                'widget': child,
                                'type': 'Unknown',
                                'object_name': 'No name'
                            }
                            
                            if hasattr(child, '__class__'):
                                child_data['type'] = child.__class__.__name__
                            elif hasattr(child, 'metaObject'):
                                child_data['type'] = child.metaObject().className()
                            
                            if hasattr(child, 'objectName'):
                                try:
                                    name = child.objectName()
                                    child_data['object_name'] = name if name else "No name"
                                except:
                                    pass
                            
                            widget_data['children'].append(child_data)
                            
                except Exception as e:
                    print(f"Error capturing children for {widget_data['type']}: {str(e)}")
                
                hierarchy_data['root_chain'].append(current)
                hierarchy_data['widget_data'][id(current)] = widget_data
                
                # Move to parent
                try:
                    parent = current.parent() if hasattr(current, 'parent') else None
                    if not parent or not self.is_widget_valid(parent):
                        break
                    current = parent
                    depth += 1
                except:
                    break
            
            return hierarchy_data
            
        except Exception as e:
            print(f"Error capturing hierarchy data: {str(e)}")
            return None
    
    def populate_hierarchy_tree_from_data(self, hierarchy_data):
        """Populate hierarchy tree from captured data"""
        if not hierarchy_data:
            return
            
        try:
            self.hierarchy_window.hierarchy_tree.clear()
            
            # Use the topmost widget as root
            if hierarchy_data['root_chain']:
                root_widget = hierarchy_data['root_chain'][-1]
                root_data = hierarchy_data['widget_data'].get(id(root_widget))
                
                if root_data:
                    root_item = self.create_tree_item_from_data(root_data, None)
                    if root_item:
                        self.hierarchy_window.hierarchy_tree.addTopLevelItem(root_item)
                        
                        # Add children recursively
                        self.add_children_from_data(root_data, root_item, hierarchy_data)
                        
                        # Expand and highlight
                        self.expand_to_widget_from_data(root_item, hierarchy_data['selected_widget'])
                        self.highlight_widget_from_data(root_item, hierarchy_data['selected_widget'])
            
        except Exception as e:
            print(f"Error populating hierarchy from data: {str(e)}")
    
    def create_tree_item_from_data(self, widget_data, parent_item):
        """Create tree item from captured widget data"""
        try:
            widget_type = widget_data.get('type', 'Unknown')
            object_name = widget_data.get('object_name', 'No name')
            enabled = widget_data.get('enabled', 'Unknown')
            visible = widget_data.get('visible', 'Unknown')
            text = widget_data.get('text', '')
            
            text_preview = f" - '{text}'" if text else ""
            display_text = f"{widget_type}{text_preview}"
            
            if parent_item:
                item = QtWidgets.QTreeWidgetItem(parent_item)
            else:
                item = QtWidgets.QTreeWidgetItem()
            
            item.setText(0, display_text)
            item.setText(1, widget_type)
            item.setText(2, str(enabled))
            item.setText(3, str(visible))
            item.setText(4, object_name)
            
            # Store widget reference
            widget = widget_data.get('widget')
            if widget:
                item.setData(0, Qt.UserRole, widget)
            
            # Color coding
            if enabled == "Unknown":
                item.setBackground(0, QtGui.QColor(220, 220, 220))
            elif enabled == False:
                item.setBackground(0, QtGui.QColor(255, 255, 200))
            elif widget == self.current_widget:
                item.setBackground(0, QtGui.QColor(200, 255, 200))
            
            return item
            
        except Exception as e:
            print(f"Error creating tree item from data: {str(e)}")
            return None
    
    def add_children_from_data(self, widget_data, tree_item, hierarchy_data):
        """Add children from captured data"""
        try:
            children = widget_data.get('children', [])
            for child_data in children:
                child_item = self.create_tree_item_from_data(child_data, tree_item)
                if child_item:
                    # Check if we have more detailed data for this child
                    child_widget = child_data.get('widget')
                    if child_widget:
                        detailed_data = hierarchy_data['widget_data'].get(id(child_widget))
                        if detailed_data:
                            self.add_children_from_data(detailed_data, child_item, hierarchy_data)
                            
        except Exception as e:
            print(f"Error adding children from data: {str(e)}")
    
    def expand_to_widget_from_data(self, root_item, target_widget):
        """Expand to target widget using captured data"""
        try:
            self.expand_items_to_target(root_item, target_widget)
        except Exception as e:
            print(f"Error expanding to widget from data: {str(e)}")
    
    def expand_items_to_target(self, item, target_widget):
        """Recursively expand items to target widget"""
        try:
            widget = item.data(0, Qt.UserRole)
            if widget == target_widget:
                # Expand all parents
                parent_item = item.parent()
                while parent_item:
                    parent_item.setExpanded(True)
                    parent_item = parent_item.parent()
                return True
            
            # Check children
            for i in range(item.childCount()):
                child_item = item.child(i)
                if self.expand_items_to_target(child_item, target_widget):
                    item.setExpanded(True)
                    return True
                    
        except:
            pass
        return False
    
    def highlight_widget_from_data(self, root_item, target_widget):
        """Highlight target widget in tree"""
        try:
            self.find_and_select_target(root_item, target_widget)
        except Exception as e:
            print(f"Error highlighting widget from data: {str(e)}")
    
    def find_and_select_target(self, item, target_widget):
        """Find and select target widget"""
        try:
            widget = item.data(0, Qt.UserRole)
            if widget == target_widget:
                self.hierarchy_window.hierarchy_tree.setCurrentItem(item)
                return True
            
            # Check children
            for i in range(item.childCount()):
                child_item = item.child(i)
                if self.find_and_select_target(child_item, target_widget):
                    return True
                    
        except:
            pass
        return False
    
    def switch_to_widget(self, widget):
        """Switch to a different widget"""
        if not widget or not self.is_widget_valid(widget):
            print("Cannot switch to invalid widget")
            return
            
        print(f"\n=== SWITCHING TO WIDGET ===")
        print(f"New Widget: {widget.__class__.__name__ if hasattr(widget, '__class__') else 'Unknown'}")
        
        # Set as current widget
        self.current_widget = widget
        
        # Update all UI elements
        widget_summary = self.get_widget_summary(widget)
        self.current_widget_label.setText(widget_summary)
        
        widget_info = self.get_widget_info(widget)
        self.info_window.widget_info_label.setText(widget_info)
        
        # Update hierarchy list
        self.populate_hierarchy_list(widget)
        
        # Update hierarchy list
        self.populate_hierarchy_list(widget)
        
        print("Widget switch completed")
    
    def populate_hierarchy_tree(self):
        """Populate the hierarchy tree with widget information"""
        if not self.current_widget:
            return
        
        # Check if current widget is still valid before proceeding
        if not self.is_widget_valid(self.current_widget):
            print("Current widget has been deleted, cannot populate hierarchy")
            self.hierarchy_window.hierarchy_tree.clear()
            # Add a message item
            message_item = QtWidgets.QTreeWidgetItem()
            message_item.setText(0, "Widget has been deleted")
            message_item.setText(1, "Please select a new widget")
            message_item.setBackground(0, QtGui.QColor(255, 200, 200))
            self.hierarchy_window.hierarchy_tree.addTopLevelItem(message_item)
            return
            
        try:
            self.hierarchy_window.hierarchy_tree.clear()
            
            # Find the root widget by going up the parent chain safely
            root_widget = self.current_widget
            max_depth = 20  # Prevent infinite loops
            depth = 0
            
            # Capture the parent chain while the widget is still valid
            parent_chain = []
            current = self.current_widget
            
            while depth < max_depth:
                try:
                    if not self.is_widget_valid(current):
                        break
                    parent_chain.append(current)
                    parent = current.parent() if hasattr(current, 'parent') else None
                    if not parent or not self.is_widget_valid(parent):
                        break
                    current = parent
                    depth += 1
                except:
                    break
            
            # Use the topmost valid parent as root
            if parent_chain:
                root_widget = parent_chain[-1]  # Last item is the root
            
            # Create the tree starting from root
            root_item = self.create_tree_item(root_widget, None)
            if root_item:
                self.hierarchy_window.hierarchy_tree.addTopLevelItem(root_item)
                
                # Recursively add children
                self.add_children_to_tree_item(root_widget, root_item)
                
                # Expand the tree to show the selected widget's path
                self.expand_to_widget(root_item, self.current_widget)
                
                # Highlight the current widget
                self.highlight_current_widget(root_item, self.current_widget)
            
        except Exception as e:
            print(f"Error populating hierarchy tree: {str(e)}")
            # Create an error item
            error_item = QtWidgets.QTreeWidgetItem()
            error_item.setText(0, f"Error: {str(e)}")
            error_item.setText(1, "Hierarchy unavailable")
            error_item.setBackground(0, QtGui.QColor(255, 200, 200))
            self.hierarchy_window.hierarchy_tree.addTopLevelItem(error_item)
    
    def create_tree_item(self, widget, parent_item):
        """Create a tree item for a widget"""
        if not widget or not self.is_widget_valid(widget):
            # Create a placeholder item for invalid widgets
            if parent_item:
                item = QtWidgets.QTreeWidgetItem(parent_item)
            else:
                item = QtWidgets.QTreeWidgetItem()
            
            item.setText(0, "INVALID WIDGET")
            item.setText(1, "Unknown")
            item.setText(2, "INVALID")
            item.setText(3, "INVALID")
            item.setText(4, "No name")
            item.setBackground(0, QtGui.QColor(255, 150, 150))  # Red for invalid
            return item
            
        try:
            # Get widget type safely
            widget_type = "Unknown"
            if hasattr(widget, '__class__') and hasattr(widget.__class__, '__name__'):
                widget_type = widget.__class__.__name__
            elif hasattr(widget, 'metaObject') and hasattr(widget.metaObject(), 'className'):
                # For C++ widgets
                widget_type = widget.metaObject().className()
            
            # Get object name safely
            object_name = "No name"
            if hasattr(widget, 'objectName'):
                try:
                    name = widget.objectName()
                    object_name = name if name else "No name"
                except:
                    pass
            
            # Get widget state safely
            is_enabled = "Unknown"
            is_visible = "Unknown"
            
            if hasattr(widget, 'isEnabled'):
                try:
                    is_enabled = widget.isEnabled()
                except:
                    pass
                    
            if hasattr(widget, 'isVisible'):
                try:
                    is_visible = widget.isVisible()
                except:
                    pass
            
            # Get text if available
            text_preview = ""
            if hasattr(widget, 'text') and callable(widget.text):
                try:
                    text = widget.text()
                    if text:
                        text_preview = f" - '{text[:20]}{'...' if len(text) > 20 else ''}'"
                except:
                    pass
            elif hasattr(widget, 'title') and callable(widget.title):
                try:
                    text = widget.title()
                    if text:
                        text_preview = f" - '{text[:20]}{'...' if len(text) > 20 else ''}'"
                except:
                    pass
            
            display_text = f"{widget_type}{text_preview}"
            
            if parent_item:
                item = QtWidgets.QTreeWidgetItem(parent_item)
            else:
                item = QtWidgets.QTreeWidgetItem()
            
            item.setText(0, display_text)
            item.setText(1, widget_type)
            item.setText(2, str(is_enabled))
            item.setText(3, str(is_visible))
            item.setText(4, object_name)
            
            # Store widget reference
            item.setData(0, Qt.UserRole, widget)
            
            # Color coding based on state
            if is_enabled == "Unknown":
                item.setBackground(0, QtGui.QColor(220, 220, 220))  # Gray for unknown
            elif is_enabled == False:
                item.setBackground(0, QtGui.QColor(255, 255, 200))  # Light yellow for disabled
            elif widget == self.current_widget:
                item.setBackground(0, QtGui.QColor(200, 255, 200))  # Light green for selected
            
            return item
            
        except Exception as e:
            print(f"Error creating tree item for widget: {str(e)}")
            # Create a placeholder item for problematic widgets
            if parent_item:
                item = QtWidgets.QTreeWidgetItem(parent_item)
            else:
                item = QtWidgets.QTreeWidgetItem()
            
            item.setText(0, f"ERROR WIDGET: {str(e)}")
            item.setText(1, "Error")
            item.setText(2, "ERROR")
            item.setText(3, "ERROR")
            item.setText(4, "No name")
            item.setBackground(0, QtGui.QColor(255, 150, 150))  # Red for error
            
            return item
    
    def add_children_to_tree_item(self, widget, tree_item):
        """Recursively add children to a tree item"""
        if not widget or not self.is_widget_valid(widget):
            return
            
        try:
            children = []
            
            # Try different methods to get children
            if hasattr(widget, 'children') and callable(widget.children):
                try:
                    children = widget.children()
                except:
                    pass
            elif hasattr(widget, 'findChildren'):
                try:
                    # For C++ widgets, get immediate children only
                    all_children = widget.findChildren(QtCore.QObject)
                    # Filter to direct children only
                    children = [child for child in all_children if child.parent() == widget]
                except:
                    pass
            
            # Limit children to prevent UI freeze
            max_children = 50
            for i, child in enumerate(children[:max_children]):
                if self.is_widget_valid(child):
                    child_item = self.create_tree_item(child, tree_item)
                    if child_item:
                        # Limit recursion depth to prevent infinite loops
                        if tree_item.parent() is None or tree_item.parent().parent() is None:
                            self.add_children_to_tree_item(child, child_item)
                            
            if len(children) > max_children:
                # Add a note about truncated children
                truncated_item = QtWidgets.QTreeWidgetItem(tree_item)
                truncated_item.setText(0, f"... and {len(children) - max_children} more children")
                truncated_item.setText(1, "Info")
                truncated_item.setBackground(0, QtGui.QColor(240, 240, 240))
                
        except Exception as e:
            print(f"Error getting children for widget: {str(e)}")
            # Add an error item
            error_item = QtWidgets.QTreeWidgetItem(tree_item)
            error_item.setText(0, f"Error getting children: {str(e)}")
            error_item.setText(1, "Error")
            error_item.setBackground(0, QtGui.QColor(255, 200, 200))
    
    def expand_to_widget(self, root_item, target_widget):
        """Expand tree items to show path to target widget"""
        try:
            # Build path from target to root
            path = []
            current = target_widget
            while current:
                path.append(current)
                try:
                    current = current.parent()
                except:
                    break
            
            # Expand items in the path
            self.expand_items_in_path(root_item, path)
            
        except Exception as e:
            print(f"Error expanding to widget: {str(e)}")
    
    def expand_items_in_path(self, item, path):
        """Recursively expand items that are in the path"""
        try:
            widget = item.data(0, Qt.UserRole)
            if widget in path:
                item.setExpanded(True)
            
            # Check children
            for i in range(item.childCount()):
                child_item = item.child(i)
                self.expand_items_in_path(child_item, path)
                
        except:
            pass
    
    def highlight_current_widget(self, root_item, target_widget):
        """Highlight the current widget in the tree"""
        try:
            self.find_and_select_item(root_item, target_widget)
        except Exception as e:
            print(f"Error highlighting current widget: {str(e)}")
    
    def find_and_select_item(self, item, target_widget):
        """Find and select the item for target widget"""
        try:
            widget = item.data(0, Qt.UserRole)
            if widget == target_widget:
                self.hierarchy_window.hierarchy_tree.setCurrentItem(item)
                return True
            
            # Check children
            for i in range(item.childCount()):
                child_item = item.child(i)
                if self.find_and_select_item(child_item, target_widget):
                    return True
                    
        except:
            pass
        return False
    
    def on_hierarchy_item_clicked(self, item, column):
        """Handle clicking on a hierarchy item"""
        try:
            widget = item.data(0, Qt.UserRole)
            if widget and self.is_widget_valid(widget):
                # Switch to this widget
                self.current_widget = widget
                
                print(f"\n=== SWITCHED TO WIDGET FROM HIERARCHY ===")
                print(f"Widget: {widget.__class__.__name__}")
                print(f"Object Name: {widget.objectName() or 'No name'}")
                print(f"Enabled: {widget.isEnabled()}")
                print(f"Visible: {widget.isVisible()}")
                
                # Update UI
                widget_info = self.get_widget_info(widget)
                self.info_window.widget_info_label.setText(widget_info)
                self.update_widget_state()
                
                # Refresh hierarchy to update highlighting
                self.populate_hierarchy_tree()
            else:
                print("Selected widget has been deleted and is no longer valid")
                    
        except Exception as e:
            print(f"Error handling hierarchy item click: {str(e)}")
    
    def refresh_hierarchy(self):
        """Refresh the hierarchy tree"""
        self.populate_hierarchy_tree()
        
    def update_widget_state(self):
        """Update the widget state information"""
        if not self.current_widget:
            self.info_window.state_info_label.setText("No widget selected")
            return
        
        if not self.is_widget_valid(self.current_widget):
            self.info_window.state_info_label.setText("Current widget has been deleted")
            # Also update the main window summary
            self.current_widget_label.setText("Current widget has been deleted")
            return
            
        try:
            widget = self.current_widget
            state_lines = []
            
            # Get basic states safely
            if hasattr(widget, 'isEnabled'):
                try:
                    state_lines.append(f"Enabled: {widget.isEnabled()}")
                except:
                    state_lines.append("Enabled: Unknown")
                    
            if hasattr(widget, 'isVisible'):
                try:
                    state_lines.append(f"Visible: {widget.isVisible()}")
                except:
                    state_lines.append("Visible: Unknown")
                    
            if hasattr(widget, 'isActiveWindow'):
                try:
                    state_lines.append(f"Active Window: {widget.isActiveWindow()}")
                except:
                    state_lines.append("Active Window: Unknown")
                    
            if hasattr(widget, 'hasFocus'):
                try:
                    state_lines.append(f"Has Focus: {widget.hasFocus()}")
                except:
                    state_lines.append("Has Focus: Unknown")
            
            # Check parent enabled state
            if hasattr(widget, 'parent'):
                try:
                    parent = widget.parent()
                    if parent and self.is_widget_valid(parent):
                        if hasattr(parent, 'isEnabled'):
                            state_lines.append(f"Parent Enabled: {parent.isEnabled()}")
                        if hasattr(parent, 'isVisible'):
                            state_lines.append(f"Parent Visible: {parent.isVisible()}")
                    elif parent:
                        state_lines.append("Parent: DELETED")
                except:
                    state_lines.append("Parent: Error")
            
            # Check for additional states
            if hasattr(widget, 'isChecked'):
                try:
                    state_lines.append(f"Checked: {widget.isChecked()}")
                except:
                    pass
                    
            if hasattr(widget, 'isDown'):
                try:
                    state_lines.append(f"Down: {widget.isDown()}")
                except:
                    pass
            
            # Check if widget is read-only
            if hasattr(widget, 'isReadOnly'):
                try:
                    state_lines.append(f"Read Only: {widget.isReadOnly()}")
                except:
                    pass
            
            # Check widget flags
            if hasattr(widget, 'windowFlags'):
                try:
                    flags = widget.windowFlags()
                    state_lines.append(f"Window Flags: {flags}")
                except:
                    pass
                    
            self.info_window.state_info_label.setText("\n".join(state_lines))
            
            # Update main window summary
            summary = self.get_widget_summary(widget)
            self.current_widget_label.setText(summary)
            
        except Exception as e:
            error_msg = f"Error reading widget state: {str(e)}"
            self.info_window.state_info_label.setText(error_msg)
            self.current_widget_label.setText(error_msg)
            print(f"Error in update_widget_state: {str(e)}")
    
    def enable_control_buttons(self, enabled):
        """Enable or disable control buttons"""
        buttons = [
            self.enable_btn, self.disable_btn,
            self.enable_parent_btn, self.disable_parent_btn,
            self.set_active_btn, self.set_inactive_btn,
            self.show_btn, self.hide_btn
        ]
        
        for btn in buttons:
            btn.setEnabled(enabled)
    
    def is_widget_valid(self, widget):
        """Check if a widget is still valid (not deleted)"""
        if not widget:
            return False
            
        try:
            # For PySide2/Qt widgets
            if hasattr(widget, '__class__'):
                widget.__class__.__name__
                
            # Try to access basic properties that should always work
            if hasattr(widget, 'isEnabled'):
                widget.isEnabled()
            elif hasattr(widget, 'isVisible'):
                widget.isVisible()
            else:
                # For C++ widgets, try objectName which is usually safe
                if hasattr(widget, 'objectName'):
                    widget.objectName()
                else:
                    return False
                    
            return True
        except (RuntimeError, AttributeError):
            # RuntimeError: Internal C++ object already deleted
            # AttributeError: Widget doesn't have expected methods
            return False
    
    def enable_widget(self):
        """Enable the current widget"""
        if not self.current_widget:
            print("No current widget selected")
            return
            
        if not self.is_widget_valid(self.current_widget):
            print("Current widget has been deleted. Please select a new widget.")
            return
                
        try:
            print(f"\n=== ENABLING WIDGET ===")
            print(f"Widget: {self.current_widget.__class__.__name__}")
            print(f"Object Name: {self.current_widget.objectName()}")
            print(f"Before - Enabled: {self.current_widget.isEnabled()}")
            
            # Check parent state
            parent = self.current_widget.parent()
            if parent and self.is_widget_valid(parent):
                print(f"Parent: {parent.__class__.__name__} - Enabled: {parent.isEnabled()}")
            
            # Attempt to enable
            self.current_widget.setEnabled(True)
            
            print(f"After - Enabled: {self.current_widget.isEnabled()}")
            
            # Also try to enable parent if it's disabled
            if parent and self.is_widget_valid(parent) and not parent.isEnabled():
                print(f"Attempting to enable parent: {parent.__class__.__name__}")
                parent.setEnabled(True)
                print(f"Parent after - Enabled: {parent.isEnabled()}")
            
            self.update_widget_state()
            self.populate_hierarchy_tree()
            print(f"Enable operation completed successfully")
            
        except Exception as e:
            print(f"Error enabling widget: {str(e)}")
            import traceback
            traceback.print_exc()
    
    def disable_widget(self):
        """Disable the current widget"""
        if not self.current_widget:
            print("No current widget selected")
            return
            
        if not self.is_widget_valid(self.current_widget):
            print("Current widget has been deleted. Please select a new widget.")
            return
            
        try:
            print(f"\n=== DISABLING WIDGET ===")
            print(f"Widget: {self.current_widget.__class__.__name__}")
            print(f"Object Name: {self.current_widget.objectName()}")
            print(f"Before - Enabled: {self.current_widget.isEnabled()}")
            
            # Attempt to disable
            self.current_widget.setEnabled(False)
            
            print(f"After - Enabled: {self.current_widget.isEnabled()}")
            
            self.update_widget_state()
            print(f"Disable operation completed successfully")
            
        except Exception as e:
            print(f"Error disabling widget: {str(e)}")
            import traceback
            traceback.print_exc()
    
    def enable_parent(self):
        """Enable the parent widget"""
        if not self.current_widget:
            print("No current widget selected")
            return
            
        if not self.is_widget_valid(self.current_widget):
            print("Current widget has been deleted. Please select a new widget.")
            return
        
        if not hasattr(self.current_widget, 'parent'):
            print("Current widget does not have parent() method")
            return
            
        try:
            parent = self.current_widget.parent()
            if not parent:
                print("No parent widget to enable")
                return
                
            if not self.is_widget_valid(parent):
                print("Parent widget has been deleted")
                return
                
            print(f"\n=== ENABLING PARENT WIDGET ===")
            
            parent_name = "Unknown"
            if hasattr(parent, '__class__'):
                parent_name = parent.__class__.__name__
            elif hasattr(parent, 'metaObject'):
                parent_name = parent.metaObject().className()
            print(f"Parent: {parent_name}")
            
            if hasattr(parent, 'objectName'):
                try:
                    obj_name = parent.objectName()
                    print(f"Object Name: {obj_name or 'No name'}")
                except:
                    print("Object Name: Error getting name")
            
            if hasattr(parent, 'isEnabled'):
                try:
                    before_state = parent.isEnabled()
                    print(f"Before - Enabled: {before_state}")
                except:
                    print("Before - Enabled: Error getting state")
            
            # Attempt to enable
            if hasattr(parent, 'setEnabled'):
                parent.setEnabled(True)
                print("setEnabled(True) called")
            else:
                print("Parent widget does not have setEnabled method")
                return
            
            if hasattr(parent, 'isEnabled'):
                try:
                    after_state = parent.isEnabled()
                    print(f"After - Enabled: {after_state}")
                except:
                    print("After - Enabled: Error getting state")
            
            self.update_widget_state()
            print(f"Parent enable operation completed successfully")
            
        except Exception as e:
            print(f"Error enabling parent widget: {str(e)}")
            import traceback
            traceback.print_exc()
    
    def disable_parent(self):
        """Disable the parent widget"""
        if not self.current_widget:
            print("No current widget selected")
            return
            
        if not self.is_widget_valid(self.current_widget):
            print("Current widget has been deleted. Please select a new widget.")
            return
            
        if not hasattr(self.current_widget, 'parent'):
            print("Current widget does not have parent() method")
            return
            
        try:
            parent = self.current_widget.parent()
            if not parent:
                print("No parent widget to disable")
                return
                
            if not self.is_widget_valid(parent):
                print("Parent widget has been deleted")
                return
                
            print(f"\n=== DISABLING PARENT WIDGET ===")
            print(f"Parent: {parent.__class__.__name__}")
            print(f"Object Name: {parent.objectName()}")
            print(f"Before - Enabled: {parent.isEnabled()}")
            
            parent.setEnabled(False)
            
            print(f"After - Enabled: {parent.isEnabled()}")
            
            self.update_widget_state()
            print(f"Parent disable operation completed successfully")
            
        except Exception as e:
            print(f"Error disabling parent widget: {str(e)}")
            import traceback
            traceback.print_exc()
    
    def set_widget_active(self):
        """Set the widget as active (if supported)"""
        if not self.current_widget:
            print("No current widget selected")
            return
            
        if not self.is_widget_valid(self.current_widget):
            print("Current widget has been deleted. Please select a new widget.")
            return
            
        try:
            print(f"\n=== SETTING WIDGET ACTIVE ===")
            print(f"Widget: {self.current_widget.__class__.__name__}")
            print(f"Object Name: {self.current_widget.objectName()}")
            print(f"Before - Has Focus: {self.current_widget.hasFocus()}")
            
            if hasattr(self.current_widget, 'setFocus'):
                self.current_widget.setFocus()
                print("setFocus() called")
            else:
                print("Widget does not have setFocus method")
                
            if hasattr(self.current_widget, 'activateWindow'):
                self.current_widget.activateWindow()
                print("activateWindow() called")
            else:
                print("Widget does not have activateWindow method")
                
            if hasattr(self.current_widget, 'raise_'):
                self.current_widget.raise_()
                print("raise_() called")
            else:
                print("Widget does not have raise_ method")
            
            print(f"After - Has Focus: {self.current_widget.hasFocus()}")
                
            self.update_widget_state()
            print(f"Set active operation completed")
            
        except Exception as e:
            print(f"Error setting widget active: {str(e)}")
            import traceback
            traceback.print_exc()
    
    def set_widget_inactive(self):
        """Set the widget as inactive (if supported)"""
        if not self.current_widget:
            print("No current widget selected")
            return
            
        if not self.is_widget_valid(self.current_widget):
            print("Current widget has been deleted. Please select a new widget.")
            return
            
        try:
            if hasattr(self.current_widget, 'clearFocus'):
                self.current_widget.clearFocus()
                
            self.update_widget_state()
            print(f"Widget set inactive: {self.current_widget.__class__.__name__}")
        except Exception as e:
            print(f"Error setting widget inactive: {str(e)}")
    
    def show_widget(self):
        """Show the current widget"""
        if not self.current_widget:
            print("No current widget selected")
            return
            
        if not self.is_widget_valid(self.current_widget):
            print("Current widget has been deleted. Please select a new widget.")
            return
            
        try:
            self.current_widget.show()
            self.update_widget_state()
            print(f"Widget shown: {self.current_widget.__class__.__name__}")
        except Exception as e:
            print(f"Error showing widget: {str(e)}")
    
    def hide_widget(self):
        """Hide the current widget"""
        if not self.current_widget:
            print("No current widget selected")
            return
            
        if not self.is_widget_valid(self.current_widget):
            print("Current widget has been deleted. Please select a new widget.")
            return
            
        try:
            self.current_widget.hide()
            self.update_widget_state()
            print(f"Widget hidden: {self.current_widget.__class__.__name__}")
        except Exception as e:
            print(f"Error hiding widget: {str(e)}")
    
    def closeEvent(self, event):
        """Clean up when closing the window"""
        if self.inspector.capturing:
            self.inspector.stop_capture()
        
        # Close child windows
        self.hierarchy_window.close()
        self.info_window.close()
        
        event.accept()


def show_widget_controller():
    """Show the Widget Controller UI"""
    global widget_controller_ui
    
    try:
        widget_controller_ui.close_all_windows()
        widget_controller_ui.deleteLater()
    except:
        pass
    
    widget_controller_ui = WidgetControllerUI()
    widget_controller_ui.show()
    
    # Show the info window by default
    widget_controller_ui.show_info_window()
    
    return widget_controller_ui


# Global variable to keep the UI alive
widget_controller_ui = None

if __name__ == "__main__":
    show_widget_controller()
