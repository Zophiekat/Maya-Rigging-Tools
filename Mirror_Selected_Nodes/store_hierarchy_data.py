import json
import os
from maya import cmds

# Import the global paths
from global_paths import PATHS
import filter_utils


def get_node_hierarchy_info(node):
    """Get hierarchy information for a given node."""
    # Get the full DAG path
    full_dag_path = cmds.ls(node, long=True)[0]
    
    # Get parent (could be None if it's a root)
    parent = cmds.listRelatives(node, parent=True, fullPath=True)
    parent_name = None
    if parent:
        # Get just the node name without path
        parent_name = parent[0].split('|')[-1]
    
    # Get children
    children = cmds.listRelatives(node, children=True, fullPath=True)
    children_names = []
    if children:
        # Get just the node names without paths
        children_names = [child.split('|')[-1] for child in children]
    
    return {
        'node_name': node,
        'parent': parent_name,
        'children': children_names,
        'full_dag_path': full_dag_path,
        'children_count': len(children_names),
        'parent_count': 1 if parent_name else 0
    }


def save_hierarchy_to_json(nodes, output_file=None):
    """Save hierarchy information to JSON file."""
    # Use default path from global paths if none provided
    if output_file is None:
        output_file = PATHS.get_data_file_path("hierarchy_data.json")
    
    # Filter out nodes that should be ignored
    filtered_nodes = filter_utils.filter_nodes(nodes)
    
    hierarchy_data = {}
    
    for node in filtered_nodes:
        # Use the node name as the key
        hierarchy_data[node] = get_node_hierarchy_info(node)
    
    # Make sure the data directory exists
    data_dir = os.path.dirname(output_file)
    if not os.path.exists(data_dir):
        os.makedirs(data_dir)
    
    with open(output_file, 'w') as f:
        json.dump(hierarchy_data, f, indent=4)
    
    print(f"Hierarchy data saved to {output_file}")
    return hierarchy_data


def store_selected_hierarchy():
    """Store hierarchy data for currently selected nodes."""
    selected_dag_nodes = cmds.ls(selection=True, dag=True)
    
    if selected_dag_nodes:
        return save_hierarchy_to_json(selected_dag_nodes)
    else:
        print("No DAG nodes selected.")
        return {}


# Only run this code if the script is executed directly (not imported)
if __name__ == "__main__":
    store_selected_hierarchy()