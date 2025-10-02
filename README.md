# Maya-Rigging-Tools

A collection of rigging tools for Maya, including the Attribute Connector tool.

## Attribute Connector
A tool for connecting attributes between Maya objects with a visual UI.

### Features
- Visual connection management with colored lines
- Drag and drop interface for connecting attributes
- Support for Maya 2024 (PySide2) and Maya 2025+ (PySide6)
- Optimized UI with reduced warnings and improved performance
- Single undo command for all connections

## Installation

### Option 1: Drag and Drop (Easiest)
1. Open Maya
2. Locate the `maya_tool_manager.py` file in the Maya-Rigging-Tools repository
3. Drag this file into Maya's viewport
4. The installation script will run automatically
5. A button will be added to the "Custom" shelf

### Option 2: Manual Installation
1. Clone this repository
2. Run the following code in Maya's script editor:
   ```python
   import sys
   import os

   # Path to the repository
   repo_path = "/path/to/Maya-Rigging-Tools"

   # Add to Python path
   if repo_path not in sys.path:
       sys.path.insert(0, repo_path)

   # Import and run the installer
   import maya_tool_manager
   maya_tool_manager.install()
   ```

## Usage
In Maya, you can:

1. **Use the shelf button**: Click on the "Attribute Connector" button in the "Custom" shelf

2. **Use the script editor**:
   ```python
   import maya_tool_manager
   maya_tool_manager.reload_and_launch()
   ```

## Maya Version Compatibility

The tools are compatible with both:
- **Maya 2024 and earlier** (using PySide2)
- **Maya 2025 and later** (using PySide6)

The tools automatically detect your Maya version and use the appropriate UI toolkit.

### UI Optimization

The tools include optimizations to prevent common UI warnings in Maya:
- Font family warnings are eliminated by using system default fonts
- PNG profile warnings are suppressed
- Window management is optimized to reduce window count
- Resources are properly cleaned up when closing windows

### Verifying Compatibility

To verify that the tools work correctly in your Maya version:

```python
import verify_qt_compatibility
verify_qt_compatibility.verify_qt_compatibility()
```

## Development
When making changes to the code, you don't need to restart Maya. You can reload the modules and restart the tool:

```python
import maya_tool_manager
maya_tool_manager.reload_and_launch()
```

### Uninstalling

To uninstall the tools:

```python
import maya_tool_manager
maya_tool_manager.uninstall()
```
