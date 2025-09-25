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
    """Duplicate DAG nodes without shapes from L to R side."""
    # Load the necessary JSON data files
    dag_nodes_without_shapes_path = PATHS.get_data_file_path("dag_nodes_without_shapes_data.json")
    node_side_data_path = PATHS.get_data_file_path("node_side_data.json")
    hierarchy_data_path = PATHS.get_data_file_path("hierarchy_data.json")
    
    if not os.path.exists(dag_nodes_without_shapes_path) or not os.path.exists(node_side_data_path):
        cmds.error("Required JSON data files not found!")
        return False
        
    # Load the data
    dag_data = load_json_data(dag_nodes_without_shapes_path)
    side_data = load_json_data(node_side_data_path)
    hierarchy_data = load_json_data(hierarchy_data_path) if os.path.exists(hierarchy_data_path) else {}
    
    # Extract the list of node names
    nodes_to_duplicate = []
    for node in dag_data["nodes"]:
        nodes_to_duplicate.append(node["node_name"])
    
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
    
    # Process each node individually
    for node in nodes_to_duplicate:
        # Check if the node exists
        if not cmds.objExists(node):
            print(f"Warning: Node {node} does not exist in the scene, skipping")
            duplicate_results["error_count"] += 1
            continue
        
        # Check if it's a left side node
        if node not in left_nodes:
            print(f"Node {node} is not identified as a left side node, skipping")
            continue
        
        # Determine the pattern (_L or _L_)
        pattern = left_nodes[node]
        
        # Create the new name
        if pattern == "_L":
            new_name = node.replace("_L", "_R")
        else:  # pattern is "_L_"
            new_name = node.replace("_L_", "_R_")
        
        # If the node already exists, delete it first
        if cmds.objExists(new_name):
            print(f"Node {new_name} already exists - deleting first")
            try:
                cmds.delete(new_name)
            except Exception as e:
                print(f"Error deleting existing node {new_name}: {str(e)}")
                continue
        
        # Add to input set before duplication
        cmds.sets(node, add="mirror_input")
        
        # Use hierarchy data if available, otherwise query Maya directly
        parent_path = None
        if node in hierarchy_data and "parent" in hierarchy_data[node]:
            parent_path = hierarchy_data[node]["parent"]
            print(f"Using parent from hierarchy data for {node}: {parent_path}")
        else:
            parent = cmds.listRelatives(node, parent=True)
            parent_path = parent[0] if parent else None
            print(f"Parent not found in hierarchy data, queried directly: {parent_path}")
        
        # Temporarily unparent if needed to avoid parenting issues
        if parent_path and cmds.objExists(parent_path):
            cmds.parent(node, world=True)
        
        # Duplicate the node
        try:
            duplicated = cmds.duplicate(node, name=new_name, parentOnly=True)[0]
            print(f"Duplicated {node} to {duplicated}")
            
            # Restore original parent for source node
            if parent_path and cmds.objExists(parent_path):
                cmds.parent(node, parent_path)
            
            # Verify the result
            if not cmds.objExists(duplicated):
                print(f"Error: Failed to create {duplicated}")
                duplicate_results["error_count"] += 1
                continue
            
            # Remove from all object sets
            all_sets = cmds.listSets(object=duplicated) or []
            for obj_set in all_sets:
                try:
                    cmds.sets(duplicated, remove=obj_set)
                    print(f"  Removed {duplicated} from set: {obj_set}")
                except Exception as e:
                    print(f"  Error removing from set {obj_set}: {str(e)}")
            
            # Add to output set
            cmds.sets(duplicated, add="mirror_output")
            
            duplicate_results["success_count"] += 1
            duplicate_results["duplicated_nodes"].append({
                "source": node,
                "duplicate": duplicated,
                "parent_in_hierarchy_data": parent_path
            })
            
        except Exception as e:
            print(f"Error duplicating {node}: {str(e)}")
            duplicate_results["error_count"] += 1
            
            # If we unparented the source node, restore its parent
            if parent_path and cmds.objExists(node) and cmds.objExists(parent_path):
                try:
                    cmds.parent(node, parent_path)
                except Exception as e:
                    print(f"Failed to restore parent for {node}: {str(e)}")
    
    # Print summary
    print(f"\nDuplication Summary:")
    print(f"- Nodes processed: {len(nodes_to_duplicate)}")
    print(f"- Successfully duplicated: {duplicate_results['success_count']}")
    print(f"- Errors: {duplicate_results['error_count']}")
    
    return duplicate_results

def run():
    """Run the DAG nodes without shapes duplication process."""
    return duplicate_dag_nodes_without_shapes()

# Only run this code if the script is executed directly (not imported)
if __name__ == "__main__":
    run()