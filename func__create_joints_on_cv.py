import maya.cmds as cmds

def print_tree_data(data, title="Function Results"):
    """Generic tree printer for any nested dictionary structure"""
    print("\n")
    print("┐" + "─" * 46)
    print("│" + title.center(46) + "│")
    print("│")
    
    for i, (key, value) in enumerate(data.items()):
        last_item = i == len(data) - 1
        curve_connector = "└───" if last_item else "├───"
        print(f"{curve_connector} curve_obj: {key}")
        
        if isinstance(value, (list, tuple)):
            for j, item in enumerate(value):
                if isinstance(item, dict):
                    # Get all key-value pairs from the dictionary
                    items_list = list(item.items())
                    
                    for k, (var_name, var_value) in enumerate(items_list):
                        is_last_var = k == len(items_list) - 1
                        is_last_cv = j == len(value) - 1
                        
                        # Format the value
                        if isinstance(var_value, (list, tuple)) and len(var_value) == 3:
                            formatted_value = f"[{var_value[0]:.3f}, {var_value[1]:.3f}, {var_value[2]:.3f}]"
                        else:
                            formatted_value = str(var_value)
                        
                        if is_last_var and is_last_cv:
                            connector = "└"
                        else:
                            connector = "├"
                        
                        print(f"│    {connector}  {var_name.ljust(11)}  .  {formatted_value}")
                    
                    # Add separator line between items (except for last item)
                    if j < len(value) - 1:
                        print("│    │")
        
        # Only add blank line between curves if it's NOT the last curve
        if not last_item:
            print("│")
    
    print("└ v - V - v - V - v - V - v - V - v - V - v - V")
    print("\n")


def create_joints_on_curve_cvs():
    selected_curves = cmds.ls(selection=True, dag=True, type='nurbsCurve')
    if not selected_curves: return cmds.warning("Please select a NURBS curve.")
    
    curves_data = {}
    output_transform = "_Output" if cmds.objExists("_Output") else cmds.createNode("transform", name="_Output")
    
    for curve_obj in selected_curves:
        curve_info = []
        num_cvs = cmds.getAttr(f"{curve_obj}.spans") + cmds.getAttr(f"{curve_obj}.degree")
        
        for i in range(num_cvs):
            cmds.select(clear=True)  # Clear selection before creating joint
            cv_pos = cmds.pointPosition(f"{curve_obj}.cv[{i}]")
            joint_item = cmds.joint(position=cv_pos)
            cmds.parent(joint_item, output_transform)
            constraint = cmds.tangentConstraint(curve_obj, joint_item, weight=True, aimVector=[1,0,0], upVector=[0,1,0], worldUpType="scene")
            cmds.delete(constraint)
            cmds.joint(joint_item, edit=True, setPreferredAngles=True)
            cmds.setAttr(f"{joint_item}.displayLocalAxis", True)
            curve_info.append({"cv_pos": cv_pos, "joint_item": joint_item})
        
        curves_data[curve_obj] = curve_info
    
    print_tree_data(curves_data, "Maya Joints on Curve CVs")

# Run
create_joints_on_curve_cvs()