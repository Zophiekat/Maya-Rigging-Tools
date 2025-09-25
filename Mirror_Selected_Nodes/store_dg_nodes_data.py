import json
import os
from maya import cmds

# Import the global paths
from global_paths import PATHS
import filter_utils

def is_dg_node(node):
    """
    Check if a node is a DG (Dependency Graph) node but not a DAG node.
    
    Args:
        node (str): Node name to check
        
    Returns:
        bool: True if the node is a DG node but not a DAG node
    """
    try:
        # Check if it's a DAG node
        is_dag = cmds.objectType(node, isAType="dagNode")
        
        # If it's not a DAG node and it's a valid node, it's a DG node
        if not is_dag and cmds.objExists(node):
            return True
            
        return False
    except Exception:
        return False

def save_dg_nodes_to_json(output_file=None):
    """
    Save all DG (Dependency Graph) nodes that are not DAG nodes to JSON.
    
    Args:
        output_file (str, optional): Path where to save the data
        
    Returns:
        list: List of DG nodes
    """
    # Get all selected nodes
    all_selected_nodes = cmds.ls(selection=True)
    
    if not all_selected_nodes:
        print("No nodes selected.")
        return []
    
    # Define default output file path if none provided
    if output_file is None:
        output_file = PATHS.get_data_file_path("dg_nodes_data.json")
    
    # Make sure the data directory exists
    data_dir = os.path.dirname(output_file)
    if not os.path.exists(data_dir):
        os.makedirs(data_dir)
    
    # Filter out nodes that should be ignored
    filtered_nodes = filter_utils.filter_nodes(all_selected_nodes)
    
    # Filter for DG nodes only (nodes that are not DAG nodes)
    dg_nodes = []
    node_types_count = {}
    
    for node in filtered_nodes:
        if is_dg_node(node):
            # Store node name and its type
            node_type = cmds.nodeType(node)
            
            # Increment the count for this node type
            if node_type in node_types_count:
                node_types_count[node_type] += 1
            else:
                node_types_count[node_type] = 1
                
            dg_nodes.append({
                "node_name": node,
                "node_type": node_type
            })
    
    # Create the data structure with summary at the top
    output_data = {
        "summary": {
            "total_nodes": len(dg_nodes),
            "node_types": node_types_count
        },
        "nodes": dg_nodes
    }
    
    # Write to JSON file
    with open(output_file, 'w') as f:
        json.dump(output_data, f, indent=4)
    
    print(f"DG nodes data saved to {output_file}")
    print(f"Summary: {len(dg_nodes)} DG nodes processed")
    
    return output_data

def store_dg_nodes():
    """Store data about currently selected DG nodes."""
    return save_dg_nodes_to_json()

def run():
    """Run the DG nodes storage directly."""
    return store_dg_nodes()

# Only run this code if the script is executed directly (not imported)
if __name__ == "__main__":
    run()