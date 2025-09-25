import os
import sys
import importlib
import traceback
from maya import cmds

# Hardcoded absolute path - this ensures Maya can always find our modules
SCRIPT_DIR = "/Users/zophiekat/Github_Repositories/Maya-Rigging-Tools/Mirror_Selected_Nodes"

# Add script directory to Python path
if SCRIPT_DIR not in sys.path:
    sys.path.append(SCRIPT_DIR)
    print(f"Added {SCRIPT_DIR} to Python path")

# Import and reload all modules
from global_paths import PATHS
#
import archive_json_data
importlib.reload(archive_json_data)
#
import store_selected_nodes
importlib.reload(store_selected_nodes)
#
import store_dag_nodes
importlib.reload(store_dag_nodes)
#
import store_transforms_with_shapes_data
importlib.reload(store_transforms_with_shapes_data)
#
import store_dag_nodes_without_shapes
importlib.reload(store_dag_nodes_without_shapes)
#
import store_dg_nodes_data
importlib.reload(store_dg_nodes_data)
#
import store_node_side_data
importlib.reload(store_node_side_data)
#
import store_hierarchy_data
importlib.reload(store_hierarchy_data)
#
import create_mirror_hierarchy_data
importlib.reload(create_mirror_hierarchy_data)
#
import store_connection_data
importlib.reload(store_connection_data)
#
import create_mirror_connection_data
importlib.reload(create_mirror_connection_data)
#
import filter_utils
importlib.reload(filter_utils)
#
import mirror_selected_nodes
importlib.reload(mirror_selected_nodes)


def run_mirror_tool():
    """Main function to mirror selected nodes in Maya."""
    print("\n=== MIRROR SELECTED ===")
    
    # Archive existing JSON data
    print("Archiving existing JSON data...")
    archive_json_data.run()
    
    # Get selection before proceeding
    all_selected_nodes = cmds.ls(selection=True)
    
    if not all_selected_nodes:
        cmds.warning("No nodes selected. Please select nodes to mirror.")
        return False
    
    # Store basic node selection data first
    print("Storing selected nodes data...")
    selected_nodes_path = PATHS.get_data_file_path("selected_nodes_data.json")
    store_selected_nodes.save_selected_nodes_to_json(selected_nodes_path)
    
    # Store detailed DAG node data
    print("Storing DAG nodes data...")
    dag_nodes_path = PATHS.get_data_file_path("dag_nodes_data.json")
    store_dag_nodes.save_dag_nodes_to_json(dag_nodes_path)
    
    # Store transforms with shapes data
    print("Storing transforms with shapes data...")
    transforms_shapes_path = PATHS.get_data_file_path("transforms_with_shapes_data.json")
    store_transforms_with_shapes_data.save_transforms_with_shapes_to_json(transforms_shapes_path)
    
    # Store DAG nodes without shapes data
    print("Storing DAG nodes without shapes data...")
    no_shapes_path = PATHS.get_data_file_path("dag_nodes_without_shapes_data.json")
    store_dag_nodes_without_shapes.save_dag_nodes_without_shapes_to_json(no_shapes_path)
    
    # Store DG nodes data (non-DAG nodes)
    print("Storing DG nodes data...")
    dg_nodes_path = PATHS.get_data_file_path("dg_nodes_data.json")
    store_dg_nodes_data.save_dg_nodes_to_json(dg_nodes_path)
    
    # Store node side analysis data
    print("Analyzing node side designations...")
    node_side_path = PATHS.get_data_file_path("node_side_data.json")
    store_node_side_data.save_node_side_data_to_json(node_side_path)
    
    # Store hierarchy data
    print("Storing hierarchy data...")
    hierarchy_data_path = PATHS.get_data_file_path("hierarchy_data.json")
    store_hierarchy_data.save_hierarchy_to_json(
        cmds.ls(selection=True, dag=True), 
        hierarchy_data_path
    )
    
    # Create mirrored hierarchy data
    print("Creating mirrored hierarchy data...")
    create_mirror_hierarchy_data.run()  # Call the new module here
    
    # Store connection data
    print("Storing connection data...")
    connection_data_path = PATHS.get_data_file_path("connection_data.json")
    store_connection_data.save_connections_to_json(
        all_selected_nodes, 
        connection_data_path
    )
    
    # After these lines:
    connection_data_path = PATHS.get_data_file_path("connection_data.json")
    store_connection_data.save_connections_to_json(
        all_selected_nodes, 
        connection_data_path
    )

    print("Creating mirrored connection data...")
    create_mirror_connection_data.run()

    # Run the mirroring process
    print("Running mirror operation...")
    result = mirror_selected_nodes.run()

    print("=== MIRRORING COMPLETE ===\n")
    return result


def run():
    """Run the tool directly."""
    return run_mirror_tool()


# Only execute when run directly
if __name__ == "__main__":
    run()