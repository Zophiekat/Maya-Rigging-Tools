import sys
import os
import logging
import pathlib

# Get paths
maya_scripts_dir = os.path.join(os.path.expanduser("~"), "Library", "Preferences", "Autodesk", "maya", "scripts")
maya_rigging_tools_path = os.path.join(maya_scripts_dir, "Maya-Rigging-Tools")

print("Maya scripts directory:", maya_scripts_dir)
print("Maya-Rigging-Tools path:", maya_rigging_tools_path)

# Add the parent directory to sys.path
if os.path.dirname(maya_scripts_dir) not in sys.path:
    sys.path.insert(0, os.path.dirname(maya_scripts_dir))
    
print("Updated sys.path[0]:", sys.path[0])

# Let's look at one of the files causing issues to see the import structure
try:
    with open(os.path.join(maya_rigging_tools_path, "Attribute_Connector", "ui_class_attribute_connector.py"), 'r') as f:
        content = f.read()
        print("\nFirst 10 lines of ui_class_attribute_connector.py:")
        print("\n".join(content.split("\n")[:10]))
except Exception as e:
    print(f"Error reading file: {e}")

# Create a simple test file that imports a single module and prints its contents
test_file_path = os.path.join(maya_scripts_dir, "test_import.py")
with open(test_file_path, 'w') as f:
    f.write('''
import sys
import os

# Add the parent directory to the path
current_dir = os.path.dirname(os.path.abspath(__file__))
parent_dir = os.path.dirname(current_dir)
if parent_dir not in sys.path:
    sys.path.insert(0, parent_dir)

# Try to import the module directly
try:
    from maya.scripts.Maya_Rigging_Tools.Attribute_Connector import class_widget_registry
    print("Import succeeded using package path")
except ImportError as e:
    print(f"Package import failed: {e}")
    
    # Try direct import
    try:
        sys.path.insert(0, os.path.join(current_dir, "Maya-Rigging-Tools"))
        import Attribute_Connector.class_widget_registry as class_widget_registry
        print("Import succeeded using direct path")
    except ImportError as e:
        print(f"Direct import failed: {e}")

# Print the module path if import succeeded
if 'class_widget_registry' in locals():
    print(f"Module found at: {class_widget_registry.__file__}")
''')

print(f"\nCreated test file at: {test_file_path}")
print("Execute this file in Maya to test imports: execfile(r'" + test_file_path + "')")

# Create a modified version of your original file with a more robust import approach
mod_file_path = os.path.join(maya_scripts_dir, "attribute_connector_launcher.py")
with open(mod_file_path, 'w') as f:
    f.write('''
import sys
import os
import importlib

# Get the directory where this script is located
current_dir = os.path.dirname(os.path.abspath(__file__))
maya_rigging_tools_path = os.path.join(current_dir, "Maya-Rigging-Tools")

# Add to sys.path to ensure modules can be found
paths_to_add = [
    current_dir,
    maya_rigging_tools_path,
    os.path.dirname(current_dir)
]

for path in paths_to_add:
    if path not in sys.path:
        sys.path.insert(0, path)

print("sys.path:", sys.path[:3])

# Try different import approaches
success = False

# Approach 1: Direct local import
try:
    import Maya_Rigging_Tools.Attribute_Connector.ui_class_attribute_connector as ui_module
    print("Import succeeded using approach 1")
    success = True
except Exception as e:
    print(f"Approach 1 failed: {e}")

# Approach 2: Import from symlink dir
if not success:
    try:
        sys.path.insert(0, os.path.join(current_dir, "Maya-Rigging-Tools", "Attribute_Connector"))
        import ui_class_attribute_connector as ui_module
        print("Import succeeded using approach 2")
        success = True
    except Exception as e:
        print(f"Approach 2 failed: {e}")

# Approach 3: Dynamic import from file path
if not success:
    try:
        module_path = os.path.join(maya_rigging_tools_path, "Attribute_Connector", "ui_class_attribute_connector.py")
        spec = importlib.util.spec_from_file_location("ui_module", module_path)
        ui_module = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(ui_module)
        print(f"Import succeeded using approach 3 from {module_path}")
        success = True
    except Exception as e:
        print(f"Approach 3 failed: {e}")

if success:
    try:
        from PySide2 import QtWidgets
    except ImportError:
        from PySide6 import QtWidgets
    
    app = QtWidgets.QApplication.instance()
    if app is None:
        app = QtWidgets.QApplication([])
    
    ui = ui_module.AttributeConnectorUI()
    ui.show()
    app.exec_()
else:
    print("All import approaches failed. Check file paths and module structure.")
''')

print(f"\nCreated launcher file at: {mod_file_path}")
print("Execute this file in Maya to launch your tool: execfile(r'" + mod_file_path + "')")