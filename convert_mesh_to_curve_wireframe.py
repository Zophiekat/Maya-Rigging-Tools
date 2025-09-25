"""
Script: Mesh Wireframe to NURBS Curve
Author: GitHub Copilot
Date: September 19, 2025
Description: Converts a mesh wireframe (edges) into a single NURBS curve
"""

import maya.cmds as cmds
import maya.api.OpenMaya as om

def get_mesh_wireframe_path(mesh_name):
    """
    Get a path along the wireframe edges of a mesh
    
    Args:
        mesh_name (str): Name of the mesh object
        
    Returns:
        list: List of vertex positions as (x,y,z) tuples following the wireframe path
    """
    # Get the MFnMesh using the mesh name
    selection_list = om.MSelectionList()
    selection_list.add(mesh_name)
    dag_path = selection_list.getDagPath(0)
    mesh_fn = om.MFnMesh(dag_path)
    
    # Get the mesh data needed for edge traversal
    edge_count = mesh_fn.numEdges
    points = mesh_fn.getPoints(om.MSpace.kWorld)
    
    # Initialize data structures for edge traversal
    visited_edges = set()
    path_points = []
    
    # Start with the first edge and traverse connected edges
    edge_iterator = om.MItMeshEdge(dag_path)
    
    # Process all edges to create segments
    edge_segments = []
    
    # Reset to first edge
    edge_iterator.reset()
    
    # Create all segments first
    while not edge_iterator.isDone():
        edge_id = edge_iterator.index()
        
        # Get the vertices of this edge
        vert0 = edge_iterator.vertexId(0)
        vert1 = edge_iterator.vertexId(1)
        
        # Add the segment
        pos0 = points[vert0]
        pos1 = points[vert1]
        
        edge_segments.append([(pos0.x, pos0.y, pos0.z), (pos1.x, pos1.y, pos1.z)])
        
        # Move to next edge
        edge_iterator.next()
    
    # Now try to create a continuous path
    if not edge_segments:
        return []
    
    # Start with the first segment
    path_points = list(edge_segments[0])
    used_segments = {0}
    
    # Try to find connected segments to create a continuous path
    while len(used_segments) < len(edge_segments):
        current_end = path_points[-1]
        found_connection = False
        
        # Look for a segment that connects to the current end point
        for i, segment in enumerate(edge_segments):
            if i in used_segments:
                continue
                
            # Check if this segment connects to the current path
            if distance(current_end, segment[0]) < 0.0001:
                # Segment connects at start point
                path_points.append(segment[1])
                used_segments.add(i)
                found_connection = True
                break
            elif distance(current_end, segment[1]) < 0.0001:
                # Segment connects at end point
                path_points.append(segment[0])
                used_segments.add(i)
                found_connection = True
                break
        
        # If no connection found, add remaining segments
        if not found_connection:
            for i, segment in enumerate(edge_segments):
                if i not in used_segments:
                    # Add a visual break (small gap) before starting a new disconnected segment
                    path_points.extend(segment)
                    used_segments.add(i)
                    break
    
    return path_points

def distance(point1, point2):
    """Calculate distance between two points"""
    return sum((a - b) ** 2 for a, b in zip(point1, point2)) ** 0.5

def create_curve_from_wireframe_path(path_points, curve_name="meshWireframeCurve"):
    """
    Create an open NURBS curve from wireframe path points
    
    Args:
        path_points (list): List of (x,y,z) positions following wireframe path
        curve_name (str): Name of the resulting curve
        
    Returns:
        str: Name of the created curve
    """
    if not path_points:
        return None
        
    # For wireframe, linear degree=1 gives better edge representation
    degree = 1  # Linear curve for exact edge representation
    
    # Create the curve
    curve = cmds.curve(p=path_points, degree=degree, n=curve_name)
    
    return curve

def mesh_to_wireframe_curve():
    """
    Main function to convert selected mesh wireframe (edges) to an open NURBS curve
    """
    # Get selection
    selection = cmds.ls(sl=True)
    
    if not selection:
        cmds.warning("Nothing selected. Please select a mesh.")
        return
    
    mesh_name = selection[0]
    
    # Check if selection is a mesh
    if not cmds.objectType(mesh_name, isAType="mesh") and not cmds.objectType(cmds.listRelatives(mesh_name, s=True)[0], isAType="mesh"):
        cmds.warning("Selection is not a mesh. Please select a mesh.")
        return
    
    # Get the wireframe path points
    path_points = get_mesh_wireframe_path(mesh_name)
    
    if not path_points:
        cmds.warning("No edges found in the mesh.")
        return
    
    # Create curve name based on mesh name
    curve_name = f"{mesh_name}_wireframeCurve"
    
    # Create the curve
    curve = create_curve_from_wireframe_path(path_points, curve_name)
    
    if not curve:
        cmds.warning("Failed to create curve.")
        return
        
    # Select the new curve
    cmds.select(curve)
    
    print(f"Created wireframe curve '{curve}' from {len(path_points)} points along mesh edges.")
    
    return curve

# Execute the script when run directly
if __name__ == "__main__":
    mesh_to_wireframe_curve()