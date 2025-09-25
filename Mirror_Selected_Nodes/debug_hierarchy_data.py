import json
from global_paths import PATHS

def debug_hierarchy_data():
    """Print hierarchy data to help with debugging."""
    hierarchy_path = PATHS.get_data_file_path("hierarchy_data.json")
    
    with open(hierarchy_path, 'r') as f:
        hierarchy_data = json.load(f)
    
    print("\n=== HIERARCHY DATA DEBUG INFO ===")
    print(f"Total nodes in hierarchy_data: {len(hierarchy_data)}")
    
    # Print a few example entries
    count = 0
    for node, info in hierarchy_data.items():
        if count < 5:  # Just show the first 5
            print(f"\nNode: {node}")
            print(f"  Parent: {info.get('parent', 'None')}")
            print(f"  Children: {info.get('children', [])[:3]}..." if len(info.get('children', [])) > 3 else f"  Children: {info.get('children', [])}")
        count += 1
    
    # Count L side nodes
    l_side_count = sum(1 for node in hierarchy_data if "_L" in node or "_L_" in node)
    print(f"\nL side nodes in hierarchy: {l_side_count}")
    
    # Find common issues
    print("\nChecking for common issues:")
    
    # Check if any L side nodes don't have parent info
    l_side_no_parent = [node for node in hierarchy_data 
                       if ("_L" in node or "_L_" in node) and 
                       ("parent" not in hierarchy_data[node] or not hierarchy_data[node]["parent"])]
    
    print(f"L side nodes without parent info: {len(l_side_no_parent)}")
    if l_side_no_parent:
        print(f"Examples: {l_side_no_parent[:3]}")
    
    print("\n=== END DEBUG INFO ===")
    
    return hierarchy_data

if __name__ == "__main__":
    debug_hierarchy_data()