import maya.cmds as cmds
import maya.api.OpenMaya as om

def initialize_target_offset(node_name, target_index=0):
    """
    Initialize the target offset for a matrix node.
    This is equivalent to clicking "Initialize Target Offset" in the Manage Targets dropdown.
    
    Args:
        node_name (str): The name of the matrix node
        target_index (int): The index of the target to initialize (default=0)
    """
    # Check if the node exists
    if not cmds.objExists(node_name):
        raise ValueError(f"Node '{node_name}' does not exist")

    # Get the node type to handle different matrix node types
    node_type = cmds.nodeType(node_name)
    
    # Different matrix node types have different attribute structures
    target_attr = ""
    offset_attr = ""
    
    # Check node type and determine attribute paths
    if node_type == "wtAddMatrix":
        # For weighted add matrix nodes
        target_attr = f"{node_name}.wtMatrix[{target_index}].matrixIn"
        offset_attr = f"{node_name}.wtMatrix[{target_index}].offsetMatrix"
    elif node_type == "multMatrix":
        # For multMatrix nodes
        target_attr = f"{node_name}.matrixIn[{target_index}]"
        offset_attr = f"{node_name}.matrixIn[{target_index + 1}]"
    elif "constraint" in node_type.lower():
        # For constraint nodes
        target_attr = f"{node_name}.target[{target_index}].targetMatrix"
        offset_attr = f"{node_name}.target[{target_index}].offsetParentMatrix"
    else:
        # Generic approach for other matrix nodes
        target_attr = f"{node_name}.target[{target_index}].targetMatrix"
        offset_attr = f"{node_name}.target[{target_index}].offsetMatrix"
    
    # Check if attributes exist
    target_attr_base = target_attr.split('.')[-1].split('[')[0]
    offset_attr_base = offset_attr.split('.')[-1].split('[')[0]
    
    if not cmds.attributeQuery(target_attr_base, node=node_name, exists=True):
        raise ValueError(f"Target attribute {target_attr_base} does not exist on node {node_name}")
    
    if not cmds.attributeQuery(offset_attr_base, node=node_name, exists=True):
        raise ValueError(f"Offset attribute {offset_attr_base} does not exist on node {node_name}")
    
    # Get the current target matrix
    current_matrix = cmds.getAttr(target_attr)
    
    # Invert the matrix (this is what "Initialize Target Offset" essentially does)
    mmatrix = om.MMatrix(current_matrix)
    inverse_matrix = mmatrix.inverse()
    
    # Convert back to list for setAttr - proper om2 matrix access
    inverse_matrix_list = [inverse_matrix[i*4 + j] for i in range(4) for j in range(4)]
    
    # Set the offset matrix to the inverse of the target matrix
    cmds.setAttr(offset_attr, inverse_matrix_list, type="matrix")
    
    print(f"Target offset initialized for {node_name} (target index: {target_index})")

# Example usage
try:
    selected_nodes_list = cmds.ls(selection=True)
    if selected_nodes_list:
        selected_node = selected_nodes_list[0]
        initialize_target_offset(selected_node, 0)
    else:
        print("No nodes selected. Please select a matrix node.")
except Exception as e:
    import traceback
    print(f"Error: {str(e)}")
    print(traceback.format_exc())