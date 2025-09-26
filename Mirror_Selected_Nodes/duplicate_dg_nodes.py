import json
import os
from maya import cmds

# Import the global paths
from global_paths import PATHS

def load_json_data(file_path):
    """Load data from a JSON file."""
    with open(file_path, 'r') as file:
        return json.load(file)

def duplicate_dg_nodes():
    """Duplicate DG nodes (non-DAG nodes like utilities) from L to R side."""
    # Load the necessary JSON data files
    dg_nodes_path = PATHS.get_data_file_path("dg_nodes_data.json")
    node_side_data_path = PATHS.get_data_file_path("node_side_data.json")
    mirror_side_data_path = PATHS.get_data_file_path("mirror_side_data.json")
    
    if not os.path.exists(dg_nodes_path) or not os.path.exists(node_side_data_path):
        cmds.error("Required JSON data files not found!")
        return False
        
    # Load the data
    dg_nodes_data = load_json_data(dg_nodes_path)
    side_data = load_json_data(node_side_data_path)
    
    # Load mirror side data
    mirrored_node_mapping = {}
    if os.path.exists(mirror_side_data_path):
        print(f"🪞 Using mirror side data from: {mirror_side_data_path}")
        mirror_data = load_json_data(mirror_side_data_path)
        mirrored_node_mapping = mirror_data.get("mirror_mapping", {})
    else:
        cmds.error("❌ Mirror side data not found! Run create_mirror_side_data.py first")
        return False
    
    # Extract DG nodes - handle different data structures
    dg_nodes = []
    if "dg_nodes" in dg_nodes_data:
        raw_nodes = dg_nodes_data["dg_nodes"]
        # Check if it's a list of dictionaries or strings
        if raw_nodes and isinstance(raw_nodes[0], dict):
            # Extract node names from dictionaries
            dg_nodes = [node["node_name"] for node in raw_nodes if "node_name" in node]
        else:
            # It's already a list of strings
            dg_nodes = raw_nodes
    elif "nodes" in dg_nodes_data:
        raw_nodes = dg_nodes_data["nodes"]
        if raw_nodes and isinstance(raw_nodes[0], dict):
            dg_nodes = [node["node_name"] for node in raw_nodes if "node_name" in node]
        else:
            dg_nodes = raw_nodes
    
    print(f"☘️ Found {len(dg_nodes)} DG nodes to process")
    
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
        "duplicated_nodes": []
    }
    
    # Store the current selection to restore later
    original_selection = cmds.ls(selection=True)
    
    # Process each DG node
    for node in dg_nodes:
        # Check if the node exists
        if not cmds.objExists(node):
            print(f"ERROR: Node {node} does not exist in the scene, skipping")
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
        
        # Check if the node already exists
        if cmds.objExists(new_name):
            print(f"Node {new_name} already exists, skipping")
            duplicate_results["skipped_count"] += 1
            continue
        
        print(f"🪞 Using mirror side mapping: {node} → {new_name}")
        
        # Try to duplicate the node
        try:
            # Get the node type
            node_type = cmds.nodeType(node)
            
            # Clear selection first
            cmds.select(clear=True)
            
            # Select the DG node
            cmds.select(node, replace=True)
            
            # Verify selection
            selected_nodes = cmds.ls(selection=True)
            if not selected_nodes:
                raise RuntimeError(f"❌ Failed to select node {node}")
            
            print(f"🖱️ Selected Node: {selected_nodes[0]}")
            
            # Duplicate the node with all the important flags
            # For DG nodes, we need to select them first
            duplicated_nodes = cmds.duplicate(
                upstreamNodes=False,  # Don't duplicate upstream nodes
                inputConnections=False,  # Don't maintain input connections
                renameChildren=False  # Don't rename children
            )
            
            if not duplicated_nodes:
                raise RuntimeError("❌ Duplicate command returned no results")
            else:
                print(f"🐑 Duplicated Node: {duplicated_nodes}")
            
            duplicated = duplicated_nodes[0]
            
            # Rename to the desired name
            if duplicated != new_name:
                duplicated = cmds.rename(duplicated, new_name)
            
            print(f"🐑 Duplicated DG node: {node} → {duplicated} (type: {node_type})")
            
            # Add original node to mirror_input set
            try:
                cmds.sets(node, add="mirror_input")
                print(f"  ✅ Added {node} to mirror_input set")
            except Exception as e:
                print(f"  ⚠️ Warning: Could not add {node} to mirror_input set: {str(e)}")
            
            # Add duplicated node to mirror_output set
            try:
                cmds.sets(duplicated, add="mirror_output")
                print(f"  ✅ Added {duplicated} to mirror_output set")
            except Exception as e:
                print(f"  ⚠️ Warning: Could not add {duplicated} to mirror_output set: {str(e)}")
            
            duplicate_results["success_count"] += 1
            duplicate_results["duplicated_nodes"].append({
                "source": node,
                "duplicate": duplicated,
                "node_type": node_type
            })
            
        except Exception as e:
            print(f"ERROR: Failed to duplicate DG node {node}: {str(e)}")
            duplicate_results["error_count"] += 1
    
    # Print summary
    print(f"\nDG Node Duplication Summary:")
    print(f"- Nodes processed: {len(dg_nodes)}")
    print(f"- Successfully duplicated: {duplicate_results['success_count']}")
    print(f"- Skipped (not L-side or already exists): {duplicate_results['skipped_count']}")
    print(f"- Errors: {duplicate_results['error_count']}")
    
    return duplicate_results

def run():
    """Run the DG node duplication process."""
    return duplicate_dg_nodes()

if __name__ == "__main__":
    run()