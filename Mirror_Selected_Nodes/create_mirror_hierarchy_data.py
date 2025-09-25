import os
import json
import sys
import traceback

# Ensure we can import from the same directory
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
if SCRIPT_DIR not in sys.path:
    sys.path.append(SCRIPT_DIR)

from global_paths import PATHS
from maya import cmds

def mirror_node_name(node_name):
    """
    Mirror node names by swapping L and R sides.
    Example: 'arm_L_ctrl' -> 'arm_R_ctrl', 'leg_R_joint' -> 'leg_L_joint'
    """
    if "_L_" in node_name:
        return node_name.replace("_L_", "_R_")
    elif "_L" in node_name:
        return node_name.replace("_L", "_R")
    elif "_R_" in node_name:
        return node_name.replace("_R_", "_L_")
    elif "_R" in node_name:
        return node_name.replace("_R", "_L")
    elif "left_" in node_name.lower():
        return node_name.lower().replace("left_", "right_", 1)
    elif "right_" in node_name.lower():
        return node_name.lower().replace("right_", "left_", 1)
    return node_name

def mirror_hierarchy_data(hierarchy_data):
    """
    Mirror the hierarchy data by swapping L/R designations in all node names.
    """
    mirrored_data = {}
    
    for node, children in hierarchy_data.items():
        mirrored_node = mirror_node_name(node)
        mirrored_children = [mirror_node_name(child) for child in children]
        mirrored_data[mirrored_node] = mirrored_children
    
    return mirrored_data

def save_mirrored_hierarchy_to_json(output_path):
    """
    Load the original hierarchy data, mirror it, and save to a new file.
    """
    try:
        # Load the original hierarchy data
        input_path = PATHS.get_data_file_path("hierarchy_data.json")
        
        if not os.path.exists(input_path):
            cmds.warning(f"Hierarchy data file not found: {input_path}")
            return False
            
        with open(input_path, 'r') as f:
            hierarchy_data = json.load(f)
        
        # Mirror the hierarchy data
        mirrored_data = mirror_hierarchy_data(hierarchy_data)
        
        # Save the mirrored data
        with open(output_path, 'w') as f:
            json.dump(mirrored_data, f, indent=4)
            
        print(f"Mirrored hierarchy data saved to: {output_path}")
        return True
        
    except Exception as e:
        cmds.warning(f"Error mirroring hierarchy data: {str(e)}")
        traceback.print_exc()
        return False

def run():
    """
    Main function to create mirrored hierarchy data.
    """
    output_path = PATHS.get_data_file_path("mirrored_hierarchy_data.json")
    return save_mirrored_hierarchy_to_json(output_path)

if __name__ == "__main__":
    run()