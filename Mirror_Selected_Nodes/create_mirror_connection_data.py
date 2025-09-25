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

def mirror_connection_data(connection_data):
    """Create a mirrored version of the connection data (L->R)."""
    mirrored_data = {}
    
    # Process each node's connections
    for source_node, connections in connection_data.items():
        # Get the R side equivalent source node
        mirrored_source = mirror_node_name(source_node)
        mirrored_data[mirrored_source] = {
            "inputs": {},
            "outputs": {}
        }
        
        # Process input connections
        for dest_attr, sources in connections.get("inputs", {}).items():
            # The destination attribute might contain a node name we need to mirror
            dest_parts = dest_attr.split('.')
            mirrored_dest_node = mirror_node_name(dest_parts[0])
            mirrored_dest_attr = f"{mirrored_dest_node}.{'.'.join(dest_parts[1:])}" if len(dest_parts) > 1 else mirrored_dest_node
            
            # Now process the source connections
            mirrored_sources = []
            for source_info in sources:
                source_attr = source_info.get("sourceAttribute", "")
                source_parts = source_attr.split('.')
                mirrored_source_node = mirror_node_name(source_parts[0])
                mirrored_source_attr = f"{mirrored_source_node}.{'.'.join(source_parts[1:])}" if len(source_parts) > 1 else mirrored_source_node
                
                mirrored_source_info = {
                    "sourceAttribute": mirrored_source_attr,
                    "connectionType": source_info.get("connectionType", "")
                }
                mirrored_sources.append(mirrored_source_info)
            
            mirrored_data[mirrored_source]["inputs"][mirrored_dest_attr] = mirrored_sources
        
        # Process output connections
        for source_attr, destinations in connections.get("outputs", {}).items():
            # The source attribute might contain a node name we need to mirror
            source_parts = source_attr.split('.')
            mirrored_src_node = mirror_node_name(source_parts[0])
            mirrored_src_attr = f"{mirrored_src_node}.{'.'.join(source_parts[1:])}" if len(source_parts) > 1 else mirrored_src_node
            
            # Now process the destination connections
            mirrored_destinations = []
            for dest_info in destinations:
                dest_attr = dest_info.get("destinationAttribute", "")
                dest_parts = dest_attr.split('.')
                mirrored_dest_node = mirror_node_name(dest_parts[0])
                mirrored_dest_attr = f"{mirrored_dest_node}.{'.'.join(dest_parts[1:])}" if len(dest_parts) > 1 else mirrored_dest_node
                
                mirrored_dest_info = {
                    "destinationAttribute": mirrored_dest_attr,
                    "connectionType": dest_info.get("connectionType", "")
                }
                mirrored_destinations.append(mirrored_dest_info)
            
            mirrored_data[mirrored_source]["outputs"][mirrored_src_attr] = mirrored_destinations
    
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