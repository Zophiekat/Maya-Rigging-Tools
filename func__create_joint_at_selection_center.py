import maya.cmds as cmds

def create_joint_at_selection_center():
    # Get the current selection
    selection = cmds.ls(selection=True)
    
    if not selection:
        print("No objects selected.")
        return
    
    # Get the bounding box of all selected objects
    bbox = cmds.exactWorldBoundingBox(selection)
    
    # Calculate the center of the bounding box
    center_position = [(bbox[0] + bbox[3]) / 2, (bbox[1] + bbox[4]) / 2, (bbox[2] + bbox[5]) / 2]
    
    # Check if "_Output_grp" exists, if not create it
    output_grp = "_Output_grp"
    if not cmds.objExists(output_grp):
        output_grp = cmds.group(empty=True, name=output_grp)
        print(f"Created group: {output_grp}")
    
    # Clear selection to avoid joint parenting issues
    cmds.select(clear=True)
    
    # Create a joint at the center position
    joint = cmds.joint(position=center_position)
    print(f"Created joint '{joint}' at position: {center_position}")
    
    # Parent the joint under the output group only if it's not already parented there
    current_parent = cmds.listRelatives(joint, parent=True)
    if not current_parent or current_parent[0] != output_grp:
        cmds.parent(joint, output_grp)
        print(f"Parented joint '{joint}' under '{output_grp}'")
    else:
        print(f"Joint '{joint}' is already under '{output_grp}'")
    
    return joint

# Call the function
if __name__ == "__main__":
    create_joint_at_selection_center()
