
import json
import os
import importlib
from maya import cmds

# Import the global paths
from global_paths import PATHS
import store_hierarchy_data  # Import the module

print(f"Loading mirror_selected_nodes module from: {__file__}")

def run():
    """Main function to mirror selected nodes."""
    all_selected_nodes_list = cmds.ls(selection=True)
    print(f"all_selected_nodes_list: {all_selected_nodes_list}")

    selected_dag_nodes_list = cmds.ls(selection=True, dag=True)
    print(f"selected_dag_nodes_list: {selected_dag_nodes_list}")

    selected_util_nodes_list = [item for item in all_selected_nodes_list if item not in selected_dag_nodes_list]
    print(f"selected_util_nodes_list: {selected_util_nodes_list}")

    # Use the imported module with custom data path
    hierarchy_data_path = PATHS.get_data_file_path("hierarchy_data.json")
    hierarchy_data = store_hierarchy_data.save_hierarchy_to_json(selected_dag_nodes_list, hierarchy_data_path)

    # --- MIRRORING WORKFLOW ---
    # 1. Duplicate DAG nodes without shapes
    import duplicate_dag_nodes_without_shapes
    importlib.reload(duplicate_dag_nodes_without_shapes)
    print("Duplicating DAG nodes without shapes...")
    duplicate_dag_nodes_without_shapes.run()

    # 2. Duplicate transforms with shapes
    import duplicate_transforms_with_shapes
    importlib.reload(duplicate_transforms_with_shapes)
    print("Duplicating transforms with shapes...")
    duplicate_transforms_with_shapes.run()

    # 3. Duplicate DG nodes
    import duplicate_dg_nodes
    importlib.reload(duplicate_dg_nodes)
    print("Duplicating DG nodes...")
    duplicate_dg_nodes.run()

    # 4. Parent DAG nodes without shapes
    import parent_dag_nodes_without_shapes
    importlib.reload(parent_dag_nodes_without_shapes)
    print("Parenting DAG nodes without shapes...")
    parent_dag_nodes_without_shapes.run()

    # 5. Parent transforms with shapes
    import parent_transforms_with_shapes
    importlib.reload(parent_transforms_with_shapes)
    print("Parenting transforms with shapes...")
    parent_transforms_with_shapes.run()

    print("Mirroring workflow complete.")
    return True

# If the script is run directly, call run()
if __name__ == "__main__":
    run()