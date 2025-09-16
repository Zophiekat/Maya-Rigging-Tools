import maya.api.OpenMaya as om2


def get_selected_curves():
    """Get selected curve objects using pure OpenMaya 2.0"""
    selection_list = om2.MGlobal.getActiveSelectionList()
    selected_curves = []
    
    for i in range(selection_list.length()):
        try:
            # Try to get the dependency node
            mobject = selection_list.getDependNode(i)
            
            # Check if it's a transform
            if mobject.hasFn(om2.MFn.kTransform):
                # Get the transform function set
                transform_fn = om2.MFnTransform(mobject)
                
                # Get shape nodes under this transform
                for j in range(transform_fn.childCount()):
                    child = transform_fn.child(j)
                    if child.hasFn(om2.MFn.kNurbsCurve):
                        dag_path = om2.MDagPath.getAPathTo(child)
                        selected_curves.append((child, dag_path))
                        break
            
            # Check if it's already a curve shape
            elif mobject.hasFn(om2.MFn.kNurbsCurve):
                dag_path = om2.MDagPath.getAPathTo(mobject)
                selected_curves.append((mobject, dag_path))
                
        except Exception as e:
            print(f"Error processing selection {i}: {e}")
            continue
    
    return selected_curves


def get_curve_connections(mobject, dag_path, attribute_name):
    """Get incoming connections to a curve attribute using pure OpenMaya 2.0"""
    connections = []
    
    try:
        # Get the dependency node function set
        dep_fn = om2.MFnDependencyNode(mobject)
        
        # Find the attribute
        attr = dep_fn.attribute(attribute_name)
        plug = om2.MPlug(mobject, attr)
        
        # Get connected plugs
        connected_plugs = plug.connectedTo(True, False)  # True=asDst, False=asSrc
        
        for connected_plug in connected_plugs:
            connections.append(connected_plug)
            
    except Exception as e:
        print(f"Error getting connections for {attribute_name}: {e}")
    
    return connections


def disconnect_plug_connections(mobject, attribute_name):
    """Disconnect incoming connections to an attribute using pure OpenMaya 2.0"""
    disconnected_connections = []
    
    try:
        dep_fn = om2.MFnDependencyNode(mobject)
        attr = dep_fn.attribute(attribute_name)
        plug = om2.MPlug(mobject, attr)
        
        # Get connected plugs
        connected_plugs = plug.connectedTo(True, False)  # incoming connections
        
        for connected_plug in connected_plugs:
            try:
                # Create modifier to disconnect
                modifier = om2.MDGModifier()
                modifier.disconnect(connected_plug, plug)
                modifier.doIt()
                
                disconnected_connections.append((connected_plug, plug))
                print(f"Disconnected: {connected_plug.name()} -> {plug.name()}")
                
            except Exception as e:
                print(f"Error disconnecting {connected_plug.name()}: {e}")
                
    except Exception as e:
        print(f"Error processing disconnections for {attribute_name}: {e}")
    
    return disconnected_connections


def connect_attributes(source_mobject, target_mobject, attribute_name):
    """Connect attributes between two nodes using pure OpenMaya 2.0"""
    try:
        # Get function sets
        source_fn = om2.MFnDependencyNode(source_mobject)
        target_fn = om2.MFnDependencyNode(target_mobject)
        
        # Get attributes
        source_attr = source_fn.attribute(attribute_name)
        target_attr = target_fn.attribute(attribute_name)
        
        # Create plugs
        source_plug = om2.MPlug(source_mobject, source_attr)
        target_plug = om2.MPlug(target_mobject, target_attr)
        
        # Create modifier and connect
        modifier = om2.MDGModifier()
        modifier.connect(source_plug, target_plug)
        modifier.doIt()
        
        print(f"Connected: {source_plug.name()} -> {target_plug.name()}")
        return (source_plug, target_plug)
        
    except Exception as e:
        print(f"Error connecting {attribute_name}: {e}")
        return None


def disconnect_attributes(source_plug, target_plug):
    """Disconnect two plugs using pure OpenMaya 2.0"""
    try:
        modifier = om2.MDGModifier()
        modifier.disconnect(source_plug, target_plug)
        modifier.doIt()
        
        print(f"Disconnected: {source_plug.name()} -> {target_plug.name()}")
        return True
        
    except Exception as e:
        print(f"Error disconnecting {source_plug.name()} -> {target_plug.name()}: {e}")
        return False


def copy_curve_shape_data(source_mobject, target_mobject):
    """Copy curve shape data using pure OpenMaya 2.0"""
    try:
        print("Creating function sets...")
        # Create function sets for both curves
        source_curve_fn = om2.MFnNurbsCurve(source_mobject)
        target_curve_fn = om2.MFnNurbsCurve(target_mobject)
        
        print("Getting source curve data...")
        # Get control points from source curve
        source_cvs = source_curve_fn.cvPositions(om2.MSpace.kObject)
        
        print("Getting curve parameters...")
        # Get curve parameters
        source_degree = source_curve_fn.degree
        source_form = source_curve_fn.form
        source_knots = source_curve_fn.knots()
        
        print("Getting target curve info...")
        # Get target curve info for comparison
        target_degree = target_curve_fn.degree
        target_num_cvs = target_curve_fn.numCVs
        source_num_cvs = len(source_cvs)
        
        print(f"Source: {source_num_cvs} CVs, degree: {source_degree}")
        print(f"Target: {target_num_cvs} CVs, degree: {target_degree}")
        
        # Check if we can directly update the CVs
        if target_num_cvs == source_num_cvs and target_degree == source_degree:
            # Direct CV update
            print("Attempting direct CV update (same structure)...")
            try:
                target_curve_fn.setCVs(source_cvs, om2.MSpace.kObject)
                print("CVs set successfully, updating curve...")
                target_curve_fn.updateCurve()
                print("Curve updated successfully")
            except Exception as cv_error:
                print(f"Error during CV update: {cv_error}")
                import traceback
                traceback.print_exc()
                return False
                
        elif target_num_cvs == source_num_cvs:
            print("Attempting CV update only (different degree)...")
            try:
                target_curve_fn.setCVs(source_cvs, om2.MSpace.kObject)
                print("CVs set successfully, updating curve...")
                target_curve_fn.updateCurve()
                print("Curve updated successfully")
            except Exception as cv_error:
                print(f"Error during CV update: {cv_error}")
                import traceback
                traceback.print_exc()
                return False
        else:
            print(f"Cannot update: CV count mismatch ({target_num_cvs} vs {source_num_cvs})")
            return False
        
        print("Copy operation completed successfully")
        return True
        
    except Exception as e:
        print(f"Error in copy_curve_shape_data: {e}")
        import traceback
        print("Full traceback:")
        traceback.print_exc()
        return False


def copy_shape_from_active():
    """Main function to copy curve shape using pure OpenMaya 2.0"""
    
    try:
        # Get selected curves
        selected_curves = get_selected_curves()
        print(f"Found {len(selected_curves)} selected curves")
        
        if len(selected_curves) < 2:
            print("Please select at least 2 curves (targets + source as last selection)")
            return
        
        # Last selected is source, others are targets
        source_mobject, source_dag_path = selected_curves[-1]
        target_curves = selected_curves[:-1]
        
        source_name = source_dag_path.fullPathName()
        print(f"Source curve: {source_name}")
        
        # Attributes to manage
        attributes_list = ["controlPoints", "create"]
        
        # Process each target curve
        for target_mobject, target_dag_path in target_curves:
            target_name = target_dag_path.fullPathName()
            print(f"\nProcessing target: {target_name}")
            
            # Step 1: Disconnect incoming connections
            print("Step 1: Disconnecting incoming connections...")
            disconnected_connections = {}
            for attr_name in attributes_list:
                disconnected_connections[attr_name] = disconnect_plug_connections(target_mobject, attr_name)
            
            # Step 2: Connect source to target temporarily
            print("Step 2: Making temporary connections...")
            temp_connections = []
            for attr_name in attributes_list:
                connection = connect_attributes(source_mobject, target_mobject, attr_name)
                if connection:
                    temp_connections.append(connection)
            
            # Step 3: Copy curve shape data
            print("Step 3: Copying curve shape data...")
            success = copy_curve_shape_data(source_mobject, target_mobject)
            
            # Step 4: Disconnect temporary connections
            print("Step 4: Disconnecting temporary connections...")
            for source_plug, target_plug in temp_connections:
                disconnect_attributes(source_plug, target_plug)
            
            if success:
                print(f"Successfully copied shape to {target_name}")
            else:
                print(f"Failed to copy shape to {target_name}")
        
        print("\nShape copying completed!")
        
    except Exception as e:
        print(f"Error in copy_shape_from_active: {e}")


# Execute the function
copy_shape_from_active()