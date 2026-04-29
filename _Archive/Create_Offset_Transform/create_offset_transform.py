from maya import cmds

selected_nodes_list = cmds.ls(selection = True)
print(selected_nodes_list)

for item in selected_nodes_list:
    offset_node_name = f"Ofs__{item}__trs"
    offset_node = cmds.createNode('transform', name = offset_node_name)
    cmds.matchTransform(offset_node, item)
    cmds.parent(item, offset_node)