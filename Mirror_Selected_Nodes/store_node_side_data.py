import json
import os
import re
from maya import cmds

# Import the global paths
from global_paths import PATHS
import filter_utils

def determine_node_side(node_name):
    """
    Determine if a node belongs to left side, right side, or has no side designation.
    
    Args:
        node_name (str): Name of the node to check
        
    Returns:
        dict: Dictionary with side information and pattern matches
    """
    # Initialize the result dictionary
    result = {
        "node_name": node_name,
        "side": "none",  # Default: no side
        "pattern": None  # Which pattern matched
    }
    
    # Check for left side patterns
    if "_L_" in node_name:
        result["side"] = "left"
        result["pattern"] = "_L_"
    elif node_name.endswith("_L"):
        result["side"] = "left"
        result["pattern"] = "_L"
    # Check for right side patterns
    elif "_R_" in node_name:
        result["side"] = "right"
        result["pattern"] = "_R_"
    elif node_name.endswith("_R"):
        result["side"] = "right"
        result["pattern"] = "_R"
    
    return result

def save_node_side_data_to_json(output_file=None):
    """
    Analyze selected nodes to determine their side (left, right, or none)
    and save the analysis to a JSON file.
    
    Args:
        output_file (str, optional): Path where to save the data
        
    Returns:
        dict: Dictionary with side analysis data
    """
    # Get all selected nodes
    all_selected_nodes = cmds.ls(selection=True)
    
    if not all_selected_nodes:
        print("No nodes selected.")
        return {}
    
    # Define default output file path if none provided
    if output_file is None:
        output_file = PATHS.get_data_file_path("node_side_data.json")
    
    # Make sure the data directory exists
    data_dir = os.path.dirname(output_file)
    if not os.path.exists(data_dir):
        os.makedirs(data_dir)
    
    # Filter out nodes that should be ignored
    filtered_nodes = filter_utils.filter_nodes(all_selected_nodes)
    
    # Initialize counters and collections
    left_side_count = 0
    right_side_count = 0
    no_side_count = 0
    
    left_L_count = 0
    left_L_underscore_count = 0
    right_R_count = 0
    right_R_underscore_count = 0
    
    left_L_nodes = []
    left_L_underscore_nodes = []
    right_R_nodes = []
    right_R_underscore_nodes = []
    no_side_nodes = []
    
    # Process each node
    for node in filtered_nodes:
        side_info = determine_node_side(node)
        
        if side_info["side"] == "left":
            left_side_count += 1
            
            if side_info["pattern"] == "_L":
                left_L_count += 1
                left_L_nodes.append(node)
            elif side_info["pattern"] == "_L_":
                left_L_underscore_count += 1
                left_L_underscore_nodes.append(node)
                
        elif side_info["side"] == "right":
            right_side_count += 1
            
            if side_info["pattern"] == "_R":
                right_R_count += 1
                right_R_nodes.append(node)
            elif side_info["pattern"] == "_R_":
                right_R_underscore_count += 1
                right_R_underscore_nodes.append(node)
                
        else:  # No side
            no_side_count += 1
            no_side_nodes.append(node)
    
    # Create the output data structure
    output_data = {
        "summary": {
            "total_nodes": len(filtered_nodes),
            "no_side_count": no_side_count,
            "left_side_count": left_side_count,
            "right_side_count": right_side_count,
            "left_L_count": left_L_count,
            "left_L_underscore_count": left_L_underscore_count,
            "right_R_count": right_R_count,
            "right_R_underscore_count": right_R_underscore_count
        },
        "no_side": no_side_nodes,
        "left_side": {
            "L_suffix": left_L_nodes,
            "L_infix": left_L_underscore_nodes
        },
        "right_side": {
            "R_suffix": right_R_nodes,
            "R_infix": right_R_underscore_nodes
        }
    }
    
    # Write to JSON file
    with open(output_file, 'w') as f:
        json.dump(output_data, f, indent=4)
    
    print(f"Node side analysis data saved to {output_file}")
    print(f"Summary: {len(filtered_nodes)} nodes analyzed")
    print(f"Left side: {left_side_count}, Right side: {right_side_count}, No side: {no_side_count}")
    
    return output_data

def store_node_side_data():
    """Store data about node side designations for selected nodes."""
    return save_node_side_data_to_json()

def run():
    """Run the node side analysis directly."""
    return store_node_side_data()

# Only run this code if the script is executed directly (not imported)
if __name__ == "__main__":
    run()