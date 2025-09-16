import maya.cmds as cmds
from PySide2 import QtWidgets, QtCore

class FlipAxisDialog(QtWidgets.QDialog):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Flip Axis Tool")
        self.setWindowFlags(QtCore.Qt.Tool | QtCore.Qt.WindowStaysOnTopHint)
        self.setFixedSize(200, 120)
        self.setup_ui()
        
    def setup_ui(self):
        layout = QtWidgets.QVBoxLayout(self)
        
        # Axis buttons row
        axis_layout = QtWidgets.QHBoxLayout()
        
        self.x_btn = QtWidgets.QPushButton("X")
        self.y_btn = QtWidgets.QPushButton("Y")
        self.z_btn = QtWidgets.QPushButton("Z")
        
        for btn in [self.x_btn, self.y_btn, self.z_btn]:
            btn.setFixedSize(50, 30)
            axis_layout.addWidget(btn)
        
        # Connect buttons
        self.x_btn.clicked.connect(lambda: self.flip_axis('X'))
        self.y_btn.clicked.connect(lambda: self.flip_axis('Y'))
        self.z_btn.clicked.connect(lambda: self.flip_axis('Z'))
        
        # Close button
        close_btn = QtWidgets.QPushButton("Close")
        close_btn.clicked.connect(self.close)
        
        layout.addLayout(axis_layout)
        layout.addWidget(close_btn)
        
    def flip_axis(self, axis):
        selected = cmds.ls(selection=True)
        if not selected:
            cmds.warning("Please select objects to flip.")
            return
        
        print(f"--- Flipping {axis}-axis for {len(selected)} objects ---")
        
        cmds.undoInfo(openChunk=True)
        try:
            for obj in selected:
                print(f"\nProcessing: {obj}")
                
                # Get original rotation values
                orig_rotate = cmds.getAttr(f"{obj}.rotate")[0]
                print(f"Original rotation: {orig_rotate}")
                
                # Simple approach: add 180° rotation around the perpendicular axes
                if axis == 'X':
                    # To flip X axis, rotate 180° around Y
                    cmds.rotate(0, 180, 0, obj, relative=True, objectSpace=True)
                    print("Applied 180° rotation around Y axis")
                elif axis == 'Y':
                    # To flip Y axis, rotate 180° around X  
                    cmds.rotate(180, 0, 0, obj, relative=True, objectSpace=True)
                    print("Applied 180° rotation around X axis")
                elif axis == 'Z':
                    # To flip Z axis, rotate 180° around X
                    cmds.rotate(180, 0, 0, obj, relative=True, objectSpace=True)
                    print("Applied 180° rotation around X axis")
                
                # Print final rotation
                final_rotate = cmds.getAttr(f"{obj}.rotate")[0]
                print(f"Final rotation: {final_rotate}")
                
        finally:
            cmds.undoInfo(closeChunk=True)
        
        print(f"Completed flipping {axis}-axis direction")

def show_flip_axis_dialog():
    global flip_dialog
    try:
        flip_dialog.close()
    except:
        pass
    flip_dialog = FlipAxisDialog()
    flip_dialog.show()

# Run
show_flip_axis_dialog()
