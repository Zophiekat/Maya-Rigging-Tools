import json
import os
from maya import cmds

# Import the global paths
from global_paths import PATHS
import filter_utils

def get_transform_with_shapes_info(node):
    """
    Get information about a transform node and its shapes.
    
    Args:
        node (str): The transform node name
        
    Returns:
        dict: Dictionary with transform node name and its shape nodes (short names only)
    """
    # Get shape nodes for this transform (first get full path to ensure uniqueness)
    shapes_full_path = cmds.listRelatives(node, shapes=True, fullPath=True) or []
    
    # If there are no shapes, return None
    if not shapes_full_path:
        return None
    
    # Extract just the node names without paths
    shape_names = [shape.split('|')[-1] for shape in shapes_full_path]
    
    # Return the transform node and its shapes (short names only)
    return {
        "transform_name": node,
        "shape_nodes": shape_names
    }

def save_transforms_with_shapes_to_json(output_file=None):
    """
    Save information about transform nodes with shapes to JSON.
    
    Args:
        output_file (str, optional): Path where to save the data
        
    Returns:
        list: List of dictionaries with transform nodes and their shapes
    """
    # Get all selected nodes
    all_selected_nodes = cmds.ls(selection=True)
    
    if not all_selected_nodes:
        print("No nodes selected.")
        return []
    
    # Define default output file path if none provided
    if output_file is None:
        output_file = PATHS.get_data_file_path("transforms_with_shapes_data.json")
    
    # Make sure the data directory exists
    data_dir = os.path.dirname(output_file)
    if not os.path.exists(data_dir):
        os.makedirs(data_dir)
    
    # Filter out nodes that should be ignored
    filtered_nodes = filter_utils.filter_nodes(all_selected_nodes)
    
    # Filter for transforms with shapes only
    transforms_with_shapes = []
    transform_types_count = {}
    shape_types_count = {}
    total_shapes = 0
    
    for node in filtered_nodes:
        # Check if it's a transform
        if cmds.objectType(node, isAType="transform"):
            node_data = get_transform_with_shapes_info(node)
            if node_data:  # If it has shapes
                # Get transform node type
                transform_type = cmds.nodeType(node)
                
                # Increment transform type count
                if transform_type in transform_types_count:
                    transform_types_count[transform_type] += 1
                else:
                    transform_types_count[transform_type] = 1
                
                # Count shape types
                for shape_name in node_data["shape_nodes"]:
                    total_shapes += 1
                    # Try to get the shape type
                    try:
                        shape_type = cmds.nodeType(shape_name)
                        if shape_type in shape_types_count:
                            shape_types_count[shape_type] += 1
                        else:
                            shape_types_count[shape_type] = 1
                    except:
                        # If we can't get the shape type, skip it
                        pass
                
                transforms_with_shapes.append(node_data)
    
    # Create the data structure with summary at the top
    output_data = {
        "summary": {
            "total_transforms": len(transforms_with_shapes),
            "total_shapes": total_shapes,
            "transform_types": transform_types_count,
            "shape_types": shape_types_count
        },
        "transforms": transforms_with_shapes
    }
    
    # Write to JSON file
    with open(output_file, 'w') as f:
        json.dump(output_data, f, indent=4)
    
    print(f"Transforms with shapes data saved to {output_file}")
    print(f"Summary: {len(transforms_with_shapes)} transforms with shapes processed")
    
    return output_data

def store_transforms_with_shapes():
    """Store data about currently selected transforms with shapes."""
    return save_transforms_with_shapes_to_json()

def run():
    """Run the transforms with shapes storage directly."""
    return store_transforms_with_shapes()

# Only run this code if the script is executed directly (not imported)
if __name__ == "__main__":
    run()