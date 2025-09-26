# Maya Mirror Selected Nodes Tool - Complete Documentation

**Date**: September 25, 2025  
**Project**: Maya Rigging Tools - Mirror Selected Nodes  
**Status**: 80% Complete - Functional with minor issues to resolve

## 📋 Table of Contents
- [Overview](#overview)
- [System Architecture](#system-architecture)
- [File Structure](#file-structure)
- [Workflow Pipeline](#workflow-pipeline)
- [Script Documentation](#script-documentation)
- [Known Issues & Solutions](#known-issues--solutions)
- [Conversation History](#conversation-history)
- [Next Steps](#next-steps)

## Overview

A sophisticated Maya rigging tool that mirrors selected nodes from left (L) to right (R) side, preserving:
- Node hierarchy relationships
- Attribute connections
- Transform data
- Shape nodes
- Utility nodes (DG nodes)

### Key Features
- **Intelligent node classification** (DAG, DG, shapes, transforms)
- **Automatic data archiving** (version history)
- **JSON-based data persistence**
- **Configurable node filtering**
- **Comprehensive error logging**

## System Architecture

### Core Components

```
┌─────────────────────────────────────────────────────────┐
│                     main.py (Entry Point)                │
├─────────────────────────────────────────────────────────┤
│                    Data Collection Phase                 │
│  ├── store_selected_nodes.py                           │
│  ├── store_dag_nodes.py                                │
│  ├── store_transforms_with_shapes_data.py              │
│  ├── store_dag_nodes_without_shapes.py                 │
│  ├── store_dg_nodes_data.py                           │
│  ├── store_node_side_data.py                          │
│  ├── store_hierarchy_data.py                          │
│  └── store_connection_data.py                         │
├─────────────────────────────────────────────────────────┤
│                    Preparation Phase                     │
│  ├── create_mirror_hierarchy_data.py                   │
│  └── create_mirror_connection_data.py                  │
├─────────────────────────────────────────────────────────┤
│                    Duplication Phase                     │
│  ├── duplicate_dag_nodes_without_shapes.py             │
│  ├── duplicate_transforms_with_shapes.py               │
│  └── duplicate_dg_nodes.py                            │
├─────────────────────────────────────────────────────────┤
│                  Reconstruction Phase                    │
│  ├── parent_dag_nodes_without_shapes.py                │
│  └── parent_transforms_with_shapes.py                  │
└─────────────────────────────────────────────────────────┘
```

## File Structure

```
Mirror_Selected_Nodes/
├── main.py                              # Main workflow controller
├── global_paths.py                      # Path management
├── filter_utils.py                      # Node filtering utilities
├── ignored_nodes.json                   # Filter configuration
│
├── Data Collection Scripts/
│   ├── store_selected_nodes.py         # Basic node listing
│   ├── store_dag_nodes.py              # DAG node details
│   ├── store_transforms_with_shapes_data.py
│   ├── store_dag_nodes_without_shapes.py
│   ├── store_dg_nodes_data.py          # Utility nodes
│   ├── store_node_side_data.py         # L/R classification
│   ├── store_hierarchy_data.py         # Parent-child relationships
│   └── store_connection_data.py        # Node connections
│
├── Preparation Scripts/
│   ├── create_mirror_hierarchy_data.py  # Mirror hierarchy structure
│   └── create_mirror_connection_data.py # Mirror connections
│
├── Duplication Scripts/
│   ├── duplicate_dag_nodes_without_shapes.py
│   ├── duplicate_transforms_with_shapes.py
│   └── duplicate_dg_nodes.py
│
├── Parenting Scripts/
│   ├── parent_dag_nodes_without_shapes.py
│   └── parent_transforms_with_shapes.py
│
├── Utility Scripts/
│   ├── archive_json_data.py            # Data versioning
│   ├── mirror_selected_nodes.py        # Legacy mirroring logic
│   └── debug_hierarchy_data.py         # Debugging utilities
│
├── data/                                # Current operation data
│   ├── selected_nodes_data.json
│   ├── dag_nodes_data.json
│   ├── transforms_with_shapes_data.json
│   ├── dag_nodes_without_shapes_data.json
│   ├── dg_nodes_data.json
│   ├── node_side_data.json
│   ├── hierarchy_data.json
│   ├── connection_data.json
│   ├── mirrored_hierarchy_data.json
│   └── mirrored_connection_data.json
│
└── data_archive/                        # Historical data
    ├── data_001/
    ├── data_002/
    └── ... (up to data_029/)
```

## Workflow Pipeline

### Phase 1: Data Collection
1. **Archive existing data** - Preserves previous run data
2. **Store selected nodes** - Lists all selected nodes
3. **Classify nodes** - Separates DAG, DG, shapes, transforms
4. **Analyze sides** - Identifies L/R/none designation
5. **Map hierarchy** - Records parent-child relationships
6. **Map connections** - Records attribute connections

### Phase 2: Preparation
1. **Create mirrored hierarchy** - L→R hierarchy mapping
2. **Create mirrored connections** - L→R connection mapping

### Phase 3: Duplication
1. **Duplicate DAG nodes without shapes** - Groups, transforms, joints
2. **Duplicate transforms with shapes** - Curves with shape nodes
3. **Duplicate DG nodes** - Utility nodes (multMatrix, etc.)

### Phase 4: Reconstruction
1. **Parent DAG nodes** - Rebuild hierarchy for non-shape nodes
2. **Parent transforms with shapes** - Rebuild hierarchy for shape nodes
3. **Restore connections** - *(Not yet implemented)*

## Script Documentation

### Core Scripts

#### `main.py`
- **Purpose**: Entry point and workflow orchestrator
- **Key Features**:
  - Hardcoded path for Maya compatibility
  - Module reloading for development
  - Sequential execution of all phases
- **Status**: ✅ Working

#### `global_paths.py`
- **Purpose**: Centralized path management
- **Key Features**:
  - Single source of truth for all file paths
  - Platform-independent path handling
- **Status**: ✅ Working

#### `filter_utils.py`
- **Purpose**: Node filtering based on configuration
- **Key Functions**:
  - `should_ignore_node()` - Check if node should be filtered
  - `filter_nodes()` - Filter node lists
  - `should_ignore_connection()` - Filter connections
- **Configuration**: `ignored_nodes.json`
- **Status**: ✅ Working

### Data Collection Scripts

All data collection scripts follow similar patterns:
1. Load selection or specific node types
2. Extract relevant attributes
3. Save to JSON with metadata
4. Print summary

**Status**: ✅ All working correctly

### Preparation Scripts

#### `create_mirror_hierarchy_data.py`
- **Purpose**: Creates R-side hierarchy from L-side data
- **Key Function**: `mirror_hierarchy_data()`
- **Issue Fixed**: Was creating arrays of field names instead of proper objects
- **Status**: ✅ Fixed and working

#### `create_mirror_connection_data.py`
- **Purpose**: Creates R-side connections from L-side data
- **Key Function**: `mirror_connection_data()`
- **Status**: ✅ Working

### Duplication Scripts

#### Common Pattern:
1. Load node data and mirrored mappings
2. Filter for L-side nodes only
3. Create R-side duplicates
4. Remove from sets
5. Add to mirror_output set

**Status**: 
- ✅ DAG nodes without shapes - Working
- ✅ Transforms with shapes - Working
- ⚠️ DG nodes - Working but all use fallback method

### Parenting Scripts

**Current Issue**: Attempting to parent to non-existent parents
**Status**: ❌ Need fixing - parent nodes don't exist when parenting is attempted

## Known Issues & Solutions

### Issue 1: Parenting Order Problem
**Symptom**: 
```
R side parent {parent_name} does not exist in scene, skipping {node}
```

**Root Cause**: Trying to parent children before parents exist

**Solution**:
```python
# Sort nodes by hierarchy depth before parenting
def get_hierarchy_depth(node, hierarchy_data):
    depth = 0
    current = node
    while current in hierarchy_data and hierarchy_data[current].get("parent"):
        depth += 1
        current = hierarchy_data[current]["parent"]
    return depth

# Sort nodes by depth (root first)
sorted_nodes = sorted(nodes, key=lambda n: get_hierarchy_depth(n, hierarchy_data))
```

### Issue 2: Missing Connection Restoration
**Symptom**: Connections data prepared but never applied

**Solution**: Create `restore_connections.py`:
```python
def restore_connections():
    # Load mirrored_connection_data.json
    # For each node and connection
    # Apply using cmds.connectAttr()
```

### Issue 3: DG Node Duplication Falls Back to createNode
**Symptom**: Direct duplication failing for all utility nodes

**Analysis**: Utility nodes may not support direct duplication
**Current Workaround**: createNode fallback is working correctly

### Issue 4: Incorrect Mirrored Data Structure
**Original Problem**: Mirrored data contained only field names as arrays
**Solution Applied**: Fixed to properly deep copy and mirror all data
**Status**: ✅ Resolved

## Conversation History

### Key Topics Discussed

1. **Initial Problem**: Mirroring tool not maintaining hierarchy
2. **Discovery**: Mirrored JSON files had incorrect structure
3. **Solution Development**: Rewrote mirroring functions
4. **Testing**: Leg rig with 78 nodes (62 DAG, 17 DG, 9 transforms with shapes)
5. **Refinements**: Added proper data structure handling
6. **Current State**: Tool functional but needs parenting order fix

### Important Code Changes Made

1. **Fixed `create_mirror_hierarchy_data.py`**:
   - Deep copy node properties
   - Mirror all node references
   - Maintain proper object structure

2. **Fixed `create_mirror_connection_data.py`**:
   - Handle attribute paths correctly
   - Mirror node names in connections
   - Preserve connection types

3. **Updated all duplication scripts**:
   - Use mirrored hierarchy for naming
   - Fallback to pattern replacement
   - Better error handling

4. **Enhanced parenting scripts**:
   - Type checking for data structures
   - Better error messages
   - Handling of missing parents

## Next Steps

### Priority 1: Fix Parenting Order
- [ ] Implement hierarchy depth sorting
- [ ] Process root nodes first
- [ ] Ensure parents exist before parenting children

### Priority 2: Implement Connection Restoration
- [ ] Create `restore_connections.py`
- [ ] Read mirrored connection data
- [ ] Apply connections with error handling

### Priority 3: Add Transform Mirroring
- [ ] Mirror translateX values (* -1)
- [ ] Handle rotation appropriately
- [ ] Preserve scale values

### Priority 4: Validation System
- [ ] Compare L and R hierarchies
- [ ] Verify connection integrity
- [ ] Report missing or failed operations

### Priority 5: UI Development
- [ ] Create Maya UI window
- [ ] Add progress bars
- [ ] Provide operation options

## Testing Results

### Test Case: Leg Rig
- **Total Nodes**: 78
- **DAG Nodes**: 62
- **DG Nodes**: 17
- **Transforms with Shapes**: 9
- **DAG without Shapes**: 41

**Results**:
- ✅ All nodes duplicated successfully
- ✅ Naming convention properly mirrored (L→R)
- ❌ Parenting failed due to order issue
- ⚠️ Connections not restored (not implemented)

## Best Practices Identified

1. **Modular Design**: Each script has single responsibility
2. **Data Persistence**: JSON provides debugging capability
3. **Version Control**: Archive system preserves history
4. **Error Handling**: Comprehensive logging for debugging
5. **Configuration**: External config files for flexibility

## Conclusion

The Maya Mirror Selected Nodes tool represents a sophisticated approach to rigging automation. With 80% functionality complete, the remaining tasks are well-defined and achievable. The modular architecture makes the tool maintainable and extensible for future enhancements.

---

*Documentation generated: September 25, 2025*  
*Tool Version: 1.0 (In Development)*  
*Author: Development Team*