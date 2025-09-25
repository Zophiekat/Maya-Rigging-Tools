import json
import os
from maya import cmds

# Import the global paths
from global_paths import PATHS
import filter_utils

# List of node types that are shapes - we will exclude these
SHAPE_NODE_TYPES = [
    "mesh", 
    "nurbsCurve", 
    "nurbsSurface",
    "subdiv",
    "locator",
    "camera",
    "light",
    "follicle"
]

def is_non_shape_dag_node(node):
    """
    Check if a node is a DAG node that is not a shape node itself
    and also doesn't have any shape children.
    
    Args:
        node (str): Node name to check
        
    Returns:
        bool: True if the node is a DAG node but not a shape node and has no shape children
    """
    try:
        # Verify it's a DAG node first
        is_dag = cmds.objectType(node, isAType="dagNode")
        if not is_dag:
            return False
            
        # Check if it's a shape node type (mesh, nurbsCurve, etc.)
        node_type = cmds.nodeType(node)
        if node_type in SHAPE_NODE_TYPES:
            return False
            
        # If it's a transform, check if it has shape children
        if cmds.objectType(node, isAType="transform"):
            # Get shape nodes for this transform
            shapes = cmds.listRelatives(node, shapes=True) or []
            if shapes:  # If there are shapes, don't include this node
                return False
                
        return True
    except Exception as e:
        print(f"Error checking node {node}: {str(e)}")
        return False

def save_dag_nodes_without_shapes_to_json(output_file=None):
    """
    Save all DAG nodes that are not shape nodes and don't have shape children to JSON.
    This excludes both shape nodes themselves (mesh, nurbsCurve, etc.) 
    and transform nodes that have shape children.
    
    Args:
        output_file (str, optional): Path where to save the data
        
    Returns:
        dict: Dictionary with summary and list of DAG nodes that don't have shapes
    """
    # Get all selected DAG nodes
    all_selected_dag_nodes = cmds.ls(selection=True, dag=True)
    
    if not all_selected_dag_nodes:
        print("No DAG nodes selected.")
        return []
    
    # Define default output file path if none provided
    if output_file is None:
        output_file = PATHS.get_data_file_path("dag_nodes_without_shapes_data.json")
    
    # Make sure the data directory exists
    data_dir = os.path.dirname(output_file)
    if not os.path.exists(data_dir):
        os.makedirs(data_dir)
    
    # Filter out nodes that should be ignored
    filtered_nodes = filter_utils.filter_nodes(all_selected_dag_nodes)
    
    # Filter for DAG nodes that are not shape nodes themselves
    non_shape_dag_nodes = []
    node_types_count = {}
    
    for node in filtered_nodes:
        if is_non_shape_dag_node(node):
            node_type = cmds.nodeType(node)
            
            # Increment the count for this node type
            if node_type in node_types_count:
                node_types_count[node_type] += 1
            else:
                node_types_count[node_type] = 1
                
            # Store node name and its type
            non_shape_dag_nodes.append({
                "node_name": node,
                "node_type": node_type
            })
    
    # Create the data structure with summary at the top
    output_data = {
        "summary": {
            "total_nodes": len(non_shape_dag_nodes),
            "node_types": node_types_count
        },
        "nodes": non_shape_dag_nodes
    }
    
    # Write to JSON file
    with open(output_file, 'w') as f:
        json.dump(output_data, f, indent=4)
    
    print(f"DAG nodes without shapes data saved to {output_file}")
    print(f"Summary: {len(non_shape_dag_nodes)} non-shape DAG nodes processed")
    
    return output_data

def store_dag_nodes_without_shapes():
    """Store data about currently selected DAG nodes without shapes."""
    return save_dag_nodes_without_shapes_to_json()

def run():
    """Run the DAG nodes without shapes storage directly."""
    return store_dag_nodes_without_shapes()

# Only run this code if the script is executed directly (not imported)
if __name__ == "__main__":
    run()