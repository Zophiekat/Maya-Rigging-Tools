import json
import os
from maya import cmds

# Import the global paths
from global_paths import PATHS

def should_ignore_node(node_name):
    """
    Check if a node should be ignored based on the ignored_nodes.json configuration.
    
    Args:
        node_name (str): Name of the node to check
        
    Returns:
        bool: True if the node should be ignored, False otherwise
    """
    # Path to the ignored_nodes.json file
    ignored_nodes_path = os.path.join(PATHS.mirror_selected_nodes_dir, "ignored_nodes.json")
    
    # If the file doesn't exist, don't ignore any nodes
    if not os.path.exists(ignored_nodes_path):
        return False
    
    # Load the ignored nodes configuration
    with open(ignored_nodes_path, 'r') as f:
        ignored_config = json.load(f)
    
    # Get the node type
    try:
        node_type = cmds.nodeType(node_name)
    except:
        node_type = "unknown"
    
    # Check if the node type is in the ignored list
    if node_type in ignored_config.get("ignored_node_types", []):
        return True
    
    # Check if the node name contains any of the ignored substrings
    for substring in ignored_config.get("ignored_name_substrings", []):
        if substring in node_name:
            return True
    
    # If we get here, the node should not be ignored
    return False


def filter_nodes(nodes):
    """
    Filter a list of nodes, removing any that should be ignored.
    
    Args:
        nodes (list): List of node names to filter
        
    Returns:
        list: Filtered list of nodes
    """
    filtered_nodes = []
    ignored_count = 0
    
    for node in nodes:
        if not should_ignore_node(node):
            filtered_nodes.append(node)
        else:
            ignored_count += 1
    
    if ignored_count > 0:
        print(f"Filtered out {ignored_count} nodes based on ignore rules")
    
    return filtered_nodes


def should_ignore_connection(source, destination):
    """
    Check if a connection between two nodes should be ignored.
    
    Args:
        source (str): Source plug name (node.attribute)
        destination (str): Destination plug name (node.attribute)
        
    Returns:
        bool: True if the connection should be ignored, False otherwise
    """
    # Extract node names from the plugs
    source_node = source.split('.')[0]
    dest_node = destination.split('.')[0]
    
    # If either node should be ignored, ignore the connection
    return should_ignore_node(source_node) or should_ignore_node(dest_node)


# Example usage of these functions (for demonstration purposes)
if __name__ == "__main__":
    # Test with some example nodes
    test_nodes = cmds.ls(selection=True) or []
    
    if not test_nodes:
        print("No nodes selected for testing")
    else:
        for node in test_nodes:
            if should_ignore_node(node):
                print(f"Node would be ignored: {node}")
            else:
                print(f"Node would be processed: {node}")