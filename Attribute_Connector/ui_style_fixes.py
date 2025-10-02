"""
UI Style Fixes for Attribute Connector
=====================================
This module provides fixes for common Qt UI issues including:
- Font family warnings
- PNG profile warnings
- Window management improvements
"""

import os
import sys

def apply_qt_fixes():
    """
    Apply fixes for common Qt UI issues in Maya.
    Call this before creating any UI windows.
    """
    try:
        # First try to import from our compatibility module
        sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
        import qt_compatibility
        QtCore = qt_compatibility.QtCore
        
        # 1. Fix font family warnings
        # Tell Qt to use the system default font instead of trying to find missing fonts
        font_db = qt_compatibility.QtGui.QFontDatabase()
        default_font = font_db.systemFont(qt_compatibility.QtGui.QFontDatabase.GeneralFont)
        qt_compatibility.QtGui.QGuiApplication.setFont(default_font)
        
        # 2. Fix PNG profile warnings by disabling the libpng warnings
        # This requires setting an environment variable before Qt loads images
        os.environ["QT_IGNORE_LIBPNG_WARNINGS"] = "1"
        
        # 3. Reduce window count by enabling window sharing where possible
        # Tell Qt to reuse window contexts where possible
        if hasattr(QtCore, "AA_ShareOpenGLContexts"):
            qt_compatibility.QtGui.QGuiApplication.setAttribute(QtCore.Qt.AA_ShareOpenGLContexts)
        
        # Enable application-wide font antialiasing
        if hasattr(QtCore, "AA_UseHighDpiPixmaps"):
            qt_compatibility.QtGui.QGuiApplication.setAttribute(QtCore.Qt.AA_UseHighDpiPixmaps)
            
        # Enable application-wide font antialiasing
        if hasattr(QtCore, "AA_EnableHighDpiScaling"):
            qt_compatibility.QtGui.QGuiApplication.setAttribute(QtCore.Qt.AA_EnableHighDpiScaling)
            
        print("Successfully applied Qt UI style fixes")
        return True
    except Exception as e:
        print(f"Error applying Qt UI fixes: {e}")
        return False

# Auto-apply fixes when module is imported
apply_qt_fixes()
