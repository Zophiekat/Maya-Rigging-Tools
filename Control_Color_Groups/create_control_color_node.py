from maya import cmds
from collections import defaultdict

def create_and_connect_control_color():
    cmds.undoInfo(openChunk=True, chunkName="create_control_color_node")
    try:
        selection_list = cmds.ls(selection=True, long=True)
        
        if not selection_list:
            print("\nERROR: No objects selected. Please select control objects and a color group container.")
            return
            
        # Check if the last selected item is a dagContainer node (the color group)
        group_node = selection_list[-1]
        group_node_type = cmds.nodeType(group_node)
        if group_node_type != "dagContainer":
            # Use short name for error message but include full path for debugging
            short_group = group_node.split('|')[-1].split(':')[-1]
            print(f"\nERROR: Last selected object must be a dagContainer (color group). Found: {short_group} (type: {group_node_type})")
            print(f"Full path: {group_node}")
            print("Please select control objects first, then select a color group container last.")
            return
            
        # Filter out non-transform nodes from the controls list
        controls_list = []
        skipped_nodes = []
        for obj in selection_list[:-1]:  # All but the last item
            if cmds.nodeType(obj) == "transform":
                controls_list.append(obj)
            else:
                skipped_nodes.append(obj)
        
        if skipped_nodes:
            print("\nNOTE: The following non-transform objects were skipped:")
            for node in skipped_nodes:
                print(f"  - {node} (type: {cmds.nodeType(node)})")
                
        if not controls_list:
            print("\nERROR: No transform nodes found in selection to process as controls.")
            print("Please select at least one transform node for the control.")
            return
        
        # Check for duplicate names in the selection list
        name_counts = defaultdict(list)
        for obj in selection_list:
            short_name = obj.split('|')[-1].split(':')[-1]
            name_counts[short_name].append(obj)
        
        duplicates = {name: paths for name, paths in name_counts.items() if len(paths) > 1}
        if duplicates:
            print("\nERROR: Duplicate node names found in selection:")
            for name, paths in duplicates.items():
                print(f"  Node name '{name}' is used by multiple objects:")
                for path in paths:
                    print(f"    - {path}")
            print("Operation aborted. Please rename objects to have unique names.")
            return
            
        # Check for duplicate names in the entire scene that could conflict
        all_scene_objects = cmds.ls(long=True)
        scene_name_counts = defaultdict(list)
        for obj in all_scene_objects:
            short_name = obj.split('|')[-1].split(':')[-1]
            scene_name_counts[short_name].append(obj)
            
        scene_duplicates = {name: paths for name, paths in scene_name_counts.items() 
                           if len(paths) > 1 and any(obj in controls_list for obj in paths)}
        if scene_duplicates:
            print("\nERROR: The following nodes in your selection have name conflicts with other objects in the scene:")
            for name, paths in scene_duplicates.items():
                print(f"  Node name '{name}' is used by multiple objects in the scene:")
                for path in paths:
                    is_selected = "SELECTED" if path in controls_list else "not selected"
                    print(f"    - {path} ({is_selected})")
            print("Operation aborted. Please use unique names or ensure full selection of all nodes with the same name.")
            return
        
        # Print group node using short name
        short_group = group_node.split('|')[-1].split(':')[-1]
        print(f"group_node: {short_group}")
        
        # Print controls using short names
        short_controls = [ctrl.split('|')[-1].split(':')[-1] for ctrl in controls_list]
        print(f"controls_list: {short_controls}")
        
        suffix = "Control_Color"
        
        color_node = ""
        
        
        def create_attribute(nice_name, long_name, data_type):
            cmds.addAttr(niceName = nice_name, longName=long_name, attributeType=data_type)
            
            
        def create_color_node(control_item):
            # Extract the short name from the full path for the color node name
            short_name = control_item.split('|')[-1].split(':')[-1]
            color_node = f"{short_name}__{suffix}"
            
            if cmds.objExists(color_node):
                print(f"Node '{color_node}' already exists, overwritting")
                cmds.delete(color_node)
            
            cmds.select(clear=True)
            color_node = cmds.createNode("colorConstant", name=color_node, skipSelect=True)
            # Ensure we get the full name returned by the create command
            cmds.select(color_node, add=True)
            
            print("Create 'Override' attribute")
            create_attribute("Override Enabled", "overrideEnabled", "bool")
            
            print("Create 'Override RGB Colors' attribute")
            create_attribute("Override RGB Colors", "overrideRGBColors", "bool")
            
            print("Create 'Line Width' attribute")
            create_attribute("Line Width", "lineWidth", "float")
            
            cmds.select(clear=True)
            return color_node
            
            
        def connect_color_node_attributes_to_control(color_node, control_node):
            cmds.select(clear=True)
            
            # Get all shape nodes (using long paths to avoid ambiguity)
            cmds.select(control_node, add=True)
            all_shapes = cmds.listRelatives(shapes=True, noIntermediate=True, fullPath=True) or []
            
            # Filter only nurbsCurve shapes
            curve_shapes = []
            for shape in all_shapes:
                if cmds.nodeType(shape) == "nurbsCurve":
                    curve_shapes.append(shape)
                else:
                    # Use short name for regular messaging
                    short_shape = shape.split('|')[-1].split(':')[-1]
                    print(f"  Note: Skipping non-nurbsCurve shape: {short_shape} (type: {cmds.nodeType(shape)})")
            
            cmds.select(clear=True)
            
            # Check if we have any nurbsCurve shapes
            if not curve_shapes:
                # Use short name for warnings
                short_control = control_node.split('|')[-1].split(':')[-1]
                print(f"\nWARNING: Skipping control '{short_control}' - No nurbsCurve shapes found")
                return False
                
            # Print short names for curve shapes for better readability
            short_curve_shapes = [shape.split('|')[-1].split(':')[-1] for shape in curve_shapes]
            print('nurbsCurve shapes:', short_curve_shapes)
            
            # Check for shapes with duplicate names
            shape_names = defaultdict(list)
            for shape in curve_shapes:
                short_name = shape.split('|')[-1].split(':')[-1]
                shape_names[short_name].append(shape)
            
            duplicate_shapes = {name: paths for name, paths in shape_names.items() if len(paths) > 1}
            if duplicate_shapes:
                # Use short name for the control in error message
                short_control = control_node.split('|')[-1].split(':')[-1]
                print(f"\nERROR: Skipping control '{short_control}' - Duplicate shape names found:")
                for name, paths in duplicate_shapes.items():
                    print(f"  Shape name '{name}' is used by multiple shapes:")
                    # For duplicates, we need full paths to distinguish them
                    for path in paths:
                        print(f"    - {path}")
                return False
                
            # Check if any shapes conflict with other objects in the scene
            all_scene_objects = cmds.ls(long=True)
            for shape in curve_shapes:
                short_name = shape.split('|')[-1].split(':')[-1]
                matching_objects = [obj for obj in all_scene_objects if obj.split('|')[-1].split(':')[-1] == short_name]
                
                if len(matching_objects) > 1:
                    # Use short name for the control in error message
                    short_control = control_node.split('|')[-1].split(':')[-1]
                    print(f"\nERROR: Skipping control '{short_control}' - Shape name conflicts with other objects in the scene:")
                    print(f"  Shape name '{short_name}' is used by multiple objects:")
                    # For conflicts, we need full paths to distinguish them
                    for obj in matching_objects:
                        print(f"    - {obj}")
                    return False

            cmds.connectAttr(f"{color_node}.outColor", f"{control_node}.overrideColorRGB", force = True)
            cmds.connectAttr(f"{color_node}.overrideEnabled", f"{control_node}.overrideEnabled", force = True)
            cmds.connectAttr(f"{color_node}.overrideRGBColors", f"{control_node}.overrideRGBColors", force = True)
            
            for node_item in curve_shapes:
                exists = cmds.attributeQuery('lineWidth', node=node_item, exists=True)
                # Use short name for regular messages
                short_node = node_item.split('|')[-1].split(':')[-1]
                print(f"'lineWidth' exists on {short_node}")
                cmds.connectAttr(f"{color_node}.lineWidth", f"{node_item}.lineWidth", force = True)
                cmds.select(clear=True)
            
            return True
            
            
        def add_node_to_container(group_node, color_node):
            cmds.select(clear=True)
            # Use short names for better readability in regular messages
            short_group = group_node.split('|')[-1].split(':')[-1]
            print(f"Add '{color_node}' Node Item to '{short_group}' Asset Container")
            cmds.container(group_node, edit=True, addNode=color_node, force=False)
            cmds.select(clear=True)
            
            
        def connect_group_attributes_to_color_node(group_node, color_node):
            cmds.select(clear=True)
            cmds.connectAttr(f"{group_node}.Group_Color", f"{color_node}.inColor")
            cmds.connectAttr(f"{group_node}.Enable_Custom_Color", f"{color_node}.overrideEnabled")
            cmds.connectAttr(f"{group_node}.Enable_Custom_Color", f"{color_node}.overrideRGBColors")
            cmds.connectAttr(f"{group_node}.lineWidth", f"{color_node}.lineWidth")
            cmds.select(clear=True)
            
            
        for control_item in controls_list:
            print("\n")
            try:
                # Get the short name of the control for display purposes
                short_control_name = control_item.split('|')[-1].split(':')[-1]
                print(f"Processing control: {short_control_name}")
                
                # Create the color node and get its full path
                color_node = create_color_node(control_item)
                if not color_node or not cmds.objExists(color_node):
                    print(f"ERROR: Failed to create color node for {short_control_name}")
                    continue
                    
                print(f"Created color node: {color_node}")
                
                if connect_color_node_attributes_to_control(color_node, control_item):
                    connect_group_attributes_to_color_node(group_node, color_node)
                    add_node_to_container(group_node, color_node)
                else:
                    # Clean up created node if we're skipping this control
                    print(f"Cleaning up created node '{color_node}' for skipped control")
                    if cmds.objExists(color_node):
                        cmds.delete(color_node)
            except Exception as e:
                print(f"ERROR processing {control_item}: {str(e)}")
                # Continue with the next control rather than aborting the entire operation
        
    finally:
        cmds.undoInfo(closeChunk=True, chunkName="create_control_color_node")
            
            
create_and_connect_control_color()