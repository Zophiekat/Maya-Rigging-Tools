import json
import os
from maya import cmds

# Import the global paths
from global_paths import PATHS
import filter_utils

def get_attribute_data(node, attribute):
    """Get detailed data about a specific attribute."""
    full_attr_name = f"{node}.{attribute}"
    
    # Get attribute type
    try:
        data_type = cmds.getAttr(full_attr_name, type=True)
    except:
        data_type = "unknown"
    
    return {
        "attribute_name": attribute,
        "data_type": data_type,
        "connections": []  # Will be populated with connection data
    }

def get_node_connection_info(node):
    """Get connection information for a given node."""
    # Get node type
    try:
        node_type = cmds.nodeType(node)
    except:
        node_type = "unknown"
    
    # Get all connections - FIXED: removed invalid sourceFirst flag
    connections = cmds.listConnections(node, connections=True, plugs=True) or []
    
    # Initialize connection data structures
    connection_data = {
        "node_name": node,
        "node_type": node_type,
        "connected_attributes": [],
        "incoming_connections": [],
        "outgoing_connections": []
    }
    
    # Track attributes to avoid duplicates
    processed_attributes = set()
    
    # Process each connection
    i = 0
    while i < len(connections):
        # In the default format, Maya returns [plug, connectedPlug, plug, connectedPlug, ...]
        source_or_dest = connections[i]
        connected = connections[i+1]
        i += 2
        
        # Determine if this node's plug is the source or destination
        if node in source_or_dest:
            # This node's plug is being used in this connection
            node_plug = source_or_dest
            connected_plug = connected
            
            # Parse the plug names to get just the attribute part
            if '.' in node_plug:
                node_attr = node_plug.split('.', 1)[1]
            else:
                continue  # Skip if no attribute
                
            # Determine if this is a source or destination connection
            is_source = cmds.connectionInfo(node_plug, isSource=True)
            is_destination = cmds.connectionInfo(node_plug, isDestination=True)
            
            # Get the exact source and destination for this connection
            exact_source = cmds.connectionInfo(connected_plug, getExactSource=True) if is_destination else node_plug
            exact_destination = cmds.connectionInfo(connected_plug, getExactDestination=True) if is_source else connected_plug
            
            # Get connected node information
            connected_node = connected_plug.split('.')[0]
            try:
                connected_node_type = cmds.nodeType(connected_node)
            except:
                connected_node_type = "unknown"
                
            # Skip if the connected node should be ignored
            if filter_utils.should_ignore_node(connected_node):
                continue
            
            # Skip if we've already processed this attribute
            if node_attr in processed_attributes:
                continue
                
            processed_attributes.add(node_attr)
            
            # Create attribute connection data
            attr_connection = {
                "attribute_name": node_attr,
                "data_type": cmds.getAttr(f"{node}.{node_attr}", type=True) if cmds.attributeQuery(node_attr, node=node, exists=True) else "unknown",
                "is_source": is_source,
                "is_destination": is_destination,
                "exact_source": exact_source,
                "exact_destination": exact_destination,
                "connected_node_name": connected_node,
                "connected_node_type": connected_node_type
            }
            
            # Add to the appropriate lists
            connection_data["connected_attributes"].append(node_attr)
            if is_source:
                connection_data["outgoing_connections"].append(attr_connection)
            if is_destination:
                connection_data["incoming_connections"].append(attr_connection)
    
    return connection_data

def save_connections_to_json(nodes, output_file=None):
    """Save connection information for multiple nodes to JSON."""
    # Define default output file path if none provided
    if output_file is None:
        output_file = PATHS.get_data_file_path("connection_data.json")
    
    # Make sure the data directory exists
    data_dir = os.path.dirname(output_file)
    if not os.path.exists(data_dir):
        os.makedirs(data_dir)
    
    # Filter out nodes that should be ignored
    filtered_nodes = filter_utils.filter_nodes(nodes)
    
    # Gather connection data for all nodes
    connection_data = {}
    for node in filtered_nodes:
        # Use the node name as the key
        connection_data[node] = get_node_connection_info(node)
    
    # Write to JSON file
    with open(output_file, 'w') as f:
        json.dump(connection_data, f, indent=4)
    
    print(f"Connection data saved to {output_file}")
    return connection_data

def store_selected_connections():
    """Store connection data for currently selected nodes."""
    selected_nodes = cmds.ls(selection=True)
    
    if selected_nodes:
        return save_connections_to_json(selected_nodes)
    else:
        print("No nodes selected.")
        return {}

def run():
    """Run the connection data storage directly."""
    return store_selected_connections()

# Only run this code if the script is executed directly (not imported)
if __name__ == "__main__":
    run()