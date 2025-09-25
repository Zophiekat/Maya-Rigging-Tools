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
    """Parent duplicated R side DAG nodes based on L side hierarchy."""
    # Load the necessary JSON data files
    hierarchy_path = PATHS.get_data_file_path("hierarchy_data.json")
    dag_nodes_path = PATHS.get_data_file_path("dag_nodes_without_shapes_data.json")
    
    if not os.path.exists(hierarchy_path) or not os.path.exists(dag_nodes_path):
        cmds.error("Required JSON data files not found!")
        return False
    
    # Load the data
    hierarchy_data = load_json_data(hierarchy_path)
    dag_nodes_data = load_json_data(dag_nodes_path)
    
    # Create a mapping of node names to their parent names
    # We'll create two maps - one with full paths and one with short names
    node_to_parent = {}
    short_name_to_parent = {}
    
    # Process hierarchy data to build parent maps
    for node_name, node_info in hierarchy_data.items():
        if "parent" in node_info and node_info["parent"]:
            node_to_parent[node_name] = node_info["parent"]
            
            # Also add a short name mapping
            short_node = node_name.split('|')[-1]
            short_parent = node_info["parent"].split('|')[-1] if node_info["parent"] else ""
            short_name_to_parent[short_node] = short_parent
    
    # Print some debug info about the hierarchy data
    print(f"Hierarchy data contains {len(hierarchy_data)} nodes")
    print(f"Short name mapping contains {len(short_name_to_parent)} nodes")
    
    # Extract R side nodes from our dag_nodes data
    r_side_nodes = []
    for node in dag_nodes_data["nodes"]:
        node_name = node["node_name"]
        if "_R" in node_name or "_R_" in node_name:
            r_side_nodes.append(node_name)
    
    print(f"Found {len(r_side_nodes)} R-side nodes to process for parenting")
    
    # Track results
    parenting_results = {
        "success_count": 0,
        "error_count": 0,
        "skipped_count": 0,
        "parented_nodes": []
    }
    
    # Process each R side node
    for r_node in r_side_nodes:
        # Find the corresponding L side node name
        l_node = None
        if "_R_" in r_node:
            l_node = r_node.replace("_R_", "_L_")
        elif "_R" in r_node:
            l_node = r_node.replace("_R", "_L")
        
        if not l_node:
            print(f"Cannot determine L side equivalent for {r_node}, skipping")
            parenting_results["skipped_count"] += 1
            continue
        
        # Try to find the parent using both full path and short name
        l_parent = None
        short_l_node = l_node.split('|')[-1]
        
        # First try the direct lookup
        if l_node in node_to_parent:
            l_parent = node_to_parent[l_node]
        # Then try the short name lookup
        elif short_l_node in short_name_to_parent:
            l_parent = short_name_to_parent[short_l_node]
        
        if l_parent is None:
            print(f"Cannot find hierarchy info for {l_node} (short name: {short_l_node}), skipping")
            parenting_results["skipped_count"] += 1
            continue
        
        # Skip if no parent (root node)
        if not l_parent:
            print(f"Node {l_node} has no parent (it's a root node), skipping {r_node}")
            parenting_results["skipped_count"] += 1
            continue
        
        # Convert to R side parent name
        r_parent = None
        if "_L_" in l_parent:
            r_parent = l_parent.replace("_L_", "_R_")
        elif "_L" in l_parent:
            r_parent = l_parent.replace("_L", "_R")
        else:
            # If parent doesn't have L/R designation, use as is
            r_parent = l_parent
        
        # Get short name for the parent
        short_r_parent = r_parent.split('|')[-1]
        
        # Check if both the node and parent exist in the scene
        if not cmds.objExists(r_node):
            print(f"R side node {r_node} does not exist in scene, skipping")
            parenting_results["error_count"] += 1
            continue
            
        if not cmds.objExists(short_r_parent):
            print(f"R side parent {short_r_parent} does not exist in scene, skipping {r_node}")
            parenting_results["error_count"] += 1
            continue
        
        # Perform the parenting
        try:
            print(f"Parenting {r_node} to {short_r_parent}")
            cmds.parent(r_node, short_r_parent)
            parenting_results["success_count"] += 1
            parenting_results["parented_nodes"].append({
                "node": r_node,
                "parent": short_r_parent,
                "l_node": l_node,
                "l_parent": l_parent
            })
        except Exception as e:
            print(f"Error parenting {r_node} to {short_r_parent}: {str(e)}")
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