# Maya-specific utilities for Attribute Connector only

def connect_node_attribute(source_node, source_attribute, target_attribute, operation_selection, cmds):
    """
    Connects or disconnects the source_node.source_attribute to selected target nodes' target_attribute.
    operation_selection: 0 = disconnect, 1 = connect
    When connecting (operation_selection = 1), automatically disconnects any existing 
    connections to the target attribute before making the new connection.
    """
    target_nodes_list = cmds.ls(selection=True)
    operation_type = [cmds.disconnectAttr, cmds.connectAttr]
    for target_node in target_nodes_list:
        full_target_attr = f"{target_node}.{target_attribute}"
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
