# Maya-specific utilities for Attribute Connector only

def connect_node_attribute(source_node, source_attribute, target_attribute, operation_selection, target_node=None):
    """
    Connects or disconnects the source_node.source_attribute to target_node.target_attribute.
    
    Args:
        source_node (str): Name of the source node
        source_attribute (str): Name of the attribute on the source node
        target_attribute (str): Name of the attribute on the target node(s)
        operation_selection (int): 0 = disconnect, 1 = connect
        target_node (str, optional): Specific target node. If None, uses all selected objects.
    
    When connecting (operation_selection = 1), automatically disconnects any existing 
    connections to the target attribute before making the new connection.
    """
    # Import maya.cmds here to avoid import errors when not in Maya
    try:
        import maya.cmds as cmds
    except ImportError:
        print("Error: maya.cmds module not available. Are you running in Maya?")
        return
    
    # Determine target nodes
    if target_node:
        target_nodes_list = [target_node]
    else:
        target_nodes_list = cmds.ls(selection=True)
        if not target_nodes_list:
            print("No objects selected. Please select at least one target object.")
            return
    
    # Check if source node exists
    full_source_attr = f"{source_node}.{source_attribute}"
    if not cmds.objExists(source_node):
        print(f"Error: Source node '{source_node}' does not exist.")
        return
    
    # Handle different attribute name variations (for the "Outliner_Component_Color" issue)
    source_attr_variations = [
        source_attribute,                      # Original attribute name
        source_attribute.replace("Outliner_", ""),  # Remove "Outliner_" prefix
        f"Component_{source_attribute}",       # Try with "Component_" prefix
    ]
    
    # Find the correct attribute name
    source_attr_found = False
    for attr_variation in source_attr_variations:
        if cmds.attributeQuery(attr_variation, node=source_node, exists=True):
            source_attribute = attr_variation
            source_attr_found = True
            break
    
    if not source_attr_found:
        print(f"Error: Source attribute '{source_attribute}' does not exist on '{source_node}'.")
        print(f"Available attributes on {source_node}:")
        try:
            for attr in cmds.listAttr(source_node):
                print(f"  - {attr}")
        except:
            print("  Could not list attributes.")
        return
    
    operation_type = [cmds.disconnectAttr, cmds.connectAttr]
    for target_node_name in target_nodes_list:
        # Skip the source node if it's the same as target (no self connections)
        if target_node_name == source_node:
            continue
        
        # Try different variations of the target attribute name
        target_attr_variations = [
            target_attribute,                      # Original attribute name
            target_attribute.replace("Outliner_", ""),  # Remove "Outliner_" prefix
            f"Component_{target_attribute}",       # Try with "Component_" prefix
        ]
        
        # Find the correct target attribute name
        target_attr_found = False
        for attr_variation in target_attr_variations:
            if cmds.attributeQuery(attr_variation, node=target_node_name, exists=True):
                target_attribute = attr_variation
                target_attr_found = True
                break
                
        if not target_attr_found:
            print(f"Error: Target attribute '{target_attribute}' does not exist on '{target_node_name}'.")
            print(f"Available attributes on {target_node_name}:")
            try:
                for attr in cmds.listAttr(target_node_name):
                    print(f"  - {attr}")
            except:
                print("  Could not list attributes.")
            continue
        
        full_target_attr = f"{target_node_name}.{target_attribute}"
        
        # Check existing connections
        connections = cmds.listConnections(full_target_attr, source=True, destination=False, plugs=True)
        if connections:
            print(f"{full_target_attr} is already connected to: {connections}")
            # If we're connecting (operation_selection = 1), disconnect existing connections first
            if operation_selection == 1:
                print(f"Disconnecting existing connections before new connection...")
                for existing_connection in connections:
                    try:
                        cmds.disconnectAttr(existing_connection, full_target_attr)
                        print(f"Disconnected: {existing_connection} -> {full_target_attr}")
                    except Exception as e:
                        print(f"Failed to disconnect {existing_connection}: {e}")
        else:
            print(f"No existing connections found for {full_target_attr}")
        
        # Perform the main operation
        try:
            connection_result = operation_type[operation_selection](f"{source_node}.{source_attribute}", full_target_attr, force=True)
            print(f"{operation_type[operation_selection].__name__} executed for {source_node}.{source_attribute} -> {full_target_attr}")
        except Exception as e:
            print(f"Failed to {operation_type[operation_selection].__name__} {full_target_attr}: {e}")
