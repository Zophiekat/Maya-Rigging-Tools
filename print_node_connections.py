from maya import cmds

# Sophia Print Emojis Clipboard 🦴 ◀️ ▶️ ⬅️ ➡️ ⬅️🔘 🔘➡️🎴🃏🔷⬜️🟫⬛️🟥🔗▫️
selected_joints_list = cmds.ls(selection = True, type = 'joint')
print("\n")
print("selected_joints_list")
print(selected_joints_list)

for joint_item in selected_joints_list:
    substring = joint_item
    input_target_list = []
    input_owner_list = []
    output_target_list = []
    output_owner_list = []
    
    joint_item_children = cmds.listRelatives(
        joint_item,
        allDescendents = False,
        allParents = False,
        children = True,
        fullPath = False,
        noIntermediate = False,
        parent = False,
        path = False,
        shapes = False
        )
    
    joint_item_source_connections_list = cmds.listConnections(
        joint_item,
        connections = True,
        plugs = True,
        source = True,
        destination = False,
        fullNodeName = False
        ) or []
        
    joint_item_destination_connections_list = cmds.listConnections(
        joint_item,
        connections = True,
        plugs = True,
        source = False,
        destination = True
        ) or []
        
        
    for source_string_item in joint_item_source_connections_list:
        if substring in source_string_item:
            input_owner_list.append(source_string_item)
            
        else:
            input_target_list.append(source_string_item)
            
            
    for destination_string_item in joint_item_destination_connections_list:
        if substring in destination_string_item:
            output_owner_list.append(destination_string_item)
            
        else:
            output_target_list.append(destination_string_item)
    
    print(f"Name: {joint_item}\n")  
    # Combine the lists and iterate to print pairs row by row
    input_format_string = "{:<50} {:<50} {:<50}"
    output_format_string = "{:<51} {:<50} {:<50}"
    
    for source_attr, owner_attr in zip(input_target_list, input_owner_list):
        print(input_format_string.format(f"🔗 {source_attr}", f"◀️🔘▫️ {owner_attr}", f""))
    
    print("\n")
    
    for owner_attr, destination_attr in zip(output_owner_list, output_target_list):
        print(output_format_string.format(f"", f"▫️🔘▶️ {owner_attr}", f"🔗 {destination_attr}"))
        
    print("-" * 100)
    
    # disconnect attributes
    for source_attr, owner_attr in zip(input_target_list, input_owner_list):
        print(f"disconnect {source_attr} from {owner_attr}")
        cmds.disconnectAttr(source_attr, owner_attr)
 
    # unparent children
    def unparent_children():
        if not joint_item_children:
            return

        for child_item in joint_item_children:
            cmds.parent(child_item, world = True)
    unparent_children()
        
    # freeze transforms
    def freeze_transforms():
        print(f"freeze transforms")
        cmds.makeIdentity(
            joint_item,
            apply = True,
            jointOrient = True,
            translate = True,
            rotate = True,
            scale = True
            )
    freeze_transforms()
    
    # reconnect attributes
    def reconnect_attributes():
        for source_attr, owner_attr in zip(input_target_list, input_owner_list):
            print(f"connect {source_attr} to {owner_attr}")
            cmds.connectAttr(source_attr, owner_attr)
    reconnect_attributes()
    
    # reparent children
    def parent_children():
        if not joint_item_children:
            return
        
        for child_item in joint_item_children:
            cmds.parent(child_item, joint_item)
    parent_children()
    