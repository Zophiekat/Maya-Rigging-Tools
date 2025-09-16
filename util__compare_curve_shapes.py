from maya import cmds

def query_curve_properties(curve_name):
    """Query specific properties of a curve."""
    if not cmds.objExists(curve_name):
        return None

    properties = {}
    properties['degree'] = cmds.getAttr(f'{curve_name}.degree')
    properties['spans'] = cmds.getAttr(f'{curve_name}.spans')
    properties['form'] = cmds.getAttr(f'{curve_name}.form')
    properties['minValue'] = cmds.getAttr(f'{curve_name}.minValue')
    properties['maxValue'] = cmds.getAttr(f'{curve_name}.maxValue')
    properties['arcLength'] = cmds.arclen(curve_name)

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

def compare_curves(curves_properties):
    """Compare all curves for differences in their properties and CVs."""
    differences = {}
    curve_names = list(curves_properties.keys())

    # Compare general properties
    for key in ['degree', 'spans', 'form', 'minValue', 'maxValue', 'arcLength', 'cv_count']:
        values = {curve: curves_properties[curve][key] for curve in curve_names}
        if len(set(values.values())) > 1:  # If there are differences
            differences[key] = values

    # Compare CVs
    max_cv_count = max(curves_properties[curve]['cv_count'] for curve in curve_names)
    for i in range(max_cv_count):
        cv_differences = {}
        for curve in curve_names:
            if i < curves_properties[curve]['cv_count']:
                cv_differences[curve] = curves_properties[curve]['cvs'][i]
            else:
                cv_differences[curve] = None
        if len(set(str(cv_differences.values()))) > 1:  # If there are differences
            differences[f'cv_{i}'] = cv_differences

    return differences

def query_selected_curves_properties():
    """Query properties for all selected curves."""
    selected = cmds.ls(selection=True)
    curves_properties = {}

    for obj in selected:
        # Check if object is a curve
        if cmds.nodeType(obj) == 'nurbsCurve':
            curves_properties[obj] = query_curve_properties(obj)
        # Check if object has curve shapes
        else:
            shapes = cmds.listRelatives(obj, shapes=True, type='nurbsCurve')
            if shapes:
                for shape in shapes:
                    curves_properties[shape] = query_curve_properties(shape)

    return curves_properties

# Query and print the properties of selected curves
if __name__ == "__main__":
    result = query_selected_curves_properties()
    print("Curve Properties:")
    for curve, properties in result.items():
        print(f"{curve}:")
        for key, value in properties.items():
            if key == 'cvs':
                print("  CVs:")
                for cv in value:
                    print(f"    {cv}")
            else:
                print(f"  {key}: {value}")

    differences = compare_curves(result)
    print("\nDifferences:")
    for key, value in differences.items():
        print(f"{key}: {value}")
