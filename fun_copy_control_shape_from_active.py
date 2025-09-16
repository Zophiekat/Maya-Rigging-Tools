import json
from maya import cmds

def get_curve_shape(curve_object):
    print("\n")
    node_type = cmds.nodeType(curve_object)

    if node_type == "transform":
        node_shape = cmds.listRelatives(curve_object, shapes=True)
        if node_shape:
            node_transform_shape = cmds.nodeType(node_shape[0])
            if node_transform_shape == "nurbsCurve":
                return node_shape[0]
            else:
                print(f"Shape inside Transform Node is not 'nurbsCurve' type!")
                return None
        else:
            print(f"No shape found under transform node {curve_object}!")
            return None
    elif node_type == "nurbsCurve":
        return curve_object


def query_curve_properties(curve_name):
    print("\n")
    """Query specific properties of a curve."""
    if not cmds.objExists(curve_name):
        return None

    properties = {}
    properties['degree'] = cmds.getAttr(f'{curve_name}.degree')
    properties['spans'] = cmds.getAttr(f'{curve_name}.spans')
    properties['form'] = cmds.getAttr(f'{curve_name}.form')
    properties['minValue'] = cmds.getAttr(f'{curve_name}.minValue')
    properties['maxValue'] = cmds.getAttr(f'{curve_name}.maxValue')
    properties['arcLength'] = round(cmds.arclen(curve_name), 6)

    # Query CV count and properties for each CV in local space
    cv_count = cmds.getAttr(f'{curve_name}.controlPoints', size=True)
    properties['cv_count'] = cv_count
    properties['cvs'] = []
    for i in range(cv_count):
        cv_position_local = cmds.xform(f'{curve_name}.cv[{i}]', query=True, translation=True, worldSpace=False)

        # Use cmds.curveCVCtx to query additional CV properties
        context_name = "curveCVContext"
        if not cmds.contextInfo(context_name, exists=True):
            cmds.curveCVCtx(context_name)

        cv_properties = {
            'index': i,
            'position_local': cv_position_local,
            'degree': cmds.curveCVCtx(context_name, q=True, degree=True),
            'bezier': cmds.curveCVCtx(context_name, q=True, bezier=True),
            'symmetry': cmds.curveCVCtx(context_name, q=True, symmetry=True),
            'uniform': cmds.curveCVCtx(context_name, q=True, uniform=True)
        }
        properties['cvs'].append(cv_properties)

    return properties


def compare_curves(curve_infos):
    print("\n")
    """
    Compare two curves' information and find differences.
    
    Args:
        curve_infos (dict): Dictionary containing 'source' and 'target' curve properties
        
    Returns:
        dict: Dictionary containing differences between source and target curves
    """
    differences = {}
    
    for key in curve_infos['source'].keys():
        source_value = curve_infos['source'][key]
        target_value = curve_infos['target'][key]
        
        if source_value != target_value:
            differences[key] = {
                'source': source_value,
                'target': target_value
            }
    
    return differences


def format_curve_properties(curve_name, curve_info):
    print("\n")
    """
    Format curve properties for printing in a structured format.

    Args:
        curve_name: Name of the curve.
        curve_info: Dictionary containing curve properties.

    Returns:
        str: Formatted string of curve properties.
    """
    formatted = [f"{curve_name}:"]
    for key, value in curve_info.items():
        if key == "cvs":
            formatted.append("  CVs:")
            for cv in value:
                formatted.append(f"    {cv}")
        else:
            formatted.append(f"  {key}: {value}")
    return "\n".join(formatted)


def print_differences(differences):
    print("\nDifferences:")
    for key, value in differences.items():
        print(f"{key}:")
        if isinstance(value, dict):
            for sub_key, sub_value in value.items():
                print(f"  {sub_key}: {sub_value}")
        elif isinstance(value, list):
            print("  [")
            for item in value:
                print(f"    {item},")
            print("  ]")
        else:
            print(f"  {value}")


def print_cv_properties(curve_name, cvs):
    print("\n")
    """
    Print CV properties in JSON format for better readability.

    Args:
        curve_name: Name of the curve.
        cvs: List of CV properties.
    """
    print(f"CV properties for {curve_name}:")
    print(json.dumps(cvs, indent=4))


def adjust_cv_count_and_properties(source_curve_info, target_curve_name):
    # Clamp position values to 8 decimal places
    def clamp_positions(curve_cvs):
        for cv in curve_cvs:
            cv['position_local'] = [round(coord, 8) for coord in cv['position_local']]
        return curve_cvs

    # Apply clamping to source and target CVs
    source_curve_info['cvs'] = clamp_positions(source_curve_info['cvs'])

    # Query target curve properties
    target_curve_info = query_curve_properties(target_curve_name)
    target_curve_info['cvs'] = clamp_positions(target_curve_info['cvs'])

    # Compare curves and skip if they already match
    differences = compare_curves({"source": source_curve_info, "target": target_curve_info})
    if not differences:
        print(f"No differences found between source and target curves. Skipping adjustments for {target_curve_name}.")
        return

    # Print differences before operations
    print("Curve Properties:")
    print(format_curve_properties(target_curve_name, target_curve_info))
    print(format_curve_properties("Source Curve", source_curve_info))
    print("Differences before operations:")
    print_differences(differences)

    # Match the open/closed form of the source curve
    try:
        if source_curve_info['form'] == 2:  # Closed curve
            cmds.closeCurve(target_curve_name, constructionHistory=False, replaceOriginal=True)
            print(f"Set {target_curve_name} to closed to match the source curve.")
        elif source_curve_info['form'] == 0:  # Open curve
            cmds.rebuildCurve(target_curve_name, replaceOriginal=True, keepRange=0)
            print(f"Set {target_curve_name} to open to match the source curve.")
    except Exception as e:
        print(f"Error setting form for {target_curve_name}: {e}")

    # Rebuild the target curve to match the degree and spans of the source curve
    try:
        cmds.rebuildCurve(
            target_curve_name,
            degree=source_curve_info['degree'],
            spans=source_curve_info['spans'],
            keepRange=0,  # Rebuild entire curve
            replaceOriginal=True
        )
        print(f"Rebuilt {target_curve_name} to match degree and spans of the source curve.")
    except Exception as e:
        print(f"Error rebuilding curve {target_curve_name}: {e}")
        return

    # Adjust CV count explicitly if necessary
    source_cv_count = source_curve_info['cv_count']
    target_cv_count = cmds.getAttr(f'{target_curve_name}.controlPoints', size=True)

    if target_cv_count > source_cv_count:
        print(f"Target curve {target_curve_name} has more CVs ({target_cv_count}) than source ({source_cv_count}). Deleting extra CVs.")
        for i in range(target_cv_count - 1, source_cv_count - 1, -1):
            try:
                cmds.delete(f'{target_curve_name}.cv[{i}]')
                print(f"Deleted CV {i} from {target_curve_name}.")
            except Exception as e:
                print(f"Error deleting CV {i} from {target_curve_name}: {e}")
    elif target_cv_count < source_cv_count:
        print(f"Target curve {target_curve_name} has fewer CVs ({target_cv_count}) than source ({source_cv_count}). Adding CVs.")
        for i in range(target_cv_count, source_cv_count):
            try:
                cmds.insertKnotCurve(target_curve_name, parameter=source_curve_info['minValue'] + i * ((source_curve_info['maxValue'] - source_cv_count) / source_cv_count))
                print(f"Added CV {i} to {target_curve_name}.")
            except Exception as e:
                print(f"Error adding CV {i} to {target_curve_name}: {e}")

    # Update CV positions to match the source curve
    source_cvs = source_curve_info['cvs']
    for i, cv in enumerate(source_cvs):
        try:
            cmds.xform(f'{target_curve_name}.cv[{i}]', translation=cv['position_local'], worldSpace=False)
            print(f"Updated CV {i} position for {target_curve_name} to {cv['position_local']}.")
        except Exception as e:
            print(f"Error updating CV {i} for {target_curve_name}: {e}")

    # Update other properties to match the source curve
    try:
        cmds.setAttr(f'{target_curve_name}.minValue', source_curve_info['minValue'])
        cmds.setAttr(f'{target_curve_name}.maxValue', source_curve_info['maxValue'])
        print(f"Updated minValue and maxValue for {target_curve_name} to {source_curve_info['minValue']} and {source_curve_info['maxValue']}.")
    except Exception as e:
        print(f"Error updating properties for {target_curve_name}: {e}")

    # Print differences after operations
    updated_target_curve_info = query_curve_properties(target_curve_name)
    print("Curve Properties After Operations:")
    print(format_curve_properties(target_curve_name, updated_target_curve_info))
    print(format_curve_properties("Source Curve", source_curve_info))
    print("Differences after operations:")
    print_differences(compare_curves({"source": source_curve_info, "target": updated_target_curve_info}))


def recreate_curve_shape(curve_info, target_curve_name):
    print("\n")
    """
    Recreates a curve shape using curve information dictionary and matches differences.

    Args:
        curve_info: Dictionary containing curve properties from query_curve_properties()
        target_curve_name: Name of the target curve to replace

    Returns:
        str: Name of the created/modified curve
    """
    # Adjust CV count and properties to match the source curve
    adjust_cv_count_and_properties(curve_info, target_curve_name)

    # Match differences between source and target
    target_curve_info = query_curve_properties(target_curve_name)
    differences = compare_curves({"source": curve_info, "target": target_curve_info})
    print(f"Differences for {target_curve_name}: {differences}")

    # Print validation result
    print_validation_result(differences)

    return target_curve_name


def print_validation_result(differences):
    print("\n")
    """
    Print validation result based on differences.

    Args:
        differences: Dictionary containing differences between curves.
    """
    if not differences:
        print("Validation Passed: No differences found. The curves match perfectly.")
    else:
        print("Validation Failed: Differences remain between the curves.")
        print_differences(differences)


def copy_curve_shape_from_active():
    print("\n")
    selected_objects_list = cmds.ls(selection=True)
    print(f"selected_objects_list: {selected_objects_list}")
    if not selected_objects_list:
        print("No objects selected. Please select at least one curve.")
        return
    
    active_object = selected_objects_list[-1]
    print(f"active_object: {active_object}")
    
    target_objects_list = selected_objects_list[:-1]
    print(f"target_objects_list: {target_objects_list}")
    
    if not target_objects_list:
        print("Only one object selected. Need at least two objects (targets + source).")
        return
    
    active_curve = query_curve_properties(active_object)
    
    if active_curve:
        try:
            print(f"Source curve info: {active_curve}")
            
            for target_object in target_objects_list:
                target_shape = query_curve_properties(target_object)
                if target_shape:
                    result = recreate_curve_shape(active_curve, target_object)
                    if result:
                        print(f"Successfully copied curve shape to {target_object}")
                        # Print comparison after copy
                        updated_target_curve = query_curve_properties(target_object)
                        comparison = compare_curves({"source": active_curve, "target": updated_target_curve})
                        print(f"Comparison after copy for {target_object}: {comparison}")
                    else:
                        print(f"Failed to copy curve shape to {target_object}")
                else:
                    print(f"Skipping {target_object} - not a valid curve")
        except Exception as e:
            print(f"Error processing curve information: {e}")
    else:
        print(f"Active object {active_object} is not a valid curve")
        
copy_curve_shape_from_active()