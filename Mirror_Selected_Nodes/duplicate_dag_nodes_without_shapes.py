import json
import os
from maya import cmds

# Import the global paths
from global_paths import PATHS

def load_json_data(file_path):
    """Load data from a JSON file."""
    with open(file_path, 'r') as file:
        return json.load(file)

def duplicate_dag_nodes_without_shapes():
    """Duplicate DAG nodes that have no shape nodes from L to R side."""
    # Load the necessary JSON data files
    nodes_without_shapes_path = PATHS.get_data_file_path("dag_nodes_without_shapes_data.json")
    node_side_data_path = PATHS.get_data_file_path("node_side_data.json")
    mirrored_nodes_path = PATHS.get_data_file_path("mirrored_hierarchy_data.json")
    
    if not os.path.exists(nodes_without_shapes_path) or not os.path.exists(node_side_data_path):
        cmds.error("❌ Required JSON data files not found!")
        return False
        
    # Load the data
    nodes_data = load_json_data(nodes_without_shapes_path)
    side_data = load_json_data(node_side_data_path)
    
    # Load mirrored node data if available
    mirrored_node_mapping = {}
    if os.path.exists(mirrored_nodes_path):
        print(f"🪞 Using mirrored node data from: {mirrored_nodes_path}")
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
    
    # Extract nodes
    nodes_to_duplicate = []
    if "nodes" in nodes_data:
        nodes_to_duplicate = [n["node_name"] for n in nodes_data["nodes"]]
    
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
        "duplicated_nodes": []
    }
    
    # Track what we've already duplicated to avoid duplicates
    already_duplicated = set()
    
    # Process each node individually
    for node in nodes_to_duplicate:
        # Skip if already processed
        if node in already_duplicated:
            print(f"💤 Skipping {node} - already processed")
            continue
            
        # Check if the node exists
        if not cmds.objExists(node):
            print(f"❌ ERROR: Node {node} does not exist in the scene, skipping")
            duplicate_results["error_count"] += 1
            continue
        
        # Check if it's a left side node
        if node not in left_nodes:
            print(f"💤 Skipping: {node} is not identified as a left side node")
            duplicate_results["skipped_count"] += 1
            continue
        
        # Check if we have a mirror mapping for this node
        if node not in mirrored_node_mapping:
            print(f"❌ ERROR: No mirror mapping found for {node}, skipping")
            duplicate_results["error_count"] += 1
            continue
        
        # Get the new name from the mirrored mapping
        new_name = mirrored_node_mapping[node]
        
        # Check if the target already exists
        if cmds.objExists(new_name):
            print(f"💤 Node {new_name} already exists, skipping duplication of {node}")
            duplicate_results["already_exists"] += 1
            already_duplicated.add(node)
            continue
            
        print(f"🪞 Using mirrored node mapping: {node} → {new_name}")
        
        # Try to duplicate the node WITHOUT its children
        try:
            # Clear selection first
            cmds.select(clear=True)
            
            # Select the node
            cmds.select(node, replace=True)
            
            # Duplicate WITHOUT children using parentOnly flag
            # This prevents duplicating the entire hierarchy
            result = cmds.duplicate(parentOnly=True, name=new_name)
            
            if not result or len(result) == 0:
                raise RuntimeError(f"Duplicate command returned empty result")
            
            duplicated = result[0]
            
            # Ensure we have the exact name we want
            if duplicated != new_name:
                duplicated = cmds.rename(duplicated, new_name)
            
            print(f"🐑 Duplicated {node} to {duplicated}")
            already_duplicated.add(node)
            
            # Add original node to mirror_input set
            try:
                cmds.sets(node, add="mirror_input")
                print(f"  ✅ Added {node} to mirror_input set")
            except Exception as e:
                print(f"  ⚠️ Warning: Could not add {node} to mirror_input set: {str(e)}")
            
            # Handle set membership - Remove from L-side sets
            sets_to_check = cmds.listSets(object=duplicated) or []
            for set_name in sets_to_check:
                if set_name in ["NodeGroup_Leg_L", "QS_Joints_DEF_Leg_L", "NodeGroup_Foot_L", "mirror_input"]:
                    try:
                        cmds.sets(duplicated, remove=set_name)
                        print(f"🧼 Removed {duplicated} from set: {set_name}")
                    except:
                        pass
            
            # Add to mirror_output set
            try:
                cmds.sets(duplicated, add="mirror_output")
            except Exception as e:
                print(f"❌ Warning: Could not add {duplicated} to mirror_output set: {str(e)}")
            
            duplicate_results["success_count"] += 1
            duplicate_results["duplicated_nodes"].append({
                "source": node,
                "duplicate": duplicated,
                "node_type": cmds.nodeType(duplicated)
            })
            
        except Exception as e:
            print(f"❌ ERROR: Failed to duplicate {node}: {str(e)}")
            duplicate_results["error_count"] += 1
    
    # Clear selection after processing
    cmds.select(clear=True)
    
    # Print summary
    print(f"\nDAG Nodes Without Shapes Duplication Summary:")
    print(f"- Nodes processed: {len(nodes_to_duplicate)}")
    print(f"- Successfully duplicated: {duplicate_results['success_count']}")
    print(f"- Already existed: {duplicate_results['already_exists']}")
    print(f"- Skipped (not L-side): {duplicate_results['skipped_count']}")
    print(f"- Errors: {duplicate_results['error_count']}")
    
    return duplicate_results

def run():
    """Run the DAG nodes without shapes duplication process."""
    return duplicate_dag_nodes_without_shapes()

if __name__ == "__main__":
    run()