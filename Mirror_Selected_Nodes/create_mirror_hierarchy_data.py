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
    elif "_L" in node_name and not node_name.endswith("_L_"):
        # Be careful with _L at the end to avoid double replacement
        parts = node_name.rsplit("_L", 1)
        if len(parts) == 2:
            return parts[0] + "_R" + parts[1]
    elif "_R_" in node_name:
        return node_name.replace("_R_", "_L_")
    elif "_R" in node_name and not node_name.endswith("_R_"):
        # Be careful with _R at the end to avoid double replacement
        parts = node_name.rsplit("_R", 1)
        if len(parts) == 2:
            return parts[0] + "_L" + parts[1]
    elif "left_" in node_name.lower():
        return node_name.replace("left_", "right_")
    elif "Left_" in node_name:
        return node_name.replace("Left_", "Right_")
    elif "right_" in node_name.lower():
        return node_name.replace("right_", "left_")
    elif "Right_" in node_name:
        return node_name.replace("Right_", "Left_")
    return node_name

def mirror_hierarchy_data(hierarchy_data):
    """
    Mirror the hierarchy data by swapping L/R designations in all node names.
    """
    mirrored_data = {}
    
    for node, children in hierarchy_data.items():
        # Mirror the node name
        mirrored_node = mirror_node_name(node)
        
        # Mirror the children list
        if isinstance(children, list):
            # Simple list of children
            mirrored_children = [mirror_node_name(child) for child in children]
            mirrored_data[mirrored_node] = mirrored_children
        elif isinstance(children, dict):
            # If it's a dict with more info, mirror all string values that look like node names
            mirrored_info = {}
            for key, value in children.items():
                if isinstance(value, str):
                    # Check if it looks like a node name (has underscores and L/R)
                    if "_L" in value or "_R" in value:
                        mirrored_info[key] = mirror_node_name(value)
                    else:
                        mirrored_info[key] = value
                elif isinstance(value, list):
                    # Mirror lists of what might be node names
                    mirrored_list = []
                    for item in value:
                        if isinstance(item, str) and ("_L" in item or "_R" in item):
                            mirrored_list.append(mirror_node_name(item))
                        else:
                            mirrored_list.append(item)
                    mirrored_info[key] = mirrored_list
                else:
                    mirrored_info[key] = value
            mirrored_data[mirrored_node] = mirrored_info
        else:
            # Just copy the value as is
            mirrored_data[mirrored_node] = children
    
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
        
        print(f"Loaded hierarchy data with {len(hierarchy_data)} nodes")
        
        # Mirror the hierarchy data
        mirrored_data = mirror_hierarchy_data(hierarchy_data)
        
        print(f"Created mirrored data with {len(mirrored_data)} nodes")
        
        # Save the mirrored data
        with open(output_path, 'w') as f:
            json.dump(mirrored_data, f, indent=4)
            
        print(f"Mirrored hierarchy data saved to: {output_path}")
        
        # Show a sample of the transformation
        if hierarchy_data:
            first_key = next(iter(hierarchy_data))
            mirrored_first_key = next(iter(mirrored_data))
            print(f"\nSample transformation:")
            print(f"  Original: {first_key}")
            print(f"  Mirrored: {mirrored_first_key}")
            print(f"  Original data: {hierarchy_data[first_key]}")
            print(f"  Mirrored data: {mirrored_data[mirrored_first_key]}")
        
        return True
        
    except Exception as e:
        cmds.warning(f"Error mirroring hierarchy data: {str(e)}")
        traceback.print_exc()
        return False

def run():
    """
    Main function to create mirrored side hierarchy data.
    """
    output_path = PATHS.get_data_file_path("mirrored_side_hierarchy_data.json")
    return save_mirrored_hierarchy_to_json(output_path)

if __name__ == "__main__":
    run()