import os
import sys
import json

# Ensure we can import from the same directory
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
if SCRIPT_DIR not in sys.path:
    sys.path.append(SCRIPT_DIR)

from global_paths import PATHS
from maya import cmds

def mirror_node_name(node_name):
    """Convert an L side node name to R side."""
    if "_L_" in node_name:
        return node_name.replace("_L_", "_R_")
    elif "_L" in node_name and not node_name.endswith("_WORLD"):  # Exclude special cases
        return node_name.replace("_L", "_R")
    return node_name  # Return unchanged if no L designation found

def mirror_attribute_path(attr_path):
    """Mirror an attribute path, handling node names within the path."""
    if not attr_path or '.' not in attr_path:
        return mirror_node_name(attr_path)
        
    # Split into node and attributes
    parts = attr_path.split('.', 1)
    node_name = parts[0]
    attr_part = parts[1]
    
    # Mirror the node name
    mirrored_node = mirror_node_name(node_name)
    
    # Handle indexed attributes (like worldMatrix[0])
    # Keep the index but mirror any node names inside
    return f"{mirrored_node}.{attr_part}"

def mirror_connection_data(connection_data):
    """Create a mirrored version of the connection data (L->R)."""
    mirrored_data = {}
    
    # Process each node
    for node_name, node_data in connection_data.items():
        # Get the R side equivalent name
        if "_L" in node_name or "_L_" in node_name:
            r_node_name = mirror_node_name(node_name)
            
            # Create a deep copy with mirrored values
            r_node_data = {}
            
            # Copy basic node info
            if "node_name" in node_data:
                r_node_data["node_name"] = r_node_name
            
            # Copy node type
            if "node_type" in node_data:
                r_node_data["node_type"] = node_data["node_type"]
            
            # Mirror connected attributes list
            if "connected_attributes" in node_data:
                r_node_data["connected_attributes"] = node_data["connected_attributes"].copy()
            
            # Mirror incoming connections
            if "incoming_connections" in node_data:
                r_node_data["incoming_connections"] = []
                for conn in node_data["incoming_connections"]:
                    r_conn = conn.copy()  # Start with a copy
                    
                    # Mirror source and destination paths
                    if "exact_source" in r_conn:
                        r_conn["exact_source"] = mirror_attribute_path(r_conn["exact_source"])
                    if "exact_destination" in r_conn:
                        r_conn["exact_destination"] = mirror_attribute_path(r_conn["exact_destination"])
                        
                    # Mirror connected node
                    if "connected_node_name" in r_conn:
                        r_conn["connected_node_name"] = mirror_node_name(r_conn["connected_node_name"])
                        
                    r_node_data["incoming_connections"].append(r_conn)
            
            # Mirror outgoing connections
            if "outgoing_connections" in node_data:
                r_node_data["outgoing_connections"] = []
                for conn in node_data["outgoing_connections"]:
                    r_conn = conn.copy()  # Start with a copy
                    
                    # Mirror source and destination paths
                    if "exact_source" in r_conn:
                        r_conn["exact_source"] = mirror_attribute_path(r_conn["exact_source"])
                    if "exact_destination" in r_conn:
                        r_conn["exact_destination"] = mirror_attribute_path(r_conn["exact_destination"])
                        
                    # Mirror connected node
                    if "connected_node_name" in r_conn:
                        r_conn["connected_node_name"] = mirror_node_name(r_conn["connected_node_name"])
                        
                    r_node_data["outgoing_connections"].append(r_conn)
            
            mirrored_data[r_node_name] = r_node_data
    
    return mirrored_data

def save_mirrored_connection_data_to_json(output_path):
    """Load the original connection data, mirror it, and save to JSON."""
    # Load the original connection data
    connection_path = PATHS.get_data_file_path("connection_data.json")
    
    if not os.path.exists(connection_path):
        cmds.error("Original connection data not found!")
        return False
    
    # Load the data
    with open(connection_path, 'r') as file:
        connection_data = json.load(file)
    
    # Create the mirrored version
    mirrored_data = mirror_connection_data(connection_data)
    
    # Save to JSON file
    with open(output_path, 'w') as file:
        json.dump(mirrored_data, file, indent=4)
    
    print(f"Mirrored connection data saved to {output_path}")
    print(f"Original connection data had {len(connection_data)} nodes")
    print(f"Mirrored connection data has {len(mirrored_data)} nodes")
    
    return True

def run():
    """Run the mirrored connection data creation process."""
    mirrored_connection_path = PATHS.get_data_file_path("mirrored_connection_data.json")
    return save_mirrored_connection_data_to_json(mirrored_connection_path)

if __name__ == "__main__":
    run()