"""
MAYA UI TOOLKIT VERIFICATION SCRIPT
==================================
This script verifies that the Qt compatibility layer works correctly,
regardless of whether you're using Maya 2025+ (PySide6) or older Maya versions (PySide2).

To use:
1. Run this script in Maya's script editor
2. Check the output window for compatibility information
3. If no errors are reported, the tool should launch successfully

For Maya 2025 users experiencing PySide2 import errors:
- This script will automatically detect and use PySide6 instead
- You should see confirmation that PySide6 is being used
"""

import sys
import os
import traceback
import importlib

def verify_qt_compatibility():
    """Verify that the Qt compatibility layer works correctly in the current Maya environment"""
    print("\n" + "="*50)
    print("MAYA UI TOOLKIT VERIFICATION")
    print("="*50)
    
    # Check if running in Maya
    in_maya = False
    maya_version = None
    try:
        import maya.cmds as cmds
        in_maya = True
        maya_version = int(cmds.about(version=True))
        print(f"✓ Running in Maya {maya_version}")
    except ImportError:
        print("⚠ Not running in Maya - verification will be limited")
    
    # Get the directory of this script
    current_dir = os.path.dirname(os.path.abspath(__file__))
    print(f"Current directory: {current_dir}")
    
    # Add to Python path if needed
    if current_dir not in sys.path:
        sys.path.insert(0, current_dir)
        print(f"✓ Added {current_dir} to Python path")
    
    # Test importing our compatibility layer
    print("\nVerifying Qt imports:")
    try:
        # Try to reload the module to ensure we have the latest version
        from Attribute_Connector.ui_class_attribute_connector import _get_pyside_modules
        print("✓ Found _get_pyside_modules() compatibility function")
        
        # Test importing Qt modules
        QtWidgets, QtCore, QtGui, qt_binding = _get_pyside_modules()
        print(f"✓ Successfully loaded Qt modules using {qt_binding}")
        
        # Test creating a widget
        widget = QtWidgets.QLabel("Test")
        print("✓ Successfully created a Qt widget")
        
    except Exception as e:
        print(f"✗ Error importing Qt modules: {e}")
        traceback.print_exc()
        return False
    
    # Test launching the tool
    print("\nAttempting to launch Attribute Connector:")
    try:
        import launch_attribute_connector
        # Reload to ensure we have the latest version
        if hasattr(importlib, 'reload'):
            importlib.reload(launch_attribute_connector)
        ui = launch_attribute_connector.launch_attribute_connector()
        
        if ui:
            print("✓ Successfully launched Attribute Connector!")
            
            # If in Maya, create some test objects
            if in_maya:
                print("\nCreating test objects in Maya:")
                try:
                    # Clean up previous test objects if they exist
                    if cmds.objExists("testCube1"):
                        cmds.delete("testCube1")
                    if cmds.objExists("testCube2"):
                        cmds.delete("testCube2")
                    
                    # Create new test objects
                    cmds.polyCube(name="testCube1")
                    cmds.polyCube(name="testCube2")
                    print("✓ Created test objects: testCube1, testCube2")
                    
                    print("\nTo test full functionality:")
                    print("1. Select testCube1 and click 'Assign Source Node'")
                    print("2. Add testCube2.translate to the target attributes")
                    print("3. Create connections between attributes")
                    print("4. Apply connections")
                except Exception as e:
                    print(f"⚠ Could not create test objects: {e}")
            
            return True
        else:
            print("✗ Failed to launch Attribute Connector")
            return False
            
    except Exception as e:
        print(f"✗ Error launching Attribute Connector: {e}")
        traceback.print_exc()
        return False

# Run the verification if this script is executed directly
if __name__ == "__main__":
    success = verify_qt_compatibility()
    
    if success:
        print("\n" + "="*50)
        print("✅ VERIFICATION SUCCESSFUL")
        print("="*50)
        print("The Attribute Connector should now be open and ready to use.")
    else:
        print("\n" + "="*50)
        print("❌ VERIFICATION FAILED")
        print("="*50)
        print("Please check the error messages above for details.")
