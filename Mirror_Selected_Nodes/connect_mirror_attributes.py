import json
import os
from maya import cmds

# Import the global paths
from global_paths import PATHS

def load_json_data(file_path):
    """Load data from a JSON file."""
    with open(file_path, 'r') as file:
        return json.load(file)

def connect_mirror_attributes():
    """Connect attributes for mirrored nodes based on mirrored_connection_data.json"""
    # Load the mirrored connection data
    mirrored_connection_path = PATHS.get_data_file_path("mirrored_connection_data.json")
    
    if not os.path.exists(mirrored_connection_path):
        cmds.error("❌ Mirrored connection data not found! Run the mirroring process first.")
        return False
    
    # Load the data
    connection_data = load_json_data(mirrored_connection_path)
    
    print(f"🔌 Loaded connection data for {len(connection_data)} nodes")
    
    # Track results
    connection_results = {
        "success_count": 0,
        "error_count": 0,
        "skipped_count": 0,
        "connections_made": []
    }
    
    # Process each node's connections
    for node_name, node_data in connection_data.items():
        # Check if the node exists
        if not cmds.objExists(node_name):
            print(f"⚠️ Node {node_name} does not exist in scene, skipping its connections")
            connection_results["skipped_count"] += 1
            continue
        
        # Process incoming connections
        incoming_connections = node_data.get("incoming_connections", [])
        for conn in incoming_connections:
            # Get source and destination attributes
            source_attr = conn.get("exact_source")
            dest_attr = conn.get("exact_destination")
            
            if not source_attr or not dest_attr:
                print(f"⚠️ Missing connection info for {node_name}, skipping")
                continue
            
            # The exact_destination seems to be duplicated from exact_source in the data
            # We need to construct the proper destination
            attr_name = conn.get("attribute_name")
            if attr_name:
                # Construct the proper destination attribute
                dest_attr = f"{node_name}.{attr_name}"
            
            # Check if source node exists
            source_node = source_attr.split(".")[0]
            if not cmds.objExists(source_node):
                print(f"⚠️ Source node {source_node} does not exist, skipping connection")
                connection_results["skipped_count"] += 1
                continue
            
            # Check if destination node exists  
            dest_node = dest_attr.split(".")[0]
            if not cmds.objExists(dest_node):
                print(f"⚠️ Destination node {dest_node} does not exist, skipping connection")
                connection_results["skipped_count"] += 1
                continue
            
            # Check if already connected
            try:
                existing_connection = cmds.connectionInfo(dest_attr, sourceFromDestination=True)
                if existing_connection and existing_connection == source_attr:
                    print(f"✓ Already connected: {source_attr} → {dest_attr}")
                    connection_results["skipped_count"] += 1
                    continue
            except:
                pass  # Attribute might not exist yet
            
            # Make the connection
            try:
                print(f"🔗 Connecting: {source_attr} → {dest_attr}")
                cmds.connectAttr(source_attr, dest_attr, force=True)
                
                connection_results["success_count"] += 1
                connection_results["connections_made"].append({
                    "source": source_attr,
                    "destination": dest_attr,
                    "node": node_name,
                    "attribute": attr_name
                })
                
            except Exception as e:
                print(f"❌ Failed to connect {source_attr} → {dest_attr}: {str(e)}")
                connection_results["error_count"] += 1
        
        # Process outgoing connections
        outgoing_connections = node_data.get("outgoing_connections", [])
        for conn in outgoing_connections:
            # Get source and destination attributes
            source_attr = conn.get("exact_source")
            dest_attr = conn.get("exact_destination")
            
            if not source_attr or not dest_attr:
                print(f"⚠️ Missing connection info for {node_name}, skipping")
                continue
            
            # Check if source node exists
            source_node = source_attr.split(".")[0]
            if not cmds.objExists(source_node):
                print(f"⚠️ Source node {source_node} does not exist, skipping connection")
                connection_results["skipped_count"] += 1
                continue
            
            # Check if destination node exists
            dest_node = dest_attr.split(".")[0]
            if not cmds.objExists(dest_node):
                print(f"⚠️ Destination node {dest_node} does not exist, skipping connection")
                connection_results["skipped_count"] += 1
                continue
            
            # Check if already connected
            try:
                existing_connection = cmds.connectionInfo(dest_attr, sourceFromDestination=True)
                if existing_connection and existing_connection == source_attr:
                    print(f"✓ Already connected: {source_attr} → {dest_attr}")
                    connection_results["skipped_count"] += 1
                    continue
            except:
                pass  # Attribute might not exist yet
            
            # Make the connection
            try:
                print(f"🔗 Connecting: {source_attr} → {dest_attr}")
                cmds.connectAttr(source_attr, dest_attr, force=True)
                
                connection_results["success_count"] += 1
                connection_results["connections_made"].append({
                    "source": source_attr,
                    "destination": dest_attr,
                    "node": node_name,
                    "attribute": conn.get("attribute_name")
                })
                
            except Exception as e:
                print(f"❌ Failed to connect {source_attr} → {dest_attr}: {str(e)}")
                connection_results["error_count"] += 1
    
    # Print summary
    print(f"\n📊 Connection Summary:")
    print(f"- Nodes processed: {len(connection_data)}")
    print(f"- Connections made: {connection_results['success_count']}")
    print(f"- Connections skipped: {connection_results['skipped_count']}")
    print(f"- Connection errors: {connection_results['error_count']}")
    
    # Save the results to a JSON file for reference
    results_path = PATHS.get_data_file_path("connection_results.json")
    with open(results_path, 'w') as f:
        json.dump(connection_results, f, indent=4)
    print(f"💾 Connection results saved to: {results_path}")
    
    return connection_results

def run():
    """Run the connection process."""
    return connect_mirror_attributes()

# Only run this code if the script is executed directly (not imported)
if __name__ == "__main__":
    run()