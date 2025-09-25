from PySide2 import QtWidgets, QtGui, QtCore
import maya.cmds as cmds
import maya.OpenMayaUI as omui
from shiboken2 import wrapInstance

# Function to get Maya's main window
def maya_main_window():
    main_window_ptr = omui.MQtUtil.mainWindow()
    return wrapInstance(int(main_window_ptr), QtWidgets.QWidget)

# Custom Dialog Class
class ParentChildrenDialog(QtWidgets.QDialog):
    def __init__(self, parent=maya_main_window()):
        super(ParentChildrenDialog, self).__init__(parent)

        self.setWindowTitle('Parent-Children Constraint Tool')
        self.setWindowFlags(self.windowFlags() | QtCore.Qt.Tool)
        self.setMinimumWidth(450)

        # Dropdown for constraint type
        self.constraint_dropdown = QtWidgets.QComboBox()
        self.constraint_dropdown.addItem(QtGui.QIcon(":/parentConstraint.png"), "Parent Constraint", "parentConstraint")
        self.constraint_dropdown.addItem(QtGui.QIcon(":/pointConstraint.png"), "Point Constraint", "pointConstraint")
        self.constraint_dropdown.addItem(QtGui.QIcon(":/orientConstraint.png"), "Orient Constraint", "orientConstraint")
        self.constraint_dropdown.addItem(QtGui.QIcon(":/scaleConstraint.png"), "Scale Constraint", "scaleConstraint")
        self.constraint_dropdown.addItem(QtGui.QIcon(":/aimConstraint.png"), "Aim Constraint", "aimConstraint")
        self.constraint_dropdown.addItem(QtGui.QIcon(":/normalConstraint.png"), "Normal Constraint", "normalConstraint")
        self.constraint_dropdown.addItem(QtGui.QIcon(":/geometryConstraint.png"), "Geometry Constraint", "geometryConstraint")

        # Gear icon button
        self.options_button = QtWidgets.QPushButton()
        self.options_button.setIcon(QtGui.QIcon(":/cog.png"))
        self.options_button.setFixedSize(30, 30)
        self.options_button.clicked.connect(self.open_constraint_options)

        # Top layout
        top_layout = QtWidgets.QHBoxLayout()
        top_layout.addWidget(QtWidgets.QLabel('Select Constraint:'))
        top_layout.addWidget(self.constraint_dropdown)
        top_layout.addWidget(self.options_button)

        # --- Axis Controls (for Normal Constraint only) ---
        self.axis_group = QtWidgets.QGroupBox("Normal Constraint Vectors")
        axis_layout = QtWidgets.QFormLayout(self.axis_group)

        def make_vector_inputs(default):
            x = QtWidgets.QDoubleSpinBox(); y = QtWidgets.QDoubleSpinBox(); z = QtWidgets.QDoubleSpinBox()
            for spin, val in zip((x, y, z), default):
                spin.setRange(-1.0, 1.0)
                spin.setSingleStep(0.1)
                spin.setDecimals(2)
                spin.setValue(val)
                spin.setMaximumWidth(60)
            layout = QtWidgets.QHBoxLayout()
            layout.addWidget(QtWidgets.QLabel("X:")); layout.addWidget(x)
            layout.addWidget(QtWidgets.QLabel("Y:")); layout.addWidget(y)
            layout.addWidget(QtWidgets.QLabel("Z:")); layout.addWidget(z)
            w = QtWidgets.QWidget()
            w.setLayout(layout)
            return (x, y, z), w

        # Aim Vector (default X axis)
        self.aim_inputs, aim_widget = make_vector_inputs([1,0,0])
        axis_layout.addRow("Aim Vector:", aim_widget)

        # Up Vector (default Y axis)
        self.up_inputs, up_widget = make_vector_inputs([0,1,0])
        axis_layout.addRow("Up Vector:", up_widget)

        # World Up Vector (default Z axis)
        self.world_up_inputs, wup_widget = make_vector_inputs([0,0,1])
        axis_layout.addRow("World Up Vector:", wup_widget)

        # Parent / Children lists
        self.parent_list = QtWidgets.QListWidget()
        self.children_list = QtWidgets.QListWidget()
        self.children_list.setSelectionMode(QtWidgets.QAbstractItemView.ExtendedSelection)

        # Buttons
        self.load_parent_btn = QtWidgets.QPushButton('Load Parent')
        self.load_children_btn = QtWidgets.QPushButton('Load Children')
        self.constraint_btn = QtWidgets.QPushButton('Create Constraint')
        self.close_btn = QtWidgets.QPushButton('Close')

        # Layouts
        parent_layout = QtWidgets.QVBoxLayout()
        parent_layout.addWidget(QtWidgets.QLabel('Parent'))
        parent_layout.addWidget(self.parent_list)
        parent_layout.addWidget(self.load_parent_btn)

        children_layout = QtWidgets.QVBoxLayout()
        children_layout.addWidget(QtWidgets.QLabel('Children'))
        children_layout.addWidget(self.children_list)
        children_layout.addWidget(self.load_children_btn)

        lists_layout = QtWidgets.QHBoxLayout()
        lists_layout.addLayout(parent_layout)
        lists_layout.addLayout(children_layout)

        buttons_layout = QtWidgets.QHBoxLayout()
        buttons_layout.addWidget(self.constraint_btn)
        buttons_layout.addWidget(self.close_btn)

        main_layout = QtWidgets.QVBoxLayout(self)
        main_layout.addLayout(top_layout)
        main_layout.addWidget(self.axis_group)   # Add axis group box
        main_layout.addLayout(lists_layout)
        main_layout.addLayout(buttons_layout)

        # Connections
        self.load_parent_btn.clicked.connect(self.load_parent)
        self.load_children_btn.clicked.connect(self.load_children)
        self.constraint_btn.clicked.connect(self.create_constraints)
        self.close_btn.clicked.connect(self.close)
        self.constraint_dropdown.currentIndexChanged.connect(self.update_axis_visibility)

        # Initial state
        self.update_axis_visibility()

    def update_axis_visibility(self):
        """Show/Hide axis controls depending on constraint type"""
        constraint_type = self.constraint_dropdown.currentData()
        self.axis_group.setVisible(constraint_type == "normalConstraint")

    def load_parent(self):
        self.parent_list.clear()
        selected_objects = cmds.ls(selection=True)
        if selected_objects:
            self.parent_list.addItem(selected_objects[0])
            print(f"Loaded Parent: {selected_objects[0]}")

    def load_children(self):
        selected_objects = cmds.ls(selection=True)
        self.children_list.clear()
        for obj in selected_objects:
            self.children_list.addItem(obj)
            print(f"Loaded Child: {obj}")

    def create_constraints(self):
        parent = self.parent_list.item(0)
        if parent:
            parent_name = parent.text()
            constraint_type = self.constraint_dropdown.currentData()

            cmds.undoInfo(openChunk=True)
            try:
                for i in range(self.children_list.count()):
                    child_name = self.children_list.item(i).text()

                    if constraint_type in ["parentConstraint", "pointConstraint", "orientConstraint", "scaleConstraint", "aimConstraint"]:
                        print(f"Creating {constraint_type} from {parent_name} to {child_name} with maintainOffset")
                        cmds.__getattribute__(constraint_type)(parent_name, child_name, maintainOffset=True)

                    elif constraint_type == "normalConstraint":
                        aim = [spin.value() for spin in self.aim_inputs]
                        up = [spin.value() for spin in self.up_inputs]
                        wup = [spin.value() for spin in self.world_up_inputs]

                        print(f"Creating normalConstraint from {parent_name} to {child_name} "
                              f"aimVector={aim}, upVector={up}, worldUpVector={wup}")

                        cmds.normalConstraint(parent_name, child_name,
                                              aimVector=aim,
                                              upVector=up,
                                              worldUpVector=wup,
                                              worldUpType="vector")

                    else:  # geometryConstraint
                        print(f"Creating {constraint_type} from {parent_name} to {child_name} without maintainOffset")
                        cmds.__getattribute__(constraint_type)(parent_name, child_name)
            finally:
                cmds.undoInfo(closeChunk=True)

    def open_constraint_options(self):
        constraint_type = self.constraint_dropdown.currentText()
        print(f"Opening options for: {constraint_type}")

        if constraint_type == "Parent Constraint":
            cmds.ParentConstraintOptions()
        elif constraint_type == "Point Constraint":
            cmds.PointConstraintOptions()
        elif constraint_type == "Orient Constraint":
            cmds.OrientConstraintOptions()
        elif constraint_type == "Scale Constraint":
            cmds.ScaleConstraintOptions()
        elif constraint_type == "Aim Constraint":
            cmds.AimConstraintOptions()
        elif constraint_type == "Normal Constraint":
            cmds.NormalConstraintOptions()
        elif constraint_type == "Geometry Constraint":
            cmds.GeometryConstraintOptions()
        else:
            print(f"No options available for: {constraint_type}")

# Show the dialog
def show_dialog():
    dialog = ParentChildrenDialog()
    dialog.show()

# Run the function to display the dialog
show_dialog()
