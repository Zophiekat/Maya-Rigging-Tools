from maya import cmds

# Global variable to store job IDs
JOB_IDS = []

def kill_existing_jobs():
    """Kill all existing scriptJobs for this attribute"""
    global JOB_IDS
    
    for job_id in JOB_IDS:
        if cmds.scriptJob(exists=job_id):
            print(f"Killing existing job: {job_id}")
            cmds.scriptJob(kill=job_id)
    
    # Reset the list
    JOB_IDS = []

def on_instances_changed(*args):
    """Function called when the Instances attribute changes"""
    container_node = args[0]
    current_instances = cmds.getAttr(f"{container_node}.{instance_attribute_long_name}")
    print(f"Instances changed to: {current_instances}")
    
    # Look for the UVpin node
    uv_pin_name = f"__{hex_id}__UVpin"
    uv_pin_path = f"{container_node}|{uv_pin_name}"
    
    # Check if UVpin exists, if not create it
    if not cmds.objExists(uv_pin_path):
        # Look for it in the scene (might exist but not under container)
        scene_nodes = cmds.ls(f"*{uv_pin_name}*", type="uvPin")
        
        if scene_nodes:
            uv_pin_node = scene_nodes[0]
            print(f"Found UVpin node '{uv_pin_node}' in scene but not in container. Adding to container.")
            
            # Parent to container if not already
            if cmds.objExists(uv_pin_node) and not uv_pin_node.startswith(f"{container_node}|"):
                cmds.parent(uv_pin_node, container_node)
        else:
            print(f"UVpin node '{uv_pin_name}' not found. Creating it.")
            uv_pin_node = cmds.createNode("uvPin", name=uv_pin_name, parent=container_node)
        
        # Add to container if not already a member
        if cmds.objExists(uv_pin_node) and not cmds.container(container_node, query=True, findChild=uv_pin_node):
            cmds.container(container_node, edit=True, addNode=uv_pin_node)
    else:
        uv_pin_node = uv_pin_path
    
    # Ensure UVpin has enough coordinates
    for i in range(current_instances):
        # This will create the multi attribute elements if they don't exist
        if not cmds.attributeQuery(f"coordinate[{i}]", node=uv_pin_node, exists=True):
            # Create the coordinate by accessing it
            cmds.getAttr(f"{uv_pin_node}.coordinate[{i}]")
    
    # Look for existing FloatConstant_U nodes - both in container and scene
    existing_float_constants = {}
    
    # First look in container
    container_contents = cmds.container(container_node, query=True, nodeList=True) or []
    
    for node in container_contents:
        if cmds.objExists(node) and cmds.nodeType(node) == "floatConstant":
            node_name = node.split('|')[-1]  # Get the short name
            if node_name.startswith(f"__{hex_id}__FloatConstant_U_"):
                try:
                    index_str = node_name.split('_')[-1]
                    index = int(index_str)
                    existing_float_constants[index] = node
                except ValueError:
                    print(f"Warning: Could not parse index from node name: {node_name}")
    
    # Then look in scene for nodes that should be in container
    scene_float_constants = cmds.ls(f"*__{hex_id}__FloatConstant_U_*", type="floatConstant")
    for node in scene_float_constants:
        if node not in container_contents:  # If found in scene but not in container
            node_name = node.split('|')[-1]
            try:
                index_str = node_name.split('_')[-1]
                index = int(index_str)
                
                # Add to container
                if not cmds.container(container_node, query=True, findChild=node):
                    print(f"Adding existing FloatConstant node '{node}' to container.")
                    cmds.container(container_node, edit=True, addNode=node)
                    
                # Parent to container if not already
                if cmds.objExists(node) and not node.startswith(f"{container_node}|"):
                    cmds.parent(node, container_node)
                
                existing_float_constants[index] = node
            except ValueError:
                print(f"Warning: Could not parse index from node name: {node_name}")
    
    # Create any missing FloatConstant_U nodes up to the current instance count
    # and connect them to the UVpin node's coordinateU attributes
    for i in range(1, current_instances + 1):
        index_str = f"{i:02d}"  # Format as 01, 02, etc.
        uv_index = i - 1  # UVpin coordinate indices are 0-based
        
        # Get or create the FloatConstant node
        if i not in existing_float_constants:
            # Node doesn't exist, create it
            new_node_name = f"__{hex_id}__FloatConstant_U_{index_str}"
            float_constant_node = cmds.createNode("floatConstant", name=new_node_name, parent=container_node)
            print(f"Created new FloatConstant node: {float_constant_node}")
            
            # Set default properties
            cmds.setAttr(f"{float_constant_node}.inFloat", 0.0)
            
            # Add to container
            cmds.container(container_node, edit=True, addNode=float_constant_node)
        else:
            float_constant_node = existing_float_constants[i]
            print(f"Using existing FloatConstant_U_{index_str}: {float_constant_node}")
        
        # Check connection and connect if needed
        src_attr = f"{float_constant_node}.outFloat"
        dst_attr = f"{uv_pin_node}.coordinate[{uv_index}].coordinateU"
        
        # Get existing connections
        existing_connection = cmds.listConnections(dst_attr, source=True, destination=False, plugs=True)
        
        if not existing_connection or src_attr not in existing_connection:
            print(f"Connecting {src_attr} to {dst_attr}")
            cmds.connectAttr(src_attr, dst_attr, force=True)
        else:
            print(f"Connection from {src_attr} to {dst_attr} already exists")
    
    # We're not deleting higher-indexed nodes as per requirements

def on_hex_id_changed(*args):
    """Function called when the HexID attribute changes"""
    selected_object = args[0]
    current_value = cmds.getAttr(f"{selected_object}.{hex_id_attribute_long_name}")
    print(f"HexID changed to: {current_value}")
    
    # Add your custom logic for HexID changes

def create_instance_attribute(obj):
    """Create the Instances attribute with min/max values"""
    # Check if attribute already exists
    if not cmds.attributeQuery(instance_attribute_long_name, node=obj, exists=True):
        try:
            # Try with attributeType first
            cmds.addAttr(
                obj,
                niceName=instance_attribute_nice_name,
                longName=instance_attribute_long_name,
                attributeType=instance_attribute_type,
                keyable=instance_attribute_keyable,
                defaultValue=1,
                minValue=instance_attribute_minimum_value,
                maxValue=instance_attribute_maximum_value
            )
        except RuntimeError:
            # If attributeType fails, try with dataType
            cmds.addAttr(
                obj,
                niceName=instance_attribute_nice_name,
                longName=instance_attribute_long_name,
                dataType=instance_attribute_type,
                keyable=instance_attribute_keyable,
                defaultValue=1
            )
            # Set min/max after creation since they might not work with dataType
            cmds.addAttr(f"{obj}.{instance_attribute_long_name}", edit=True, 
                         minValue=instance_attribute_minimum_value,
                         maxValue=instance_attribute_maximum_value)
            
        print(f"Created Instances attribute on {obj}")
    else:
        print(f"Instances attribute already exists on {obj}")

def create_hex_id_attribute(obj):
    """Create the HexID attribute"""
    # Check if attribute already exists
    if not cmds.attributeQuery(hex_id_attribute_long_name, node=obj, exists=True):
        try:
            # Try with attributeType first
            cmds.addAttr(
                obj,
                niceName=hex_id_attribute_nice_name,
                longName=hex_id_attribute_long_name,
                attributeType=hex_id_attribute_type,
                keyable=hex_id_keyable,
                defaultValue=hex_id
            )
        except RuntimeError:
            # If attributeType fails, try with dataType
            cmds.addAttr(
                obj,
                niceName=hex_id_attribute_nice_name,
                longName=hex_id_attribute_long_name,
                dataType=hex_id_attribute_type,
                keyable=hex_id_keyable
            )
            # Set the default value after creation
            cmds.setAttr(f"{obj}.{hex_id_attribute_long_name}", hex_id, type="string")
            
        print(f"Created HexID attribute on {obj}")
    else:
        print(f"HexID attribute already exists on {obj}")

def setup_scriptjobs(obj):
    """Set up scriptJobs for all attributes in the dictionary"""
    global JOB_IDS
    
    # Kill any existing jobs first
    kill_existing_jobs()
    
    # Create new scriptJobs based on the dictionary
    for attribute, callback_function in on_attribute_change_dict.items():
        job_id = cmds.scriptJob(
            attributeChange=[f"{obj}.{attribute}", 
                             lambda *args, obj=obj, func=callback_function: func(obj)]
        )
        
        # Store the job ID
        JOB_IDS.append(job_id)
        print(f"Created scriptJob for {attribute}: {job_id}")
    
    return JOB_IDS

def find_or_create_asset_node():
    """Find the asset node by name or create it if it doesn't exist"""
    expected_name = f"{asset_name}__{hex_id}_Asset"
    
    # First check if the selected object has the expected name
    selected = cmds.ls(selection=True)
    if selected and cmds.objExists(selected[0]):
        if selected[0] == expected_name:
            print(f"Selected object '{selected[0]}' matches the expected asset name.")
            return selected[0]
    
    # Search the scene for a node with the expected name
    if cmds.objExists(expected_name):
        print(f"Found existing asset node: {expected_name}")
        return expected_name
    
    # Create a new dagContainer if no matching node is found
    print(f"Creating new asset node: {expected_name}")
    asset_node = cmds.createNode("dagContainer", name=expected_name)
    
    # Ensure it's created at the root level
    if cmds.listRelatives(asset_node, parent=True):
        cmds.parent(asset_node, world=True)
        
    return asset_node

def main():
    # Find or create the asset node
    asset_node = find_or_create_asset_node()
    
    # Select the asset node
    cmds.select(asset_node)
    
    # Create attributes
    create_instance_attribute(asset_node)
    create_hex_id_attribute(asset_node)
    
    # Set up scriptJobs
    setup_scriptjobs(asset_node)

# Define these at module level for accessibility
asset_name = "Ribbon"
hex_id = "9CC60B"

instance_attribute_nice_name = "Instances"
instance_attribute_long_name = "Instances"
instance_attribute_type = "long"
instance_attribute_keyable = False
instance_attribute_minimum_value = 0
instance_attribute_maximum_value = 32

hex_id_attribute_nice_name = "HexID"
hex_id_attribute_long_name = "HexID"
hex_id_attribute_type = "string"
hex_id_keyable = False

# Dictionary mapping attributes to their callback functions
on_attribute_change_dict = {
    instance_attribute_long_name: on_instances_changed,
    hex_id_attribute_long_name: on_hex_id_changed
}

# Run the script
if __name__ == "__main__":
    main()