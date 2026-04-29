"""
MAYA RIGGING TOOLS MANAGER
==========================
This is an all-in-one script to install, update, and reload Maya Rigging Tools.

Usage:
1. INSTALLATION: 
   - Drag this file into Maya's viewport to install the tools
   - This creates a symlink in your Maya scripts directory and adds a button to the Custom shelf

2. UPDATING:
   - If you've made changes to the code, run this in Maya's script editor to update:
     import maya_tool_manager
     maya_tool_manager.reload_and_launch()

3. UNINSTALLATION:
   - To uninstall, run this in Maya's script editor:
     import maya_tool_manager
     maya_tool_manager.uninstall()
"""
import os
import sys
import shutil
import importlib
import traceback

# For Maya integration
try:
    import maya.cmds as cmds
    import maya.utils
    RUNNING_IN_MAYA = True
except ImportError:
    RUNNING_IN_MAYA = False

# Get the paths we need
def get_paths():
    """Get all relevant paths for the tools"""
    # Get the directory where this script is located (should be in the repo)
    script_path = os.path.abspath(__file__)
    repo_dir = os.path.dirname(script_path)
    
    # Get the user's Maya scripts directory
    maya_scripts_dir = os.path.join(
        os.path.expanduser("~"),
        "Library", 
        "Preferences", 
        "Autodesk", 
        "maya", 
        "scripts"
    )
    
    # Path to the symlink in the Maya scripts directory
    symlink_path = os.path.join(maya_scripts_dir, "Maya-Rigging-Tools")
    
    return {
        "repo_dir": repo_dir,
        "maya_scripts_dir": maya_scripts_dir,
        "symlink_path": symlink_path
    }

def create_symlink():
    """Create a symlink to the repository in the Maya scripts directory"""
    paths = get_paths()
    repo_dir = paths["repo_dir"]
    maya_scripts_dir = paths["maya_scripts_dir"]
    symlink_path = paths["symlink_path"]
    
    # Create Maya scripts directory if it doesn't exist
    if not os.path.exists(maya_scripts_dir):
        os.makedirs(maya_scripts_dir)
        print(f"Created directory: {maya_scripts_dir}")
    
    # Remove existing symlink if it exists
    if os.path.exists(symlink_path):
        if os.path.islink(symlink_path) or os.path.isfile(symlink_path):
            os.remove(symlink_path)
        else:
            shutil.rmtree(symlink_path)
    
    # Create the symlink
    os.symlink(repo_dir, symlink_path)
    print(f"Created symlink: {symlink_path} -> {repo_dir}")
    
    # Add to Python path
    if symlink_path not in sys.path:
        sys.path.insert(0, symlink_path)

def setup_usersetup():
    """Set up userSetup.py to load the tools on Maya startup"""
    paths = get_paths()
    maya_scripts_dir = paths["maya_scripts_dir"]
    
    usersetup_code = """
# Added by Maya-Rigging-Tools installer
import sys
import os
import maya.utils
import maya.cmds as cmds

def setup_maya_rigging_tools(*args):
    # Path to the Maya-Rigging-Tools folder (symlink in scripts directory)
    maya_scripts_dir = os.path.dirname(os.path.abspath(__file__))
    maya_rigging_tools_path = os.path.join(maya_scripts_dir, "Maya-Rigging-Tools")
    
    # Only add to path if the directory exists
    if os.path.isdir(maya_rigging_tools_path):
        if maya_rigging_tools_path not in sys.path:
            sys.path.insert(0, maya_rigging_tools_path)
            print(f"Added {maya_rigging_tools_path} to Python path")
    
    # Create a shelf button if one doesn't exist already
    if cmds.shelfLayout('Custom', exists=True):
        if not cmds.shelfButton('LaunchAttributeConnector', query=True, exists=True):
            cmds.shelfButton(
                'LaunchAttributeConnector',
                parent='Custom',
                label='Attribute Connector',
                image='commandButton.png',
                command='''
# Direct import approach, more reliable than module-based import
import sys
import os
import importlib

# Get Maya scripts directory
maya_scripts_dir = os.path.dirname(os.path.abspath(__file__))
# Path to the Maya-Rigging-Tools folder (symlink in scripts directory)
tools_path = os.path.join(maya_scripts_dir, "Maya-Rigging-Tools")

# Add to path if needed
if tools_path not in sys.path:
    sys.path.insert(0, tools_path)

# Import and run the launcher
try:
    # Try to reload the module if it's already loaded
    if "launch_attribute_connector" in sys.modules:
        importlib.reload(sys.modules["launch_attribute_connector"])
    from launch_attribute_connector import launch_attribute_connector
    launch_attribute_connector()
except Exception as e:
    import traceback
    print(f"Error launching Attribute Connector: {e}")
    traceback.print_exc()
'''
            )

# Run after Maya UI is available
maya.utils.executeDeferred(setup_maya_rigging_tools)
"""

    # Check if userSetup.py exists
    usersetup_dst = os.path.join(maya_scripts_dir, "userSetup.py")
    if os.path.exists(usersetup_dst):
        # If userSetup.py already exists, append our code to it
        with open(usersetup_dst, 'r') as dst_file:
            dst_content = dst_file.read()
        
        # Check if our code is already in the file
        if "setup_maya_rigging_tools" not in dst_content:
            with open(usersetup_dst, 'a') as dst_file:
                dst_file.write("\n\n# Added by Maya-Rigging-Tools installer\n")
                dst_file.write(usersetup_code)
            print(f"Appended code to existing userSetup.py: {usersetup_dst}")
        else:
            print(f"userSetup.py already contains the required code")
    else:
        # If userSetup.py doesn't exist, create it
        with open(usersetup_dst, 'w') as dst_file:
            dst_file.write(usersetup_code)
        print(f"Created userSetup.py at: {usersetup_dst}")

def create_shelf_button():
    """Create a shelf button to launch the tool"""
    if not RUNNING_IN_MAYA:
        print("Not running in Maya, cannot create shelf button")
        return
        
    if cmds.shelfLayout('Custom', exists=True):
        if not cmds.shelfButton('LaunchAttributeConnector', query=True, exists=True):
            cmds.shelfButton(
                'LaunchAttributeConnector',
                parent='Custom',
                label='Attribute Connector',
                image='commandButton.png',
                command='''
# Direct import approach, more reliable than module-based import
import sys
import os
import importlib

# Get Maya scripts directory
maya_scripts_dir = os.path.dirname(os.path.abspath(__file__))
# Path to the Maya-Rigging-Tools folder (symlink in scripts directory)
tools_path = os.path.join(maya_scripts_dir, "Maya-Rigging-Tools")

# Add to path if needed
if tools_path not in sys.path:
    sys.path.insert(0, tools_path)

# Import and run the launcher
try:
    # Try to reload the module if it's already loaded
    if "launch_attribute_connector" in sys.modules:
        importlib.reload(sys.modules["launch_attribute_connector"])
    from launch_attribute_connector import launch_attribute_connector
    launch_attribute_connector()
except Exception as e:
    import traceback
    print(f"Error launching Attribute Connector: {e}")
    traceback.print_exc()
'''
            )
            print("Added Attribute Connector button to the Custom shelf")
    else:
        print("Custom shelf not found. Create it first or use the script editor to run the tool")

def reload_and_launch():
    """Reload all modules and launch the tool"""
    paths = get_paths()
    symlink_path = paths["symlink_path"]
    
    # Make sure the path is in sys.path
    if symlink_path not in sys.path:
        sys.path.insert(0, symlink_path)
    
    # Find and reload all relevant modules
    for name, module in list(sys.modules.items()):
        if name.startswith('Attribute_Connector') or name == 'launch_attribute_connector' or name == 'qt_compatibility':
            print(f"Reloading module: {name}")
            try:
                importlib.reload(module)
            except Exception as e:
                print(f"Failed to reload {name}: {e}")
    
    # Import and launch
    try:
        import launch_attribute_connector
        importlib.reload(launch_attribute_connector)
        ui = launch_attribute_connector.launch_attribute_connector()
        print("Successfully launched Attribute Connector!")
        return ui
    except Exception as e:
        print(f"Error launching Attribute Connector: {e}")
        traceback.print_exc()
        return None

def uninstall():
    """Remove all traces of the installation"""
    if not RUNNING_IN_MAYA:
        print("Not running in Maya, cannot uninstall properly")
        return
        
    paths = get_paths()
    maya_scripts_dir = paths["maya_scripts_dir"]
    symlink_path = paths["symlink_path"]
    
    # Remove symlink
    if os.path.exists(symlink_path):
        if os.path.islink(symlink_path) or os.path.isfile(symlink_path):
            os.remove(symlink_path)
            print(f"Removed symlink: {symlink_path}")
        else:
            shutil.rmtree(symlink_path)
            print(f"Removed directory: {symlink_path}")
    
    # Remove shelf button
    if cmds.shelfLayout('Custom', exists=True):
        if cmds.shelfButton('LaunchAttributeConnector', query=True, exists=True):
            cmds.deleteUI('LaunchAttributeConnector', control=True)
            print("Removed Attribute Connector button from the Custom shelf")
    
    # Modify userSetup.py to remove our code
    usersetup_path = os.path.join(maya_scripts_dir, "userSetup.py")
    if os.path.exists(usersetup_path):
        with open(usersetup_path, 'r') as file:
            content = file.read()
        
        # Find our code block
        start_marker = "# Added by Maya-Rigging-Tools installer"
        if start_marker in content:
            # Split content at our marker
            parts = content.split(start_marker)
            # Keep everything before our code
            new_content = parts[0]
            
            # Write back the file without our code
            with open(usersetup_path, 'w') as file:
                file.write(new_content)
            print(f"Removed Maya-Rigging-Tools code from userSetup.py")
    
    # Show success message
    cmds.confirmDialog(
        title="Uninstallation Complete",
        message="Maya-Rigging-Tools has been successfully uninstalled!",
        button=["OK"],
        defaultButton="OK"
    )

def install():
    """Full installation process"""
    try:
        create_symlink()
        setup_usersetup()
        create_shelf_button()
        
        # Launch the tool right away
        ui = reload_and_launch()
        
        if RUNNING_IN_MAYA:
            # Show success message
            cmds.confirmDialog(
                title="Installation Complete",
                message="Maya-Rigging-Tools has been successfully installed!\n\n" +
                        "The Attribute Connector tool has been added to the Custom shelf.\n\n" +
                        "To run it manually, use this Python code:\n" +
                        "import maya_tool_manager\n" +
                        "maya_tool_manager.reload_and_launch()",
                button=["OK"],
                defaultButton="OK"
            )
        
        return ui
    except Exception as e:
        print(f"Error during installation: {e}")
        traceback.print_exc()
        
        if RUNNING_IN_MAYA:
            cmds.confirmDialog(
                title="Installation Failed",
                message=f"There was an error during installation: {e}",
                button=["OK"],
                defaultButton="OK"
            )
        return None

def onMayaDroppedPythonFile(*args):
    """Function that Maya calls when Python file is dropped onto the viewport"""
    install()

# If this script is run directly in Maya (not imported)
if __name__ == "__main__" and RUNNING_IN_MAYA:
    install()
elif __name__ == "__main__":
    print("This script is meant to be used in Maya.")
    print("Please drag this file into Maya's viewport to install the tools")
    print("or run the functions directly in Maya's script editor:")
    print("import maya_tool_manager")
    print("maya_tool_manager.install()        # Install the tools")
    print("maya_tool_manager.reload_and_launch()  # Reload and launch the tool")
    print("maya_tool_manager.uninstall()      # Uninstall the tools")
