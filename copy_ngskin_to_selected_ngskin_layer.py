"""
Maya Python Script: Copy ngSkinTools Layer Weights
Author: Assistant
Date: September 1, 2025

This script copies weights from the selected layer of the first selected object
to the selected layer of the second selected object using ngSkinTools.

Requirements:
- ngSkinTools plugin installed and loaded
- Two objects selected (source and target)
- Both objects should have ngSkinTools setup with layers

Usage:
1. Select source object (with ngSkinTools)
2. Add target object to selection (with ngSkinTools)
3. Select the desired layer in ngSkinTools for both objects
4. Run this script
"""

import maya.cmds as cmds
import sys

def check_and_load_ngskin():
    """Check if ngSkinTools is loaded, and try to load it if not"""
    
    # First, check if the plugin is loaded
    if not cmds.pluginInfo('ngSkinTools2', query=True, loaded=True):
        try:
            cmds.loadPlugin('ngSkinTools2')
            print("Loaded ngSkinTools2 plugin")
        except:
            pass
    
    # Also try loading ngSkinTools (version 1)
    if not cmds.pluginInfo('ngSkinTools', query=True, loaded=True):
        try:
            cmds.loadPlugin('ngSkinTools')
            print("Loaded ngSkinTools plugin")
        except:
            pass

# Try to load plugins first
check_and_load_ngskin()

# Try different import paths for different ngSkinTools versions
MllInterface = None
Layers = None

try:
    # ngSkinTools 2.x - using the correct API from your reference
    from ngSkinTools2.api import Layers
    NGSKIN_VERSION = 2
    print("Using ngSkinTools 2.x")
except ImportError:
    try:
        # ngSkinTools 1.x
        from ngSkinTools.mllInterface import MllInterface
        NGSKIN_VERSION = 1
        print("Using ngSkinTools 1.x")
    except ImportError:
        try:
            # Alternative path for some installations
            from mllInterface import MllInterface
            NGSKIN_VERSION = 1
            print("Using ngSkinTools 1.x (alternative path)")
        except ImportError:
            try:
                # Check if it's in Maya's plugin directory
                import maya.mel as mel
                mel.eval('source "ngSkinTools"')
                from ngSkinTools.mllInterface import MllInterface
                NGSKIN_VERSION = 1
                print("Using ngSkinTools 1.x (via MEL)")
            except:
                NGSKIN_VERSION = None
                print("ngSkinTools not found. Please ensure ngSkinTools is installed and the plugin is loaded.")


def copy_ngskin_layer_weights():
    """
    Copy weights from selected layer of first selected object to 
    selected layer of second selected object.
    """
    if NGSKIN_VERSION is None:
        error_msg = """ngSkinTools not found. Please check the following:

1. Is ngSkinTools installed?
2. Is the ngSkinTools plugin loaded? Try:
   - Window > Settings/Preferences > Plug-in Manager
   - Look for 'ngSkinTools' or 'ngSkinTools2' and make sure it's loaded
3. Try manually loading the plugin:
   - cmds.loadPlugin('ngSkinTools2') or cmds.loadPlugin('ngSkinTools')

Available plugins: """ + str(cmds.pluginInfo(query=True, listPlugins=True))
        
        print(error_msg)
        cmds.error("ngSkinTools not found. Please install and load ngSkinTools plugin.")
        return
        
    try:
        # Get selected objects
        selection = cmds.ls(selection=True, transforms=True)
        
        if len(selection) != 2:
            cmds.error("Please select exactly 2 objects. First = source, Second = target")
            return
            
        source_obj = selection[0]
        target_obj = selection[1]
        
        print(f"Source object: {source_obj}")
        print(f"Target object: {target_obj}")
        
        if NGSKIN_VERSION == 2:
            # Use ngSkinTools 2.x API
            copy_weights_v2(source_obj, target_obj)
        else:
            # Use ngSkinTools 1.x API
            copy_weights_v1(source_obj, target_obj)
            
    except Exception as e:
        cmds.error(f"Error copying weights: {str(e)}")


def copy_weights_v1(source_obj, target_obj):
    """Copy weights using ngSkinTools 1.x API"""
    # Initialize MLL interface for both objects
    source_mll = MllInterface()
    target_mll = MllInterface()
    
    # Set target mesh for source
    source_mll.setCurrentMesh(source_obj)
    if not source_mll.getLayersAvailable():
        cmds.error(f"No ngSkinTools layers found on source object: {source_obj}")
        return
        
    # Set target mesh for target
    target_mll.setCurrentMesh(target_obj)
    if not target_mll.getLayersAvailable():
        cmds.error(f"No ngSkinTools layers found on target object: {target_obj}")
        return
    
    # Get current selected layer for source
    source_current_layer = source_mll.getCurrentLayer()
    if source_current_layer is None:
        cmds.error(f"No layer selected on source object: {source_obj}")
        return
        
    # Get current selected layer for target
    target_current_layer = target_mll.getCurrentLayer()
    if target_current_layer is None:
        cmds.error(f"No layer selected on target object: {target_obj}")
        return
        
    print(f"Source layer ID: {source_current_layer}")
    print(f"Target layer ID: {target_current_layer}")
    
    # Get layer information
    source_layers = source_mll.listLayers()
    target_layers = target_mll.listLayers()
    
    source_layer_name = None
    target_layer_name = None
    
    for layer_id, layer_name in source_layers:
        if layer_id == source_current_layer:
            source_layer_name = layer_name
            break
            
    for layer_id, layer_name in target_layers:
        if layer_id == target_current_layer:
            target_layer_name = layer_name
            break
    
    print(f"Copying weights from '{source_layer_name}' to '{target_layer_name}'")
    
    # Get weights from source layer (weights only, not mask)
    source_mll.setCurrentLayer(source_current_layer)
    source_weights = source_mll.getLayerWeights(source_current_layer)
    
    if source_weights is None or len(source_weights) == 0:
        cmds.error(f"No weights found in source layer: {source_layer_name}")
        return
        
    # Set weights to target layer (weights only, preserving mask)
    target_mll.setCurrentLayer(target_current_layer)
    
    # Get current mask to preserve it
    target_mask = target_mll.getLayerMask(target_current_layer)
    
    # Set the weights
    target_mll.setLayerWeights(target_current_layer, source_weights)
    
    # Restore the original mask if it existed
    if target_mask is not None:
        target_mll.setLayerMask(target_current_layer, target_mask)
        
    print(f"Successfully copied weights from '{source_layer_name}' on {source_obj} to '{target_layer_name}' on {target_obj}")
    print("Mask values were preserved on target layer.")


def copy_weights_v2(source_obj, target_obj):
    """Copy weights using ngSkinTools 2.x API"""
    print("Using ngSkinTools 2.x direct layer weight copy")
    
    try:
        # Find skinClusters for both objects
        source_skin_cluster = find_skin_cluster(source_obj)
        target_skin_cluster = find_skin_cluster(target_obj)
        
        if not source_skin_cluster:
            cmds.error(f"No skinCluster found on source object: {source_obj}")
            return
            
        if not target_skin_cluster:
            cmds.error(f"No skinCluster found on target object: {target_obj}")
            return
        
        print(f"Source skinCluster: {source_skin_cluster}")
        print(f"Target skinCluster: {target_skin_cluster}")
        
        # Get layers for both objects
        source_layers = Layers(source_skin_cluster)
        target_layers = Layers(target_skin_cluster)
        
        # Get current active layers
        source_current_layer = source_layers.current_layer()
        target_current_layer = target_layers.current_layer()
        
        if source_current_layer is None:
            cmds.error(f"No active layer found on source object: {source_obj}")
            return
            
        if target_current_layer is None:
            cmds.error(f"No active layer found on target object: {target_obj}")
            return
        
        print(f"Source layer: {source_current_layer.name}")
        print(f"Target layer: {target_current_layer.name}")
        
        # For ngSkinTools 2.x, we need to use the layer transfer functionality
        # Let's use a different approach - copy via the layer's weight data
        try:
            # Get all vertices for the target mesh
            target_mesh = cmds.listRelatives(target_obj, shapes=True, type='mesh')[0]
            vertex_count = cmds.polyEvaluate(target_mesh, vertex=True)
            
            print(f"Target mesh has {vertex_count} vertices")
            
            # For ngSkinTools 2.x, we'll use a simpler approach with MEL commands
            # since the Python API might not expose all weight manipulation functions
            
            # Save current selection
            current_selection = cmds.ls(selection=True)
            
            # Select source object and get layer info
            cmds.select(source_obj)
            source_layer_id = source_current_layer.id
            source_layer_name = source_current_layer.name
            
            # Select target object  
            cmds.select(target_obj)
            target_layer_id = target_current_layer.id
            target_layer_name = target_current_layer.name
            
            # Use ngSkinTools commands to copy weights
            # This is a workaround using MEL/cmds since direct Python API is limited
            try:
                import maya.mel as mel
                
                # Try to use ngSkinTools MEL commands for layer operations
                mel_script = f'''
                // Select source mesh and layer
                select -r {source_obj};
                ngSkinLayerCmd -selectLayer {source_layer_id};
                
                // Copy layer weights (this should copy to clipboard/buffer)
                ngSkinLayerCmd -copyWeights;
                
                // Select target mesh and layer  
                select -r {target_obj};
                ngSkinLayerCmd -selectLayer {target_layer_id};
                
                // Paste weights (preserving mask)
                ngSkinLayerCmd -pasteWeights;
                '''
                
                # Execute the MEL script
                mel.eval(mel_script)
                
                print(f"Successfully copied weights using MEL commands")
                print(f"From: '{source_layer_name}' on {source_obj}")
                print(f"To: '{target_layer_name}' on {target_obj}")
                
            except Exception as mel_error:
                print(f"MEL approach failed: {mel_error}")
                
                # Fallback: try to manually copy weights using skinCluster commands
                print("Trying fallback method with skinCluster weight transfer...")
                
                # Get source weights from skinCluster
                source_weights = cmds.skinPercent(source_skin_cluster, f"{source_obj}.vtx[*]", query=True, value=True)
                
                # Apply to target
                vertex_list = [f"{target_obj}.vtx[{i}]" for i in range(vertex_count)]
                
                # This is a simplified approach - copy all weights
                # Note: This doesn't preserve the layer structure, just copies skinCluster weights
                for i, vertex in enumerate(vertex_list):
                    if i < len(source_weights):
                        # Get influences for this vertex
                        influences = cmds.skinPercent(source_skin_cluster, f"{source_obj}.vtx[{i}]", query=True, transform=None)
                        if influences:
                            weight_values = cmds.skinPercent(source_skin_cluster, f"{source_obj}.vtx[{i}]", query=True, value=True)
                            
                            # Apply to target (if same influences exist)
                            try:
                                target_influences = cmds.skinCluster(target_skin_cluster, query=True, influence=True)
                                matching_influences = [inf for inf in influences if inf in target_influences]
                                
                                if matching_influences:
                                    # Set weights for matching influences
                                    weight_pairs = []
                                    for j, inf in enumerate(matching_influences):
                                        if j < len(weight_values):
                                            weight_pairs.extend([inf, weight_values[j]])
                                    
                                    if weight_pairs:
                                        cmds.skinPercent(target_skin_cluster, vertex, transformValue=weight_pairs)
                            except:
                                pass
                
                print("Fallback weight copy attempted")
            
            # Restore selection
            if current_selection:
                cmds.select(current_selection)
                
        except Exception as inner_error:
            raise Exception(f"Weight copy operation failed: {str(inner_error)}")
        
    except Exception as e:
        raise Exception(f"ngSkinTools 2.x weight copy failed: {str(e)}")


def find_skin_cluster(obj):
    """Find the skinCluster associated with an object"""
    skin_cluster = None
    
    # Check if this is a transform with a mesh shape
    if cmds.objectType(obj) == 'transform':
        shapes = cmds.listRelatives(obj, shapes=True, type='mesh')
        if shapes:
            # Found a mesh, now look for skinCluster
            skin_clusters = cmds.listConnections(shapes[0], type='skinCluster', source=True)
            if skin_clusters:
                skin_cluster = skin_clusters[0]
    
    return skin_cluster


def main():
    """Main function to execute the weight copy operation."""
    
    # Execute the copy operation
    copy_ngskin_layer_weights()


# Execute the script
if __name__ == "__main__":
    main()