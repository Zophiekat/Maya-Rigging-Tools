import sys
import os
import importlib
import traceback

def launch_attribute_connector():
    """
    Launch the Attribute Connector tool, setting up proper paths and imports.
    This script can be run directly from Maya's script editor or as a shelf button.
    
    Compatible with both PySide2 (Maya 2024 and earlier) and PySide6 (Maya 2025+).
    """
    # Get the directory where this script is located
    current_dir = os.path.dirname(os.path.abspath(__file__))
    print("Current script directory:", current_dir)
    
    # Add this directory to sys.path if not already there
    if current_dir not in sys.path:
        sys.path.insert(0, current_dir)
        print(f"Added {current_dir} to sys.path")
        
    # Apply UI style fixes before creating any windows
    try:
        from Attribute_Connector import ui_style_fixes
        print("Applied UI style fixes to prevent warnings")
    except Exception as e:
        print(f"Warning: Could not apply UI style fixes: {e}")

    # Try to import the required modules
    try:
        # First, import our Qt compatibility module
        try:
            # Try to reload the module if it exists
            if 'qt_compatibility' in sys.modules:
                print("Reloading qt_compatibility module")
                importlib.reload(sys.modules['qt_compatibility'])
            
            # Import the module
            import qt_compatibility
            QtCore = qt_compatibility.QtCore
            QtGui = qt_compatibility.QtGui
            QtWidgets = qt_compatibility.QtWidgets
            qt_binding = qt_compatibility.qt_binding
            print(f"Using {qt_binding} for Qt binding")
            
        except Exception as e:
            print(f"Error loading qt_compatibility: {e}")
            print("Falling back to direct Qt imports")
            
            # Try to determine Maya version for appropriate PySide version
            try:
                import maya.cmds as cmds
                maya_version = int(cmds.about(version=True))
                print(f"Detected Maya version: {maya_version}")
                
                if maya_version >= 2025:
                    print("Using PySide6 (Maya 2025+)")
                    from PySide6 import QtCore, QtGui, QtWidgets
                    qt_binding = "PySide6"
                else:
                    print("Using PySide2 (Maya 2024 or earlier)")
                    from PySide2 import QtCore, QtGui, QtWidgets
                    qt_binding = "PySide2"
            
            except ImportError:
                # Not in Maya or can't determine version
                print("Not in Maya or can't determine version")
                try:
                    # Try PySide6 first
                    from PySide6 import QtCore, QtGui, QtWidgets
                    qt_binding = "PySide6"
                    print("Using PySide6")
                except ImportError:
                    # Fall back to PySide2
                    from PySide2 import QtCore, QtGui, QtWidgets
                    qt_binding = "PySide2"
                    print("Using PySide2")
            
        # Import the main UI module
        try:
            # Reload the module if it's already loaded to ensure we have the latest version
            if 'Attribute_Connector.ui_class_attribute_connector' in sys.modules:
                print("Reloading ui_class_attribute_connector module")
                importlib.reload(sys.modules['Attribute_Connector.ui_class_attribute_connector'])
            
            # Import the module
            from Attribute_Connector.ui_class_attribute_connector import AttributeConnectorUI
            print("Successfully imported AttributeConnectorUI")
        except Exception as e:
            print(f"Error importing AttributeConnectorUI: {e}")
            traceback.print_exc()
            return None
        
        # Create and show the UI
        app = QtWidgets.QApplication.instance()
        if app is None:
            app = QtWidgets.QApplication([])
            print("Created new QApplication instance")
        else:
            print("Using existing QApplication instance")
        
        ui = AttributeConnectorUI()
        ui.show()
        
        # If running standalone (not in Maya), start the event loop
        if 'maya' not in sys.modules:
            app.exec_()
            
        return ui
        
    except Exception as e:
        print(f"Error launching Attribute Connector: {e}")
        traceback.print_exc()
        return None

# Run the launcher if this script is executed directly
if __name__ == "__main__":
    launch_attribute_connector()
