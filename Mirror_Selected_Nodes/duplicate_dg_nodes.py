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
    mirrored_nodes_path = PATHS.get_data_file_path("mirrored_hierarchy_data.json")
    
    if not os.path.exists(dg_nodes_path) or not os.path.exists(node_side_data_path):
        cmds.error("Required JSON data files not found!")
        return False
        
    # Load the data
    dg_data = load_json_data(dg_nodes_path)
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
    
    # Extract DG nodes
    dg_nodes_to_duplicate = []
    if "nodes" in dg_data:
        dg_nodes_to_duplicate = [n["node_name"] for n in dg_data["nodes"]]
    
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
    
    # Process each DG node individually
    for node in dg_nodes_to_duplicate:
        # Check if the node exists
        if not cmds.objExists(node):
            print(f"Warning: Node {node} does not exist in the scene, skipping")
            duplicate_results["error_count"] += 1
            continue
        
        # Check if it's a left side node
        if node not in left_nodes:
            print(f"Node {node} is not identified as a left side node, skipping")
            continue
        
        # Get the new name from the mirrored mapping if available, otherwise use pattern replacement
        if node in mirrored_node_mapping:
            new_name = mirrored_node_mapping[node]
            print(f"Using mirrored node mapping: {node} → {new_name}")
        else:
            # Fall back to pattern replacement
            pattern = left_nodes[node]
            if pattern == "_L":
                new_name = node.replace("_L", "_R")
            else:  # pattern is "_L_"
                new_name = node.replace("_L_", "_R_")
            print(f"No mapping found, using pattern replacement: {node} → {new_name}")
        
        # If the node already exists, delete it first
        if cmds.objExists(new_name):
            print(f"Node {new_name} already exists - deleting first")
            try:
                cmds.delete(new_name)
            except Exception as e:
                print(f"Error deleting existing node {new_name}: {str(e)}")
                duplicate_results["error_count"] += 1
                continue
        
        # Add to input set before duplication
        try:
            cmds.sets(node, add="mirror_input")
        except Exception as e:
            print(f"Warning: Could not add {node} to mirror_input set: {str(e)}")
        
        # Get the node type for reference
        node_type = cmds.nodeType(node)
        
        try:
            # Use direct duplication with the -rr flag (do not retain references)
            # This will create a duplicate without maintaining connections
            cmds.select(node, replace=True)
            duplicated_nodes = cmds.duplicate(
                node,
                name=new_name,
                parentOnly=True,
                upstreamNodes=False,
                inputConnections=False,
                returnRootsOnly=True
                )
            duplicated = duplicated_nodes[0]
            
            # Rename the duplicated node
            duplicated = cmds.rename(duplicated, new_name)
            print(f"Duplicated {node_type} node: {node} to {duplicated}")
            
            # Verify the result
            if not cmds.objExists(duplicated):
                print(f"Error: Failed to create {duplicated}")
                duplicate_results["error_count"] += 1
                continue
            
            # Add to output set
            try:
                cmds.sets(duplicated, add="mirror_output")
            except Exception as e:
                print(f"Warning: Could not add {duplicated} to mirror_output set: {str(e)}")
            
            duplicate_results["success_count"] += 1
            duplicate_results["duplicated_nodes"].append({
                "source": node,
                "duplicate": duplicated
            })
            
        except Exception as e:
            print(f"Error duplicating {node}: {str(e)}")
            duplicate_results["error_count"] += 1
            
            # If direct duplication failed, fall back to createNode as a last resort
            try:
                print(f"Attempting fallback method for {node}...")
                duplicated = cmds.createNode(node_type, name=new_name)
                
                # Copy attributes
                attrs = cmds.listAttr(node, keyable=True) or []
                attrs.extend(cmds.listAttr(node, keyable=False, settable=True) or [])
                
                for attr in attrs:
                    if attr not in ["message"]:
                        if (cmds.attributeQuery(attr, node=node, exists=True) and 
                            cmds.attributeQuery(attr, node=duplicated, exists=True)):
                            try:
                                value = cmds.getAttr(f"{node}.{attr}")
                                cmds.setAttr(f"{duplicated}.{attr}", value)
                            except:
                                pass
                
                print(f"Created new {node_type} node: {duplicated}")
                
                # Add to output set
                try:
                    cmds.sets(duplicated, add="mirror_output")
                except Exception as fallback_error:
                    print(f"Warning: Could not add {duplicated} to mirror_output set: {str(fallback_error)}")
                
                duplicate_results["success_count"] += 1
                duplicate_results["duplicated_nodes"].append({
                    "source": node,
                    "duplicate": duplicated,
                    "method": "fallback_createNode"
                })
                
            except Exception as fallback_error:
                print(f"Fallback method also failed for {node}: {str(fallback_error)}")
                duplicate_results["error_count"] += 1
    
    # Print summary
    print(f"\nDG Node Duplication Summary:")
    print(f"- Nodes processed: {len(dg_nodes_to_duplicate)}")
    print(f"- Successfully duplicated: {duplicate_results['success_count']}")
    print(f"- Errors: {duplicate_results['error_count']}")
    
    return duplicate_results

def run():
    """Run the DG nodes duplication process."""
    return duplicate_dg_nodes()

# Only run this code if the script is executed directly (not imported)
if __name__ == "__main__":
    run()