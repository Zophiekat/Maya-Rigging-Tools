import maya.cmds as cmds
import sys
import os
import importlib

# Add the workspace to the path using _global_paths
sys.path.append("/Users/zophiekat/Github_Repositories/Maya-Rigging-Tools")
import _global_paths
importlib.reload(_global_paths)
_global_paths.ensure_path()

def get_def_to_rig_data():
    """
    Gathers data about DEF and RIG joints in the scene and analyzes their connections.
    Automatically finds matching joints in the scene if only one side is selected.
    
    Returns:
        dict: A dictionary containing all the analyzed data
    """
    # Get selected nodes
    selected_nodes = cmds.ls(selection=True) or []
    
    if not selected_nodes:
        cmds.warning("No nodes selected. Please select DEF or RIG joints.")
        return None
    
    # Initialize lists
    DEF_joints_list = []
    RIG_joints_list = []
    ignored_nodes = []
    
    # Categorize selected nodes
    for node in selected_nodes:
        # Check if node is a joint
        if cmds.nodeType(node) == "joint":
            # Check for DEF or RIG prefix and _jnt suffix
            if node.startswith("DEF_") and node.endswith("_jnt"):
                DEF_joints_list.append(node)
            elif node.startswith("RIG_") and node.endswith("_jnt"):
                RIG_joints_list.append(node)
            else:
                ignored_nodes.append(node)
        else:
            ignored_nodes.append(node)
    
    # Find matching joints in the scene for DEF and RIG joints
    all_joints = cmds.ls(type="joint") or []
    all_def_joints = [j for j in all_joints if j.startswith("DEF_") and j.endswith("_jnt")]
    all_rig_joints = [j for j in all_joints if j.startswith("RIG_") and j.endswith("_jnt")]
    
    # If we have DEF joints selected, find their RIG counterparts in the scene
    if DEF_joints_list:
        for def_joint in DEF_joints_list:
            # Extract base name without prefix
            base_name = def_joint[4:]  # Remove "DEF_"
            rig_name = "RIG_" + base_name
            
            # Look for matching RIG joint in scene
            if rig_name in all_rig_joints and rig_name not in RIG_joints_list:
                RIG_joints_list.append(rig_name)
                print(f"Found matching RIG joint for {def_joint}: {rig_name}")
    
    # If we have RIG joints selected, find their DEF counterparts in the scene
    if RIG_joints_list:
        for rig_joint in RIG_joints_list:
            # Extract base name without prefix
            base_name = rig_joint[4:]  # Remove "RIG_"
            def_name = "DEF_" + base_name
            
            # Look for matching DEF joint in scene
            if def_name in all_def_joints and def_name not in DEF_joints_list:
                DEF_joints_list.append(def_name)
                print(f"Found matching DEF joint for {rig_joint}: {def_name}")
    
    print(f"Found {len(DEF_joints_list)} DEF joints, {len(RIG_joints_list)} RIG joints")
    print(f"Ignored {len(ignored_nodes)} nodes that don't match the criteria")
    
    # Match DEF and RIG joints
    matched_joints_dict = {}  # {def_joint: rig_joint}
    lonely_joints_list = []
    
    # Find matches between DEF and RIG joints
    for def_joint in DEF_joints_list:
        # Get the joint name without the prefix
        joint_name = def_joint[4:]  # Remove "DEF_"
        
        # Look for matching RIG joint
        rig_joint_name = "RIG_" + joint_name
        if rig_joint_name in RIG_joints_list:
            matched_joints_dict[def_joint] = rig_joint_name
        else:
            lonely_joints_list.append(def_joint)
    
    # Find RIG joints without DEF counterparts
    for rig_joint in RIG_joints_list:
        # Get the joint name without the prefix
        joint_name = rig_joint[4:]  # Remove "RIG_"
        
        # Check if there's a matching DEF joint
        def_joint_name = "DEF_" + joint_name
        if def_joint_name not in DEF_joints_list and rig_joint not in [matched_joints_dict[d] for d in matched_joints_dict]:
            lonely_joints_list.append(rig_joint)
    
    print(f"Matched {len(matched_joints_dict)} DEF-RIG joint pairs")
    print(f"Found {len(lonely_joints_list)} joints without matches")
    
    # Check connections
    nodes_with_incoming_connection_list = []
    nodes_with_outgoing_connection_list = []
    not_connected_nodes_list = []
    
    # Check DEF joints for incoming offsetParentMatrix connections
    for def_joint in matched_joints_dict.keys():
        connections = cmds.listConnections(f"{def_joint}.offsetParentMatrix", source=True, destination=False) or []
        if connections:
            nodes_with_incoming_connection_list.append((def_joint, connections[0]))
        else:
            not_connected_nodes_list.append(def_joint)
    
    # Check RIG joints for outgoing matrix connections
    for rig_joint in matched_joints_dict.values():
        worldMatrix_connections = cmds.listConnections(f"{rig_joint}.worldMatrix", source=False, destination=True) or []
        parentMatrix_connections = cmds.listConnections(f"{rig_joint}.parentMatrix", source=False, destination=True) or []
        
        if worldMatrix_connections or parentMatrix_connections:
            nodes_with_outgoing_connection_list.append((rig_joint, worldMatrix_connections + parentMatrix_connections))
        else:
            not_connected_nodes_list.append(rig_joint)
    
    print(f"Found {len(nodes_with_incoming_connection_list)} DEF joints with incoming connections")
    print(f"Found {len(nodes_with_outgoing_connection_list)} RIG joints with outgoing connections")
    print(f"Found {len(not_connected_nodes_list)} joints without connections")
    
    # Categorize connections
    direct_connection_list = []
    intermediate_nodes_list = []
    
    # Check incoming connections
    for def_joint, connected_node in nodes_with_incoming_connection_list:
        # Check if connected_node is a DEF or RIG joint
        if connected_node.startswith("DEF_") and connected_node.endswith("_jnt"):
            direct_connection_list.append((def_joint, connected_node))
        elif connected_node.startswith("RIG_") and connected_node.endswith("_jnt"):
            direct_connection_list.append((def_joint, connected_node))
        else:
            intermediate_nodes_list.append((def_joint, connected_node))
    
    # Check outgoing connections
    for rig_joint, connected_nodes in nodes_with_outgoing_connection_list:
        for connected_node in connected_nodes:
            # Check if connected_node is a DEF or RIG joint
            if connected_node.startswith("DEF_") and connected_node.endswith("_jnt"):
                direct_connection_list.append((rig_joint, connected_node))
            elif connected_node.startswith("RIG_") and connected_node.endswith("_jnt"):
                direct_connection_list.append((rig_joint, connected_node))
            else:
                intermediate_nodes_list.append((rig_joint, connected_node))
    
    print(f"Found {len(direct_connection_list)} direct DEF-RIG connections")
    print(f"Found {len(intermediate_nodes_list)} connections through intermediate nodes")
    
    # Categorize intermediate nodes
    parent_matrix_nodes_list = []
    not_parent_matrix_list = []
    
    for source_joint, intermediate_node in intermediate_nodes_list:
        node_type = cmds.nodeType(intermediate_node)
        if node_type == "parentMatrix" and intermediate_node.endswith("_ParentMatrix"):
            parent_matrix_nodes_list.append((source_joint, intermediate_node))
        else:
            not_parent_matrix_list.append((source_joint, intermediate_node))
    
    print(f"Found {len(parent_matrix_nodes_list)} parentMatrix nodes")
    print(f"Found {len(not_parent_matrix_list)} other intermediate nodes")
    
    # Return all the gathered data
    return {
        "DEF_joints_list": DEF_joints_list,
        "RIG_joints_list": RIG_joints_list,
        "ignored_nodes": ignored_nodes,
        "matched_joints_dict": matched_joints_dict,
        "lonely_joints_list": lonely_joints_list,
        "nodes_with_incoming_connection_list": nodes_with_incoming_connection_list,
        "nodes_with_outgoing_connection_list": nodes_with_outgoing_connection_list,
        "not_connected_nodes_list": not_connected_nodes_list,
        "direct_connection_list": direct_connection_list,
        "intermediate_nodes_list": intermediate_nodes_list,
        "parent_matrix_nodes_list": parent_matrix_nodes_list,
        "not_parent_matrix_list": not_parent_matrix_list
    }

# For testing
if __name__ == "__main__":
    data = get_def_to_rig_data()
    if data:
        print("\nData Collection Summary:")
        for key, value in data.items():
            if isinstance(value, list):
                print(f"{key}: {len(value)} items")
            elif isinstance(value, dict):
                print(f"{key}: {len(value)} items")
            else:
                print(f"{key}: {value}")