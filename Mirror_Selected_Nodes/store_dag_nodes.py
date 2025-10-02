import json
import os
from maya import cmds

# Import the global paths
from global_paths import PATHS
import filter_utils

# Simplified version - we only need node names now
def get_dag_node_info(node):
    """Get simplified node information (just the name)."""
    return node
    
    # Get shape nodes
    shapes = []
    shapes_data = {}
    
    try:
        shape_nodes = cmds.listRelatives(node, shapes=True, fullPath=True) or []
        
        for shape in shape_nodes:
            shape_type = cmds.nodeType(shape)
            shape_name = shape.split('|')[-1]
            shapes.append(shape_name)
            
            # Get shape-specific data based on shape type
            shape_specific_data = {}
            
            if shape_type == "mesh":
                # Mesh data
                vertex_count = cmds.polyEvaluate(shape, vertex=True)
                face_count = cmds.polyEvaluate(shape, face=True)
                
                shape_specific_data = {
                    "vertex_count": vertex_count,
                    "face_count": face_count
                }
            elif shape_type == "nurbsCurve":
                # NURBS curve data
                spans = cmds.getAttr(f"{shape}.spans")
                degree = cmds.getAttr(f"{shape}.degree")
                form = cmds.getAttr(f"{shape}.form")
                
                shape_specific_data = {
                    "spans": spans,
                    "degree": degree,
                    "form": form
                }
            
            # Store data for this shape
            shapes_data[shape_name] = {
                "shape_type": shape_type,
                "full_path": shape,
                "specific_data": shape_specific_data
            }
    except Exception as e:
        pass
    
    # Get parent and children
    parent = None
    children = []
    
    try:
        parent_nodes = cmds.listRelatives(node, parent=True, fullPath=True)
        if parent_nodes:
            parent = parent_nodes[0]
            
        children_nodes = cmds.listRelatives(node, children=True, fullPath=True, type="transform") or []
        children = children_nodes
    except Exception as e:
        pass
    
    # Build the complete node info dictionary
    node_info = {
        "node_name": node,
        "node_type": node_type,
        "short_name": short_name,
        "full_path": full_path,
        "parent": parent,
        "children": children,
        "children_count": len(children),
        "shape_nodes": shapes,
        "shape_count": len(shapes),
        "shapes_data": shapes_data,
        "transform_data": transform_data,
        "has_parent": parent is not None,
        "has_shapes": len(shapes) > 0
    }
    
    return node_info

def save_dag_nodes_to_json(output_file=None):
    """Save simplified list of selected DAG nodes to JSON."""
    # Get all selected DAG nodes
    all_selected_dag_nodes = cmds.ls(selection=True, dag=True)
    
    if not all_selected_dag_nodes:
        print("No DAG nodes selected.")
        return []
    
    # Define default output file path if none provided
    if output_file is None:
        output_file = PATHS.get_data_file_path("dag_nodes_data.json")
    
    # Make sure the data directory exists
    data_dir = os.path.dirname(output_file)
    if not os.path.exists(data_dir):
        os.makedirs(data_dir)
    
    # Filter out nodes that should be ignored
    filtered_nodes = filter_utils.filter_nodes(all_selected_dag_nodes)
    
    # Store nodes with their types
    dag_nodes = []
    node_types_count = {}
    
    for node in filtered_nodes:
        node_type = cmds.nodeType(node)
        
        # Increment the count for this node type
        if node_type in node_types_count:
            node_types_count[node_type] += 1
        else:
            node_types_count[node_type] = 1
            
        # Store node name and its type
        dag_nodes.append({
            "node_name": node,
            "node_type": node_type
        })
    
    # Create the data structure with summary at the top
    output_data = {
        "summary": {
            "total_nodes": len(dag_nodes),
            "node_types": node_types_count
        },
        "nodes": dag_nodes
    }
    
    # Write to JSON file
    with open(output_file, 'w') as f:
        json.dump(output_data, f, indent=4)
    
    print(f"DAG nodes data saved to {output_file}")
    print(f"Summary: {len(dag_nodes)} DAG nodes processed")
    
    return output_data

def store_dag_nodes():
    """Store data about currently selected DAG nodes."""
    return save_dag_nodes_to_json()

def run():
    """Run the DAG nodes storage directly."""
    return store_dag_nodes()

# Only run this code if the script is executed directly (not imported)
if __name__ == "__main__":
    run()