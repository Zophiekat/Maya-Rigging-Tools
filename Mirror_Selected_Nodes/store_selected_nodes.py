import json
import os
from maya import cmds

# Import the global paths
from global_paths import PATHS
import filter_utils

# Simplified version - we only need node names now
def get_node_info(node):
    """Get simplified node information (just the name)."""
    return node

def save_selected_nodes_to_json(output_file=None):
    """Save selected nodes to JSON with node types and a summary."""
    # Get all selected nodes
    all_selected_nodes = cmds.ls(selection=True)
    
    if not all_selected_nodes:
        print("No nodes selected.")
        return []
    
    # Define default output file path if none provided
    if output_file is None:
        output_file = PATHS.get_data_file_path("selected_nodes_data.json")
    
    # Make sure the data directory exists
    data_dir = os.path.dirname(output_file)
    if not os.path.exists(data_dir):
        os.makedirs(data_dir)
    
    # Filter out nodes that should be ignored
    filtered_nodes = filter_utils.filter_nodes(all_selected_nodes)
    
    # Store nodes with their types
    nodes_data = []
    node_types_count = {}
    
    for node in filtered_nodes:
        # Get node type
        node_type = cmds.nodeType(node)
        
        # Increment the count for this node type
        if node_type in node_types_count:
            node_types_count[node_type] += 1
        else:
            node_types_count[node_type] = 1
            
        # Store node name and type
        nodes_data.append({
            "node_name": node,
            "node_type": node_type
        })
    
    # Create the data structure with summary at the top
    output_data = {
        "summary": {
            "total_nodes": len(nodes_data),
            "node_types": node_types_count
        },
        "nodes": nodes_data
    }
    
    # Write to JSON file
    with open(output_file, 'w') as f:
        json.dump(output_data, f, indent=4)
    
    print(f"Selected nodes data saved to {output_file}")
    print(f"Summary: {len(filtered_nodes)} nodes processed")
    
    return output_data

def store_selected_nodes():
    """Store data about currently selected nodes."""
    return save_selected_nodes_to_json()

def run():
    """Run the selected nodes storage directly."""
    return store_selected_nodes()

# Only run this code if the script is executed directly (not imported)
if __name__ == "__main__":
    run()