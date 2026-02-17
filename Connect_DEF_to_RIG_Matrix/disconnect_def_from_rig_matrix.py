import maya.cmds as cmds
import sys
import os
import importlib

# Add the workspace to the path using _global_paths
sys.path.append("/Users/zophiekat/Github_Repositories/Maya-Rigging-Tools")
import _global_paths
importlib.reload(_global_paths)
_global_paths.ensure_path()

# Now import the modules using absolute paths
from Connect_DEF_to_RIG_Matrix import get_def_to_rig_data

# Reload modules to ensure latest versions
importlib.reload(get_def_to_rig_data)

def disconnect_def_from_rig():
    """
    Disconnects DEF joints from RIG joints and stores connections in dummy nodes.
    """
    # Open undo chunk
    cmds.undoInfo(openChunk=True, chunkName="DisconnectDEFFromRIG")
    
    try:
        # Get data
        data = get_def_to_rig_data()
        if not data:
            cmds.undoInfo(closeChunk=True)
            return
        
        matched_joints_dict = data["matched_joints_dict"]
        
        results = []
        print("\nDisconnecting DEF joints from RIG joints...")
        
        # Process each DEF joint
        for def_joint, rig_joint in matched_joints_dict.items():
            # Check if DEF joint is connected to a parentMatrix node
            opm_connections = cmds.listConnections(f"{def_joint}.offsetParentMatrix", source=True, destination=False) or []
            
            if opm_connections:
                connected_node = opm_connections[0]
                
                if cmds.nodeType(connected_node) == "parentMatrix":
                    # Create dummy transform node to store connections
                    dummy_node_name = connected_node + "_NodeConnections"
                    
                    if cmds.objExists(dummy_node_name):
                        cmds.delete(dummy_node_name)
                    
                    cmds.createNode("transform", name=dummy_node_name)
                    results.append(f"Created dummy node {dummy_node_name} for {connected_node}")
                    
                    # Store all incoming connections
                    incoming_connections = cmds.listConnections(connected_node, source=True, destination=False, connections=True, plugs=True) or []
                    
                    for i in range(0, len(incoming_connections), 2):
                        if i+1 < len(incoming_connections):
                            dst_attr = incoming_connections[i]
                            src_plug = incoming_connections[i+1]
                            
                            # Parse the source plug
                            src_parts = src_plug.split('.')
                            src_node = src_parts[0]
                            src_attr = '.'.join(src_parts[1:])
                            
                            # Parse the destination attribute
                            dst_parts = dst_attr.split('.')
                            dst_attr_name = '.'.join(dst_parts[1:])
                            
                            # Create attribute on dummy node
                            dummy_attr_name = f"In__{src_node}__{src_attr.replace('[', '_').replace(']', '_')}"
                            
                            # Get attribute type
                            try:
                                dummy_attr_type = cmds.getAttr(src_plug, type=True)
                                
                                # Create attribute on dummy node based on type
                                if dummy_attr_type == "matrix":
                                    cmds.addAttr(dummy_node_name, longName=dummy_attr_name, attributeType="matrix")
                                elif dummy_attr_type == "float3":
                                    cmds.addAttr(dummy_node_name, longName=dummy_attr_name, attributeType="float3")
                                    cmds.addAttr(dummy_node_name, longName=f"{dummy_attr_name}X", attributeType="float", parent=dummy_attr_name)
                                    cmds.addAttr(dummy_node_name, longName=f"{dummy_attr_name}Y", attributeType="float", parent=dummy_attr_name)
                                    cmds.addAttr(dummy_node_name, longName=f"{dummy_attr_name}Z", attributeType="float", parent=dummy_attr_name)
                                else:
                                    cmds.addAttr(dummy_node_name, longName=dummy_attr_name, attributeType="float")
                                
                                # Connect source to dummy
                                try:
                                    cmds.connectAttr(src_plug, f"{dummy_node_name}.{dummy_attr_name}", force=True)
                                except Exception as e:
                                    print(f"Failed to connect {src_plug} to {dummy_node_name}.{dummy_attr_name}: {str(e)}")
                                
                                # Store node name as string attribute
                                node_attr_name = f"Node_Name__{dummy_attr_name}"
                                cmds.addAttr(dummy_node_name, longName=node_attr_name, dataType="string")
                                cmds.setAttr(f"{dummy_node_name}.{node_attr_name}", src_node, type="string")
                            except Exception as e:
                                print(f"Error processing attribute {src_plug}: {str(e)}")
                    
                    # Store all outgoing connections
                    outgoing_connections = cmds.listConnections(connected_node, source=False, destination=True, connections=True, plugs=True) or []
                    
                    for i in range(0, len(outgoing_connections), 2):
                        if i+1 < len(outgoing_connections):
                            src_attr = outgoing_connections[i]
                            dst_plug = outgoing_connections[i+1]
                            
                            # Parse the destination plug
                            dst_parts = dst_plug.split('.')
                            dst_node = dst_parts[0]
                            dst_attr = '.'.join(dst_parts[1:])
                            
                            # Parse the source attribute
                            src_parts = src_attr.split('.')
                            src_attr_name = '.'.join(src_parts[1:])
                            
                            # Create attribute on dummy node
                            dummy_attr_name = f"Out__{dst_node}__{dst_attr.replace('[', '_').replace(']', '_')}"
                            
                            # Get attribute type
                            try:
                                dummy_attr_type = cmds.getAttr(dst_plug, type=True)
                                
                                # Create attribute on dummy node based on type
                                if dummy_attr_type == "matrix":
                                    cmds.addAttr(dummy_node_name, longName=dummy_attr_name, attributeType="matrix")
                                elif dummy_attr_type == "float3":
                                    cmds.addAttr(dummy_node_name, longName=dummy_attr_name, attributeType="float3")
                                    cmds.addAttr(dummy_node_name, longName=f"{dummy_attr_name}X", attributeType="float", parent=dummy_attr_name)
                                    cmds.addAttr(dummy_node_name, longName=f"{dummy_attr_name}Y", attributeType="float", parent=dummy_attr_name)
                                    cmds.addAttr(dummy_node_name, longName=f"{dummy_attr_name}Z", attributeType="float", parent=dummy_attr_name)
                                else:
                                    cmds.addAttr(dummy_node_name, longName=dummy_attr_name, attributeType="float")
                                
                                # Store node name as string attribute
                                node_attr_name = f"Node_Name__{dummy_attr_name}"
                                cmds.addAttr(dummy_node_name, longName=node_attr_name, dataType="string")
                                cmds.setAttr(f"{dummy_node_name}.{node_attr_name}", dst_node, type="string")
                            except Exception as e:
                                print(f"Error processing attribute {dst_plug}: {str(e)}")
                    
                    # Disconnect the parentMatrix node
                    cmds.disconnectAttr(f"{connected_node}.output", f"{def_joint}.offsetParentMatrix")
                    results.append(f"Disconnected {connected_node} from {def_joint} and stored connections in {dummy_node_name}")
                else:
                    results.append(f"{def_joint} is connected to {connected_node} which is not a parentMatrix node - skipping")
            else:
                results.append(f"{def_joint} has no incoming offsetParentMatrix connections - skipping")
        
        print("\nSummary of operations:")
        for result in results:
            print(f"- {result}")
        
        print("\nDisconnection operation completed successfully.")
        
    except Exception as e:
        import traceback
        print(f"Error during disconnection: {str(e)}")
        print(traceback.format_exc())
        cmds.warning(f"Error during disconnection: {str(e)}")
    finally:
        # Always close the undo chunk
        cmds.undoInfo(closeChunk=True)

# For direct execution
if __name__ == "__main__":
    disconnect_def_from_rig()