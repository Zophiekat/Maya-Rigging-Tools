from maya import cmds

selected_nodes_list = cmds.ls(selection = True)

DEF_joints_list = []
RIG_joints_list = []

target_attributes_list = [
    "translateX",
    "translateY",
    "translateZ",
    "rotateX",
    "rotateY",
    "rotateZ",
    "scaleX",
    "scaleY",
    "scaleZ"
    ]

source_attributes_list = [
    "outputTranslateX",
    "outputTranslateY",
    "outputTranslateZ",
    "outputRotateX",
    "outputRotateY",
    "outputRotateZ",
    "outputScaleX",
    "outputScaleY",
    "outputScaleZ"
    ]

matrix_value = [
    1.0, 0.0, 0.0, 0.0,
    0.0, 1.0, 0.0, 0.0,
    0.0, 0.0, 1.0, 0.0,
    0.0, 0.0, 0.0, 1.0
]

def store_selected_with_prefix_to_list(prefix, list):
    for item in selected_nodes_list:
        if prefix in item:
            print(f"Node: {item}")
            list.append(item)
            
    print(f"{list}")
    
    
store_selected_with_prefix_to_list("DEF_", DEF_joints_list)
store_selected_with_prefix_to_list("RIG_", RIG_joints_list)


for item in DEF_joints_list:
    RIG_joint_item = item.replace("DEF_", "RIG_")
    is_RIG_joint_exist = cmds.objExists(RIG_joint_item)
    print(f"RIG joint exist? {is_RIG_joint_exist} {RIG_joint_item}")
    
    if is_RIG_joint_exist == True:
        # Disconnect and set the offsetParentMatrix attribute
        connection_exact_source = cmds.connectionInfo(f'{item}.offsetParentMatrix', sourceFromDestination = True)
        print(f"connection_exact_source = {connection_exact_source}")
        
        # Unlock the attribute if it's locked
        if cmds.getAttr(f'{item}.offsetParentMatrix', lock=True):
            cmds.setAttr(f'{item}.offsetParentMatrix', lock=False)
            print(f"Unlocked {item}.offsetParentMatrix")
        
        # Disconnect if there's an existing connection
        if connection_exact_source:
            cmds.disconnectAttr(connection_exact_source, f'{item}.offsetParentMatrix')
            print(f"Disconnected {connection_exact_source} from {item}.offsetParentMatrix")
        
        cmds.setAttr(f'{item}.offsetParentMatrix', *matrix_value, type='matrix')

        
        decompose_matrix_node = f"DecompMatrix_{RIG_joint_item}"
        is_decompose_matrix_exist = cmds.objExists(decompose_matrix_node)
        
        if is_decompose_matrix_exist == True:
            pass
        else:
            print("wawa")
            cmds.createNode("decomposeMatrix", name = decompose_matrix_node, skipSelect = True)
            
        cmds.connectAttr(f"{RIG_joint_item}.worldMatrix[0]", f"{decompose_matrix_node}.inputMatrix", force = True)
        
        for index in range(len(source_attributes_list)):
            source_attribute = f"{source_attributes_list[index]}"
            target_attribute = f"{target_attributes_list[index]}"
            
            cmds.connectAttr(
                f"{decompose_matrix_node}.{source_attribute}",
                f"{item}.{target_attribute}",
                force = True
            )
        
        # Connect jointOrient attributes
        joint_orient_attributes = ["jointOrientX", "jointOrientY", "jointOrientZ"]
        for joint_orient_attr in joint_orient_attributes:
            cmds.connectAttr(
                f"{RIG_joint_item}.{joint_orient_attr}",
                f"{item}.{joint_orient_attr}",
                force = True
            )
        
        # Set rotation order to XYZ (0)
        cmds.setAttr(f"{item}.rotateOrder", 0)
        
        # Disable Inherit Transform
        cmds.ssetAttr(f"{item}.inheritsTransform", 0)

        
    