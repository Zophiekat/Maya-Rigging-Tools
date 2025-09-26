import json
import os
import sys

# Ensure we can import from the same directory
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
if SCRIPT_DIR not in sys.path:
    sys.path.append(SCRIPT_DIR)

from global_paths import PATHS

def mirror_node_name(node_name):
    """
    Mirror a node name by swapping L/R designations.
    """
    # Handle _L_ and _R_ (infix)
    if "_L_" in node_name:
        return node_name.replace("_L_", "_R_")
    elif "_R_" in node_name:
        return node_name.replace("_R_", "_L_")
    # Handle _L and _R (suffix)
    elif node_name.endswith("_L"):
        return node_name[:-2] + "_R"
    elif node_name.endswith("_R"):
        return node_name[:-2] + "_L"
    # Handle __L__ and __R__ (double underscore)
    elif "__L__" in node_name:
        return node_name.replace("__L__", "__R__")
    elif "__R__" in node_name:
        return node_name.replace("__R__", "__L__")
    
    return node_name

def create_mirror_node_mapping():
    """
    Create a mapping of original nodes to their mirrored counterparts.
    Also creates reverse mapping for utility nodes.
    """
    # Load the node side data
    node_side_data_path = PATHS.get_data_file_path("node_side_data.json")
    
    if not os.path.exists(node_side_data_path):
        print(f"ERROR: node_side_data.json not found at {node_side_data_path}")
        return None
    
    with open(node_side_data_path, 'r') as f:
        side_data = json.load(f)
    
    # Create the mirror mapping
    mirror_mapping = {}
    
    # Process left side nodes - these will map to right side
    if "left_side" in side_data:
        # Process L suffix nodes
        for node in side_data["left_side"].get("L_suffix", []):
            mirrored_name = mirror_node_name(node)
            mirror_mapping[node] = mirrored_name
            print(f"L_suffix: {node} → {mirrored_name}")
        
        # Process L infix nodes
        for node in side_data["left_side"].get("L_infix", []):
            mirrored_name = mirror_node_name(node)
            mirror_mapping[node] = mirrored_name
            print(f"L_infix: {node} → {mirrored_name}")
    
    # Process right side nodes - these will map to left side
    if "right_side" in side_data:
        # Process R suffix nodes
        for node in side_data["right_side"].get("R_suffix", []):
            mirrored_name = mirror_node_name(node)
            mirror_mapping[node] = mirrored_name
            print(f"R_suffix: {node} → {mirrored_name}")
        
        # Process R infix nodes
        for node in side_data["right_side"].get("R_infix", []):
            mirrored_name = mirror_node_name(node)
            mirror_mapping[node] = mirrored_name
            print(f"R_infix: {node} → {mirrored_name}")
    
    # Process nodes with no side designation (these stay the same)
    if "no_side" in side_data:
        for node in side_data["no_side"]:
            mirror_mapping[node] = node
            print(f"No side: {node} → {node} (unchanged)")
    
    return mirror_mapping

def save_mirror_side_data():
    """
    Create and save the mirror side mapping data.
    """
    print("Creating mirror side data...")
    
    # Create the mapping
    mirror_mapping = create_mirror_node_mapping()
    
    if not mirror_mapping:
        print("ERROR: Failed to create mirror mapping")
        return False
    
    # Create the output data structure
    output_data = {
        "summary": {
            "total_nodes": len(mirror_mapping),
            "timestamp": None  # Will be added by the save function if needed
        },
        "mirror_mapping": mirror_mapping,
        "reverse_mapping": {}  # Create reverse mapping for lookups
    }
    
    # Create reverse mapping (R to L)
    for original, mirrored in mirror_mapping.items():
        output_data["reverse_mapping"][mirrored] = original
    
    # Save to JSON - using the correct name
    output_path = PATHS.get_data_file_path("mirror_side_data.json")
    
    try:
        with open(output_path, 'w') as f:
            json.dump(output_data, f, indent=4)
        
        print(f"\nMirror side data saved to: {output_path}")
        print(f"Total nodes in mapping: {len(mirror_mapping)}")
        
        # Print some examples
        print("\nSample mappings:")
        count = 0
        for original, mirrored in mirror_mapping.items():
            if original != mirrored:  # Only show changed mappings
                print(f"  {original} → {mirrored}")
                count += 1
                if count >= 5:  # Show first 5 examples
                    break
        
        return True
        
    except Exception as e:
        print(f"ERROR: Failed to save mirror side data: {str(e)}")
        return False

def run():
    """
    Main function to create mirror side data.
    """
    return save_mirror_side_data()

if __name__ == "__main__":
    run()