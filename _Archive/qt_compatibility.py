"""
Qt Compatibility Module for Maya
===============================
This module detects the appropriate Qt bindings based on Maya version
and provides a consistent interface regardless of whether PySide2 or PySide6
is used.
"""

import sys
import os
import importlib

def get_qt_modules():
    """
    Return appropriate Qt modules based on Maya version.
    For Maya 2025+: PySide6
    For Maya 2024 and earlier: PySide2
    Falls back to PySide6 if outside Maya
    """
    in_maya = False
    maya_version = None
    
    # Check if we're in Maya and get version
    try:
        import maya.cmds as cmds
        in_maya = True
        maya_version = int(cmds.about(version=True))
        print(f"Detected Maya version: {maya_version}")
    except ImportError:
        print("Not running in Maya environment")
    
    # For Maya 2025+, use PySide6
    if in_maya and maya_version and maya_version >= 2025:
        try:
            print("Using PySide6 (Maya 2025+)")
            from PySide6 import QtCore, QtGui, QtWidgets
            return QtCore, QtGui, QtWidgets, "PySide6"
        except ImportError as e:
            print(f"Failed to import PySide6: {e}")
    
    # For older Maya versions, use PySide2
    if in_maya:
        try:
            print("Using PySide2 (Maya 2024 or earlier)")
            from PySide2 import QtCore, QtGui, QtWidgets
            return QtCore, QtGui, QtWidgets, "PySide2"
        except ImportError as e:
            print(f"Failed to import PySide2: {e}")
    
    # Final fallback to PySide6 (if available)
    try:
        print("Trying PySide6 as fallback")
        from PySide6 import QtCore, QtGui, QtWidgets
        return QtCore, QtGui, QtWidgets, "PySide6"
    except ImportError:
        # Last resort - try PySide2
        try:
            print("Trying PySide2 as last resort")
            from PySide2 import QtCore, QtGui, QtWidgets
            return QtCore, QtGui, QtWidgets, "PySide2"
        except ImportError as e:
            raise ImportError(f"Could not import PySide2 or PySide6. Error: {e}")

# Make the modules available at the module level for easy imports
QtCore, QtGui, QtWidgets, qt_binding = get_qt_modules()

def map_qt_constant(qt_enum):
    """
    Map Qt constants between PySide2 and PySide6 if needed
    Example: map_qt_constant(QtCore.Qt.Key_F2)
    """
    # Most constants are the same between versions, but if differences emerge
    # we can add mappings here
    return qt_enum
