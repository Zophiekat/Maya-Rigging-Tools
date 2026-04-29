from maya import cmds

print("")
selected_nodes_list = cmds.ls(selection = True)

active_node = selected_nodes_list[-1]
print(f"active_node: {active_node}")

active_shape = cmds.listRelatives(f"{active_node}", shapes = True)[0]
print(f"active_shape: {active_shape}")

print("")

items_list = selected_nodes_list[:-1]

for item in items_list:
    owner_shape = cmds.listRelatives(f"{item}", shapes = True)[0]
    print(f"owner_shape: {owner_shape}")
    
    print(f"delete shape")
    cmds.delete(f"{owner_shape}")
    
    print(f"parent as instance")
    cmds.parent(
            f"{active_shape}",
            f"{item}",
            shape = True,
            add = True
            )
    
    