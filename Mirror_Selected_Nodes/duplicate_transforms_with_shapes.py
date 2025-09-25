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
    """Duplicate transform nodes with shapes from L to R side."""
    # Load the necessary JSON data files
    transforms_path = PATHS.get_data_file_path("transforms_with_shapes_data.json")
    node_side_data_path = PATHS.get_data_file_path("node_side_data.json")
    mirrored_nodes_path = PATHS.get_data_file_path("mirrored_hierarchy_data.json")
    
    if not os.path.exists(transforms_path) or not os.path.exists(node_side_data_path):
        cmds.error("Required JSON data files not found!")
        return False
        
    # Load the data
    transforms_data = load_json_data(transforms_path)
    side_data = load_json_data(node_side_data_path)
    
    # Load mirrored node data if available
    mirrored_node_mapping = {}
    if os.path.exists(mirrored_nodes_path):
        print(f"Using mirrored node data from: {mirrored_nodes_path}")
        mirrored_hierarchy = load_json_data(mirrored_nodes_path)
        
        # Get the keys from the mirrored hierarchy - these are our R side node names
        for r_node_name in mirrored_hierarchy.keys():
            # Convert back to L side name for the mapping
            if "_R_" in r_node_name:
                l_node_name = r_node_name.replace("_R_", "_L_")
                mirrored_node_mapping[l_node_name] = r_node_name
            elif "_R" in r_node_name:
                l_node_name = r_node_name.replace("_R", "_L")
                mirrored_node_mapping[l_node_name] = r_node_name
    
    # Extract transform nodes with shapes
    transforms_to_duplicate = []
    if "transforms" in transforms_data:
        transforms_to_duplicate = [t["transform_name"] for t in transforms_data["transforms"]]
    
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
        "duplicated_nodes": []
    }
    
    # Process each transform node individually
    for transform in transforms_to_duplicate:
        # Check if the transform exists
        if not cmds.objExists(transform):
            print(f"Warning: Transform {transform} does not exist in the scene, skipping")
            duplicate_results["error_count"] += 1
            continue
        
        # Check if it's a left side node
        if transform not in left_nodes:
            print(f"Transform {transform} is not identified as a left side node, skipping")
            continue
        
        # Get the new name from the mirrored mapping if available, otherwise use pattern replacement
        if transform in mirrored_node_mapping:
            new_name = mirrored_node_mapping[transform]
            print(f"Using mirrored node mapping: {transform} → {new_name}")
        else:
            # Fall back to pattern replacement
            pattern = left_nodes[transform]
            if pattern == "_L":
                new_name = transform.replace("_L", "_R")
            else:  # pattern is "_L_"
                new_name = transform.replace("_L_", "_R_")
            print(f"No mapping found, using pattern replacement: {transform} → {new_name}")
        
        # If the node already exists, delete it first
        if cmds.objExists(new_name):
            print(f"Node {new_name} already exists - deleting first")
            try:
                cmds.delete(new_name)
            except Exception as e:
                print(f"Error deleting existing node {new_name}: {str(e)}")
                continue
        
        # Get shape nodes and non-shape children
        shape_nodes = cmds.listRelatives(transform, shapes=True) or []
        all_children = cmds.listRelatives(transform, children=True) or []
        non_shape_children = [c for c in all_children if c not in shape_nodes]
        
        # Add to input set before duplication
        cmds.sets(transform, add="mirror_input")
        
        # Store the parent
        parent = cmds.listRelatives(transform, parent=True)
        parent_path = parent[0] if parent else None
        
        try:
            # Temporarily unparent the transform to avoid parenting issues
            if parent_path:
                cmds.parent(transform, world=True)
            
            # Temporarily hide non-shape children to exclude them from duplication
            visibility_states = {}
            for child in non_shape_children:
                if cmds.attributeQuery("visibility", node=child, exists=True):
                    visibility_states[child] = cmds.getAttr(f"{child}.visibility")
                    cmds.setAttr(f"{child}.visibility", False)
            
            # Duplicate the transform with shapes but without other children
            duplicated = cmds.duplicate(
                transform,
                name=new_name,
                renameChildren=True)[0]
            print(f"Duplicated transform with shapes: {transform} to {duplicated}")
            
            # Restore the original parent of the source node
            if parent_path:
                cmds.parent(transform, parent_path)
            
            # Restore visibility of non-shape children
            for child, state in visibility_states.items():
                cmds.setAttr(f"{child}.visibility", state)
            
            # Clean up any unwanted children that might have been duplicated despite our efforts
            duplicate_children = cmds.listRelatives(duplicated, children=True) or []
            for child in duplicate_children:
                if cmds.nodeType(child) not in ["mesh", "nurbsCurve", "nurbsSurface"]:
                    cmds.delete(child)
                    print(f"  Removed unwanted child: {child}")
            
            # Remove the duplicated node from ALL sets, including mirror_input if it was added
            all_sets = cmds.listSets(object=duplicated) or []
            for obj_set in all_sets:
                try:
                    cmds.sets(duplicated, remove=obj_set)
                    print(f"  Removed {duplicated} from set: {obj_set}")
                except Exception as e:
                    print(f"  Error removing {duplicated} from set {obj_set}: {str(e)}")
            
            # Add to output set only
            cmds.sets(duplicated, add="mirror_output")
            
            # Add duplicated shapes to output set as well
            dup_shapes = cmds.listRelatives(duplicated, shapes=True) or []
            for shape in dup_shapes:
                try:
                    # Remove shape from any sets first
                    shape_sets = cmds.listSets(object=shape) or []
                    for shape_set in shape_sets:
                        cmds.sets(shape, remove=shape_set)
                    # Add to output set
                    cmds.sets(shape, add="mirror_output")
                except Exception as e:
                    print(f"  Error handling shape {shape}: {str(e)}")
            
            duplicate_results["success_count"] += 1
            duplicate_results["duplicated_nodes"].append({
                "source": transform,
                "duplicate": duplicated
            })
            
        except Exception as e:
            print(f"Error duplicating {transform}: {str(e)}")
            duplicate_results["error_count"] += 1
    
    # Print summary
    print(f"\nDuplication Summary:")
    print(f"- Transforms processed: {len(transforms_to_duplicate)}")
    print(f"- Successfully duplicated: {duplicate_results['success_count']}")
    print(f"- Errors: {duplicate_results['error_count']}")
    
    return duplicate_results

def run():
    """Run the transforms with shapes duplication process."""
    return duplicate_transforms_with_shapes()

# Only run this code if the script is executed directly (not imported)
if __name__ == "__main__":
    run()