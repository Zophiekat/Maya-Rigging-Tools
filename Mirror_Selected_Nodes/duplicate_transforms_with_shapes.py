import json
import os
from maya import cmds

# Import the global paths
from global_paths import PATHS

def load_json_data(file_path):
    """Load data from a JSON file."""
    with open(file_path, 'r') as file:
        return json.load(file)

def duplicate_transforms_with_shapes():
    """Duplicate transform nodes that have shape nodes from L to R side."""
    # Load the necessary JSON data files
    transforms_path = PATHS.get_data_file_path("transforms_with_shapes_data.json")
    node_side_data_path = PATHS.get_data_file_path("node_side_data.json")
    mirror_side_data_path = PATHS.get_data_file_path("mirror_side_data.json")
    
    if not os.path.exists(transforms_path) or not os.path.exists(node_side_data_path):
        cmds.error("❌ Required JSON data files not found!")
        return False
        
    # Load the data
    transforms_data = load_json_data(transforms_path)
    side_data = load_json_data(node_side_data_path)
    
    # Debug: Let's see what the structure actually is
    print(f"🔑 transforms_data keys: {transforms_data.keys()}")
    if "transforms" in transforms_data and transforms_data["transforms"]:
        print(f"🔑 First transform item keys: {transforms_data['transforms'][0].keys()}")
    
    # Load mirror side data
    mirrored_node_mapping = {}
    if os.path.exists(mirror_side_data_path):
        print(f"🪞 Using mirror side data from: {mirror_side_data_path}")
        mirror_data = load_json_data(mirror_side_data_path)
        mirrored_node_mapping = mirror_data.get("mirror_mapping", {})
    else:
        cmds.error("❌ Mirror side data not found! Run create_mirror_side_data.py first")
        return False
    
    # Extract transform nodes - use the correct key 'transform_name'
    transforms_to_duplicate = []
    if "transforms" in transforms_data:
        for item in transforms_data["transforms"]:
            # The correct key is 'transform_name' based on the debug output
            if "transform_name" in item:
                transforms_to_duplicate.append(item["transform_name"])
            else:
                print(f"❗️ Warning: Could not find transform name in item: {item}")
    
    print(f"☘️ Found {len(transforms_to_duplicate)} transforms to duplicate")
    
    # Extract left side nodes from node_side_data for quick lookup
    left_nodes = {}
    if "left_side" in side_data:
        # Add nodes with "_L" suffix
        for node in side_data["left_side"].get("L_suffix", []):
            left_nodes[node] = "_L"
        # Add nodes with "_L_" infix
        for node in side_data["left_side"].get("L_infix", []):
            left_nodes[node] = "_L_"
    
    # Create the object sets if they don't exist
    if not cmds.objExists("mirror_input"):
        cmds.sets(name="mirror_input", empty=True)
    
    if not cmds.objExists("mirror_output"):
        cmds.sets(name="mirror_output", empty=True)
    
    # Track results
    duplicate_results = {
        "success_count": 0,
        "error_count": 0,
        "skipped_count": 0,
        "already_exists": 0,
        "duplicated_transforms": []
    }
    
    # Track what we've already duplicated
    already_duplicated = set()
    
    # Process each transform individually
    for transform in transforms_to_duplicate:
        # Skip if already processed
        if transform in already_duplicated:
            print(f"💤 Skipping {transform} - already processed")
            continue
            
        # Check if the transform exists
        if not cmds.objExists(transform):
            print(f"❌ ERROR: Transform {transform} does not exist in the scene, skipping")
            duplicate_results["error_count"] += 1
            continue
        
        # Check if it's a left side node
        if transform not in left_nodes:
            print(f"💤 Skipping: {transform} is not identified as a left side node")
            duplicate_results["skipped_count"] += 1
            continue
        
        # Check if we have a mirror mapping for this node
        if transform not in mirrored_node_mapping:
            print(f"❌ ERROR: No mirror mapping found for {transform}, skipping")
            duplicate_results["error_count"] += 1
            continue
        
        # Get the new name from the mirrored mapping
        new_name = mirrored_node_mapping[transform]
        
        # Check if the target already exists
        if cmds.objExists(new_name):
            print(f"💤 Node {new_name} already exists, skipping duplication of {transform}")
            duplicate_results["already_exists"] += 1
            already_duplicated.add(transform)
            continue
            
        print(f"Using mirror side mapping: {transform} → {new_name}")
        
        # Try to duplicate the transform with its shapes
        try:
            # Clear selection first
            cmds.select(clear=True)
            
            # Select the DG node
            cmds.select(transform, replace=True)
            
            # Verify selection
            selected_node = cmds.ls(selection=True)
            if not selected_node:
                raise RuntimeError(f"❌ Failed to select node {node}")
            
            print(f"🖱️ Selected Node: {selected_node[0]}")
            
            # For transforms with shapes, duplicate the transform and its shape nodes
            # Use parentOnly to avoid duplicating transform children
            result = cmds.duplicate(transform, name=new_name, parentOnly=False)
            
            if not result or len(result) == 0:
                raise RuntimeError(f"❌ Duplicate command returned empty result")
            else:
                print(f"🐑 Duplicated Node: {result}")
                
            duplicated = result[0]
            
            # Ensure we have the exact name we want
            if duplicated != new_name:
                duplicated = cmds.rename(duplicated, new_name)
                
            print(f"🐑 Duplicated transform with shapes: {transform} to {duplicated}")
            already_duplicated.add(transform)
            
            # Add original node to mirror_input set
            try:
                cmds.sets(transform, add="mirror_input")
                print(f"  ✅ Added {transform} to mirror_input set")
            except Exception as e:
                print(f"  ⚠️ Warning: Could not add {transform} to mirror_input set: {str(e)}")
            
            # Clean up: Remove any unwanted transform children (keep only shape nodes)
            children = cmds.listRelatives(duplicated, children=True, type='transform', fullPath=False) or []
            for child in children:
                # Delete transform children (shapes will remain)
                try:
                    cmds.delete(f"{duplicated}|{child}")
                    print(f"🗑️ Removed unwanted transform child: {child}")
                except:
                    pass
            
            # Handle set membership
            sets_to_check = cmds.listSets(object=duplicated) or []
            for set_name in sets_to_check:
                if set_name in ["NodeGroup_Leg_L", "NodeGroup_Foot_L", "mirror_input"]:
                    try:
                        cmds.sets(duplicated, remove=set_name)
                        print(f"🧼 Removed {duplicated} from set: {set_name}")
                    except:
                        pass
            
            # Add to mirror_output set
            try:
                cmds.sets(duplicated, add="mirror_output")
            except Exception as e:
                print(f"❌ ERROR: Could not add {duplicated} to mirror_output set: {str(e)}")
            
            duplicate_results["success_count"] += 1
            duplicate_results["duplicated_transforms"].append({
                "source": transform,
                "duplicate": duplicated
            })
            
        except Exception as e:
            print(f"❌ ERROR: Failed to duplicate {transform}: {str(e)}")
            duplicate_results["error_count"] += 1
    
    # Clear selection after processing
    cmds.select(clear=True)
    
    # Print summary
    print(f"\nTransforms With Shapes Duplication Summary:")
    print(f"- Transforms processed: {len(transforms_to_duplicate)}")
    print(f"- Successfully duplicated: {duplicate_results['success_count']}")
    print(f"- Already existed: {duplicate_results['already_exists']}")
    print(f"- Skipped (not L-side): {duplicate_results['skipped_count']}")
    print(f"- Errors: {duplicate_results['error_count']}")
    
    return duplicate_results

def run():
    """Run the transforms with shapes duplication process."""
    return duplicate_transforms_with_shapes()

if __name__ == "__main__":
    run()