import maya.cmds as cmds
import sys
import os
import importlib
import traceback

# Add the workspace to the path using _global_paths
sys.path.append("/Users/zophiekat/Github_Repositories/Maya-Rigging-Tools")
import _global_paths
importlib.reload(_global_paths)
_global_paths.ensure_path()

# Import the modules
from Connect_DEF_to_RIG_Matrix import get_def_to_rig_data as get_data_module
from Connect_DEF_to_RIG_Matrix import initialize_parent_matrix_target_offset as init_module

# Reload modules to ensure latest versions
importlib.reload(get_data_module)
importlib.reload(init_module)

# Import the actual functions from the modules
from Connect_DEF_to_RIG_Matrix.get_def_to_rig_data import get_def_to_rig_data
from Connect_DEF_to_RIG_Matrix.initialize_parent_matrix_target_offset import initialize_target_offset

def connect_def_to_rig():
    """
    Connects DEF joints to RIG joints using parentMatrix nodes.
    """
    # Open undo chunk
    cmds.undoInfo(openChunk=True, chunkName="ConnectDEFToRIG")
    
    try:
        # Get data - now calling the function directly
        data = get_def_to_rig_data()
        if not data:
            cmds.undoInfo(closeChunk=True)
            return
        
        matched_joints_dict = data["matched_joints_dict"]
        
        results = []
        print("\nConnecting DEF joints to RIG joints...")
        
        # Process each DEF joint
        for def_joint, rig_joint in matched_joints_dict.items():
            # Check for dummy transform node connections to restore
            dummy_node_name = def_joint.replace("_jnt", "_ParentMatrix_NodeConnections")
            
            if cmds.objExists(dummy_node_name):
                print(f"Found dummy node {dummy_node_name}, restoring connections...")
                
                # Get the attributes on the dummy node
                attrs = cmds.listAttr(dummy_node_name, ud=True) or []
                
                # Get the parent matrix node name
                parentMatrix_node = def_joint.replace("_jnt", "_ParentMatrix")
                
                # Create parent matrix node if it doesn't exist
                if not cmds.objExists(parentMatrix_node):
                    cmds.createNode("parentMatrix", name=parentMatrix_node)
                
                # Restore connections from the dummy node
                for attr in attrs:
                    if attr.startswith("Node_Name__"):
                        # This is a stored node name, skip it
                        continue
                    
                    # Parse the attribute name
                    parts = attr.split("__")
                    if len(parts) >= 3:
                        direction = parts[0]  # "In" or "Out"
                        node_name = parts[1]
                        attr_name = parts[2]
                        
                        # Check if the node still exists
                        if cmds.objExists(node_name):
                            if direction == "In":
                                # Restore incoming connection
                                cmds.connectAttr(f"{node_name}.{attr_name}", f"{parentMatrix_node}.{attr_name}", force=True)
                            elif direction == "Out":
                                # Restore outgoing connection
                                cmds.connectAttr(f"{parentMatrix_node}.{attr_name}", f"{node_name}.{attr_name}", force=True)
                
                # Delete the dummy node
                cmds.delete(dummy_node_name)
                results.append(f"Restored connections from dummy node for {def_joint}")
            
            # Check if DEF joint is connected to a parentMatrix node
            opm_connections = cmds.listConnections(f"{def_joint}.offsetParentMatrix", source=True, destination=False) or []
            
            if opm_connections:
                connected_node = opm_connections[0]
                
                if cmds.nodeType(connected_node) == "parentMatrix":
                    # Check if this parentMatrix is connected to a RIG joint
                    pm_connections = cmds.listConnections(f"{connected_node}.target[0].targetMatrix", source=True, destination=False) or []
                    
                    if pm_connections and pm_connections[0] == rig_joint:
                        results.append(f"DEF joint {def_joint} already correctly connected to RIG joint {rig_joint}")
                        continue
                    else:
                        # Delete the parentMatrix node since it's not connected to the right RIG joint
                        cmds.delete(connected_node)
                        results.append(f"Deleted incorrect parentMatrix node {connected_node}")
                else:
                    # Disconnect other connections to offsetParentMatrix
                    cmds.disconnectAttr(f"{connected_node}.output", f"{def_joint}.offsetParentMatrix")
                    results.append(f"Disconnected {connected_node} from {def_joint}.offsetParentMatrix")
            
            # Create new parentMatrix node
            parentMatrix_node = def_joint.replace("_jnt", "_ParentMatrix")
            
            if not cmds.objExists(parentMatrix_node):
                cmds.createNode("parentMatrix", name=parentMatrix_node)
                results.append(f"Created new parentMatrix node {parentMatrix_node}")
            
            # Connect RIG joint's worldMatrix to parentMatrix
            cmds.connectAttr(f"{rig_joint}.worldMatrix[0]", f"{parentMatrix_node}.target[0].targetMatrix", force=True)
            results.append(f"Connected {rig_joint}.worldMatrix[0] to {parentMatrix_node}.target[0].targetMatrix")
            
            # Connect parentMatrix to DEF joint
            cmds.connectAttr(f"{parentMatrix_node}.output", f"{def_joint}.offsetParentMatrix", force=True)
            results.append(f"Connected {parentMatrix_node}.output to {def_joint}.offsetParentMatrix")
            
            # Initialize target offset
            try:
                initialize_target_offset(parentMatrix_node)
                results.append(f"Initialized target offset for {parentMatrix_node}")
            except Exception as e:
                results.append(f"Failed to initialize target offset for {parentMatrix_node}: {str(e)}")
        
        print("\nSummary of operations:")
        for result in results:
            print(f"- {result}")
        
        print("\nConnection operation completed successfully.")
    
    except Exception as e:
        import traceback
        print(f"Error during connection: {str(e)}")
        print(traceback.format_exc())
        cmds.warning(f"Error during connection: {str(e)}")
    finally:
        # Always close the undo chunk
        cmds.undoInfo(closeChunk=True)

# For direct execution
if __name__ == "__main__":
    connect_def_to_rig()