import json
import os
from maya import cmds

# Import the global paths
from global_paths import PATHS

def load_json_data(file_path):
    """Load data from a JSON file."""
    with open(file_path, 'r') as file:
        return json.load(file)

def parent_transforms_with_shapes():
    """Parent duplicated R side transform nodes with shapes based on mirrored hierarchy data."""
    # Load the necessary JSON data files
    mirrored_hierarchy_path = PATHS.get_data_file_path("mirrored_hierarchy_data.json")
    transforms_path = PATHS.get_data_file_path("transforms_with_shapes_data.json")
    mirror_side_path = PATHS.get_data_file_path("mirror_side_data.json")
    
    if not os.path.exists(mirrored_hierarchy_path) or not os.path.exists(transforms_path):
        cmds.error("❌ Required JSON data files not found!")
        return False
    
    # Load the data
    mirrored_hierarchy_data = load_json_data(mirrored_hierarchy_path)
    transforms_data = load_json_data(transforms_path)
    
    # Load mirror mapping to get L->R node mappings
    mirror_mapping = {}
    if os.path.exists(mirror_side_path):
        mirror_data = load_json_data(mirror_side_path)
        mirror_mapping = mirror_data.get("mirror_mapping", {})
    
    # Print some debug info about the hierarchy data
    print(f"🌳 Mirrored hierarchy data contains {len(mirrored_hierarchy_data)} nodes")
    
    # Extract L side transform nodes and get their R side equivalents
    transforms_to_parent = []
    for transform in transforms_data.get("transforms", []):
        l_transform_name = transform["transform_name"]
        
        # Check if this is an L-side transform
        if "_L" in l_transform_name or "_L_" in l_transform_name:
            # Get the R-side equivalent from mirror mapping
            if l_transform_name in mirror_mapping:
                r_transform_name = mirror_mapping[l_transform_name]
                transforms_to_parent.append(r_transform_name)
    
    print(f"☘️ Found {len(transforms_to_parent)} R-side transforms to process for parenting")
    
    # Track results
    parenting_results = {
        "success_count": 0,
        "error_count": 0,
        "skipped_count": 0,
        "parented_transforms": []
    }
    
    # Process each R side transform
    for r_transform in transforms_to_parent:
        # Get the hierarchy info from mirrored_hierarchy_data
        if r_transform not in mirrored_hierarchy_data:
            print(f"❌ Cannot find hierarchy info for {r_transform} in mirrored data, skipping")
            parenting_results["skipped_count"] += 1
            continue
        
        # Get the parent from the mirrored hierarchy data
        node_info = mirrored_hierarchy_data[r_transform]
        r_parent = node_info.get("parent")
        
        if r_parent is None:
            print(f"❌ Transform {r_transform} has no parent info in mirrored data, skipping")
            parenting_results["skipped_count"] += 1
            continue
        
        # Skip if no parent (root node)
        if not r_parent:
            print(f"ℹ️ Transform {r_transform} has no parent (it's a root node), skipping")
            parenting_results["skipped_count"] += 1
            continue
        
        # Check if both the transform and parent exist in the scene
        if not cmds.objExists(r_transform):
            print(f"❌ R side transform {r_transform} does not exist in scene, skipping")
            parenting_results["error_count"] += 1
            continue
            
        if not cmds.objExists(r_parent):
            print(f"❌ R side parent {r_parent} does not exist in scene, skipping {r_transform}")
            parenting_results["error_count"] += 1
            continue
        
        # Check if already parented correctly
        current_parent = cmds.listRelatives(r_transform, parent=True)
        if current_parent and current_parent[0] == r_parent:
            print(f"ℹ️ {r_transform} is already parented to {r_parent}, skipping")
            parenting_results["skipped_count"] += 1
            continue
        
        # Perform the parenting
        try:
            print(f"👨‍👧 Parenting {r_transform} to {r_parent}")
            cmds.parent(r_transform, r_parent)
            parenting_results["success_count"] += 1
            parenting_results["parented_transforms"].append({
                "transform": r_transform,
                "parent": r_parent,
                "children": node_info.get("children", [])
            })
        except Exception as e:
            print(f"❌ Error parenting {r_transform} to {r_parent}: {str(e)}")
            parenting_results["error_count"] += 1
    
    # Print summary
    print(f"\n📊 Transforms With Shapes Parenting Summary:")
    print(f"- Transforms processed: {len(transforms_to_parent)}")
    print(f"- Successfully parented: {parenting_results['success_count']}")
    print(f"- Skipped (no hierarchy info or already parented): {parenting_results['skipped_count']}")
    print(f"- Errors: {parenting_results['error_count']}")
    
    return parenting_results

def run():
    """Run the transforms with shapes parenting process."""
    return parent_transforms_with_shapes()

# Only run this code if the script is executed directly (not imported)
if __name__ == "__main__":
    run()