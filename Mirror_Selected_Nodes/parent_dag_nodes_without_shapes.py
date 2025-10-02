import json
import os
from maya import cmds

# Import the global paths
from global_paths import PATHS

def load_json_data(file_path):
    """Load data from a JSON file."""
    with open(file_path, 'r') as file:
        return json.load(file)

def parent_dag_nodes_without_shapes():
    """Parent duplicated R side DAG nodes based on mirrored hierarchy data."""
    # Load the necessary JSON data files
    mirrored_hierarchy_path = PATHS.get_data_file_path("mirrored_hierarchy_data.json")
    dag_nodes_path = PATHS.get_data_file_path("dag_nodes_without_shapes_data.json")
    
    if not os.path.exists(mirrored_hierarchy_path) or not os.path.exists(dag_nodes_path):
        cmds.error("❌ Required JSON data files not found!")
        return False
    
    # Load the data
    mirrored_hierarchy_data = load_json_data(mirrored_hierarchy_path)
    dag_nodes_data = load_json_data(dag_nodes_path)
    
    print(f"🪞 Mirrored hierarchy data contains {len(mirrored_hierarchy_data)} nodes")
    
    # Extract R side nodes from our dag_nodes data
    r_side_nodes = []
    for node in dag_nodes_data["nodes"]:
        node_name = node["node_name"]
        # Replace L with R to find the mirrored node names
        if "_L_" in node_name:
            r_node = node_name.replace("_L_", "_R_")
            if cmds.objExists(r_node):
                r_side_nodes.append(r_node)
        elif "_L" in node_name:
            r_node = node_name.replace("_L", "_R")
            if cmds.objExists(r_node):
                r_side_nodes.append(r_node)
    
    print(f"☘️ Found {len(r_side_nodes)} R-side nodes to process for parenting")
    
    # Track results
    parenting_results = {
        "success_count": 0,
        "error_count": 0,
        "skipped_count": 0,
        "parented_nodes": []
    }
    
    # Process each R side node
    for r_node in r_side_nodes:
        # Find the parent directly from mirrored hierarchy data
        if r_node not in mirrored_hierarchy_data:
            print(f"❓ Node {r_node} not found in mirrored hierarchy data, skipping")
            parenting_results["skipped_count"] += 1
            continue
        
        # Get parent from the mirrored hierarchy - safely handle different data structures
        node_data = mirrored_hierarchy_data[r_node]
        r_parent = None
        
        if isinstance(node_data, dict) and "parent" in node_data:
            r_parent = node_data["parent"]
        else:
            print(f"❌ Cannot determine parent for {r_node}, unexpected data structure")
            parenting_results["skipped_count"] += 1
            continue
        
        if not r_parent:
            print(f"❓ Node {r_node} has no parent in mirrored hierarchy (it's a root node), skipping")
            parenting_results["skipped_count"] += 1
            continue
        
        # Check if both the node and parent exist in the scene
        if not cmds.objExists(r_node):
            print(f"❌ R side node {r_node} does not exist in scene, skipping")
            parenting_results["error_count"] += 1
            continue
            
        if not cmds.objExists(r_parent):
            print(f"❌ R side parent {r_parent} does not exist in scene, skipping {r_node}")
            parenting_results["error_count"] += 1
            continue
        
        # Perform the parenting
        try:
            print(f"👭 Parenting {r_node} to {r_parent}")
            cmds.parent(r_node, r_parent)
            parenting_results["success_count"] += 1
            parenting_results["parented_nodes"].append({
                "node": r_node,
                "parent": r_parent
            })
        except Exception as e:
            print(f"❌ Error parenting {r_node} to {r_parent}: {str(e)}")
            parenting_results["error_count"] += 1
    
    # Print summary
    print(f"\nDAG Nodes Parenting Summary:")
    print(f"- Nodes processed: {len(r_side_nodes)}")
    print(f"- Successfully parented: {parenting_results['success_count']}")
    print(f"- Skipped (no hierarchy info): {parenting_results['skipped_count']}")
    print(f"- Errors: {parenting_results['error_count']}")
    
    return parenting_results

def run():
    """Run the DAG nodes parenting process."""
    return parent_dag_nodes_without_shapes()

# Only run this code if the script is executed directly (not imported)
if __name__ == "__main__":
    run()