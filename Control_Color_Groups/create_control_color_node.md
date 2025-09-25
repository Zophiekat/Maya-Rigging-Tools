# Maya Control Color Node Script - Contribution Documentation

This document provides transparency about the development of the `create_control_color_node.py` script, detailing which parts were originally created by Zophiekat and which parts were added or modified with the assistance of GitHub Copilot.

- **Why GitHub Copilot help was requested**:
Zophiekat: "After I finished writting the script, I encountered
an error in which multiple shape nodes were found during the
cmds.connectAttr of the connect_color_node_attributes_to_control() function. I had spend a few hours on this tool and needed to get it working so it would not get in the way of a current commission task I was working on, so I felt it would be more time efficient to get the AI finish up the final details and fool proofs so I can move on.

I can always learn more about list filtering for items in non-destructive operations but thats for another day

I would also not have used dictionaries for this, like sure? the data workflow is more robust but it feels overkill for separating which nodes got duplicate names and which dont, but perhaps it is easier to handle when it comes to executing the operations without Maya errors or partially executed operations? idk."

## Authorship Overview

- **Original Script Author**: Zophiekat
- **AI-Assisted Modifications**: GitHub Copilot (September 2025)

## GitHub Copilot Request Sessions

1. **First Request (September 2023)**
   - Added initial duplicate name checking for selection list
   - Added shape node duplicate name checking
   - Implemented return values and error handling

2. **Second Request (September 2023)** 
   - Added check for transform node types
   - Added checking for name conflicts with other objects in the scene
   - Filtered for only nurbsCurve shape nodes
   - Enhanced error messages and added scene-wide name conflict detection
   
3. **Third Request (September 2023)**
   - Modified node type checking to accept dagContainer as the last selected item
   - Implemented skipping of non-transform nodes in the selection rather than aborting
   - Added explicit validation for the last selected item (must be dagContainer)
   - Enhanced user messaging for skipped nodes
   
4. **Fourth Request (September 2023)**
   - Fixed naming issues with color nodes by using short names instead of full paths
   - Added exception handling for individual control processing
   - Improved node existence validation and error reporting
   - Added more detailed progress and error messages
   
5. **Fifth Request (September 2023)**
   - Modified output messages to use short names for better readability
   - Preserved full paths only when needed for debugging or showing duplicates
   - Enhanced user experience with cleaner console output
   - Made error messages more readable while maintaining debugging information

## Original Components (Created by Zophiekat)

The following components were entirely created by Zophiekat in the original implementation:

- The overall structure and logic of the `create_and_connect_control_color()` function
- All core functionality including:
  - The attribute creation system
  - Color node creation process
  - Connection of attributes between nodes
  - Integration with Maya's container system
  - All Maya command interactions (cmds.*)
- All nested helper functions:
  - `create_attribute()`
  - `create_color_node()`
  - `connect_color_node_attributes_to_control()`
  - `add_node_to_container()`
  - `connect_group_attributes_to_color_node()`
- The undo chunk management

## AI-Assisted Modifications (Added by GitHub Copilot)

The following components were added or modified with the assistance of GitHub Copilot:

### New Imports
- Added `from collections import defaultdict` for managing duplicate detection

### Duplicate Name Detection for Selection List
- Added code to check for duplicate names in the selection list:
```python
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
```

### Shape Node Duplicate Name Detection
- Added code to check for duplicate shape names in the `connect_color_node_attributes_to_control()` function:
```python
# Check for shapes with duplicate names
if visible_shapes_list:
    shape_names = defaultdict(list)
    for shape in visible_shapes_list:
        short_name = shape.split('|')[-1].split(':')[-1]
        shape_names[short_name].append(shape)
    
    duplicate_shapes = {name: paths for name, paths in shape_names.items() if len(paths) > 1}
    if duplicate_shapes:
        print(f"\nERROR: Skipping control '{control_node}' - Duplicate shape names found:")
        for name, paths in duplicate_shapes.items():
            print(f"  Shape name '{name}' is used by multiple shapes:")
            for path in paths:
                print(f"    - {path}")
        return False
```

### Function Return Values
- Modified the `connect_color_node_attributes_to_control()` function to return boolean values:
```python
return True  # Added at the end of the function
```

### Control Loop Modification
- Updated the main control loop to handle skipping controls with duplicate shape names:
```python
for control_item in controls_list:
    print("\n")
    color_node = create_color_node(control_item)
    if connect_color_node_attributes_to_control(color_node, control_item):  # Check return value
        connect_group_attributes_to_color_node(group_node, color_node)
        add_node_to_container(group_node, color_node)
    else:
        # Clean up created node if we're skipping this control
        print(f"Cleaning up created node '{color_node}' for skipped control")
        if cmds.objExists(color_node):
            cmds.delete(color_node)
```

## Summary of Changes from First Request

GitHub Copilot added initial error-checking functionality to:
1. Prevent operation on objects with duplicate names in the selection list
2. Skip individual controls that have shapes with duplicate names
3. Provide detailed error messages for easier troubleshooting
4. Clean up any created nodes for skipped controls

## Additional Updates from Second Request

After receiving the error `TypeError: file <maya console> line 96: More than one object matches name: CTR_Leg_K_Pole_L_crvShape`, the following improvements were made:

1. Added scene-wide duplicate name checking to prevent node name conflicts
2. Added filtering to only process nurbsCurve shape nodes
3. Enhanced error messages with detailed path information 
4. Improved use of long paths throughout the script to avoid ambiguity

## Additional Updates from Third Request

After receiving the error `ERROR: Only transform nodes can be processed`, the following improvements were made:

1. Modified the node type checking to accept the last selected item as a dagContainer
2. Changed the behavior to skip non-transform nodes rather than abort the operation
3. Added proper validation to ensure the last item is a dagContainer (color group)
4. Added informative messages about skipped non-transform nodes
5. Improved the control list filtering to only include transform nodes

## Additional Updates from Fourth Request

After receiving the error `ValueError: No object matches name: |Rig|Controls_grp|...|CTR_Leg_IK_Pole_L_crv__Control_Color`, the following improvements were made:

1. Modified the color node naming to use short names instead of full DAG paths
2. Added exception handling to prevent a single control failure from stopping the entire process
3. Improved error reporting with more specific messages
4. Enhanced node existence validation
5. Added try-except blocks to gracefully handle errors for each control

## Additional Updates from Fifth Request

After receiving feedback about readability of console output, the following improvements were made:

1. Modified print statements to use short node names for standard messages
2. Kept full paths only when needed for debugging duplicate node issues
3. Made error messages more concise and readable
4. Enhanced the visual clarity of the console output
5. Improved user experience with cleaner, more focused messaging

The core functionality and structure of the original script were preserved, with the AI-assisted modifications focusing on adding validation and error handling to make the script more robust.

## Conversation History

Below is the conversation history between Zophiekat and GitHub Copilot:

### First Request
**Zophiekat:**
> hi can you help me edit this Maya Python script please?
> 
> inside the create_and_connect_control_color() function, i need for after the selection_list variable has been defined from cmds.ls to check for items in the list with duplicate names. if duplicate names are found then it should skip all operations and print a message with the name used by multiple nodes and the full dag path or dg path of the node.
> 
> if no duplicate names were found then proceed but make another check for the visible_shapes_list variable. if the control_node being used in the connect_color_node_attributes_to_control() function has shapes that share the same name then it should be skipped and print a message alerting the user

**GitHub Copilot:**
> [Implemented the initial error checking and duplicate name detection]

### Second Request
**Zophiekat:**
> thanks, can you create a .md file of the same name as this .py file in which it details and compares which parts of the script were edited or fully made by Copilot (that is you) and which parts were created by me (Zophiekat) please?
> 
> i would like to show proof of my work but i also want to detail full transparency as to which work was made with the aid of AI

**GitHub Copilot:**
> [Created the initial markdown documentation file]

### Third Request
**Zophiekat:**
> # Error: TypeError: file <maya console> line 96: More than one object matches name: CTR_Leg_K_Pole_L_crvShape
>
> lets also section the number of Copilot requests in the .md, please keep my edits about notes and reasons.
>
> lets also include my messages and conversation history at the very bottom of the .mb file.
>
> anyway, to fix this we will need to check for all items in the scene to see if any of them have a duplicate name with our selection or shape nodes.
>
> we should also check if transform nodes are in our selection before doing anything else, and if there are to check for their relatives with cmds.listRelatives for their notIntermediateObject children, then get the nodeType of the children. if nodeType is nurbsCurve then they will be operated on, if they are not they will be ignored and skipped

**GitHub Copilot:**
> [Implemented the additional error checking and updated the documentation]

### Fourth Request
**Zophiekat:**
> ERROR: Only transform nodes can be processed. The following selected objects are not transforms:
>  - |Rig|Viewport_Display_grp|Control_Color_Groups_grp|Color_Group__L_3rd__Asset (type: dagContainer)
> Operation aborted. Please select only transform nodes.
>
>
> any node can be selected but every other node type will simply be ignored instead of triggering an error.
>
> the selection of index -1 should always be a dagContainer node type

**GitHub Copilot:**
> [Modified the node selection logic to accept dagContainer as the last item and skip non-transform nodes]

### Fifth Request
**Zophiekat:**
> # Warning: Removing invalid characters from name.
> # Error: ValueError: file <maya console> line 97: No object matches name: |Rig|Controls_grp|Controls_Leg_L_grp|Controls_Leg_IK_L_grp|Offset_CTR_Leg_IK_Pole_L_trs|CTR_Leg_IK_Pole_L_crv__Control_Color

**GitHub Copilot:**
> [Fixed the color node naming issues and added exception handling for better error recovery]

### Sixth Request
**Zophiekat:**
> only use full names for debugging duplicate names. we dont need the full dag path for regular prints 
>
> Processing control: CTR_Leg_IK_Pole_L_crv
> Create 'Override' attribute
> Create 'Override RGB Colors' attribute
> Create 'Line Width' attribute
> Created color node: CTR_Leg_IK_Pole_L_crv__Control_Color
> nurbsCurve shapes: ['|Rig|Controls_grp|Controls_Leg_L_grp|Controls_Leg_IK_L_grp|Offset_CTR_Leg_IK_Pole_L_trs|CTR_Leg_IK_Pole_L_crv|CTR_Leg_K_Pole_L_crvShape']
> 'lineWidth' exists on |Rig|Controls_grp|Controls_Leg_L_grp|Controls_Leg_IK_L_grp|Offset_CTR_Leg_IK_Pole_L_trs|CTR_Leg_IK_Pole_L_crv|CTR_Leg_K_Pole_L_crvShape
> Add 'CTR_Leg_IK_Pole_L_crv__Control_Color' Node Item to '|Rig|Viewport_Display_grp|Control_Color_Groups_grp|Color_Group__L_3rd__Asset' Asset Container

**GitHub Copilot:**
> [Improved print statements to use short names for regular messaging, maintaining full paths only for debugging]