import sys
import os

# Define the main workspace path
WORKSPACE_PATH = "/Users/zophiekat/Github_Repositories/Maya-Rigging-Tools"

# Add the workspace path to sys.path if it's not already there
if WORKSPACE_PATH not in sys.path:
    sys.path.append(WORKSPACE_PATH)

def ensure_path():
    """
    Ensures the workspace path is in sys.path
    Call this from any script that needs to import modules from this workspace
    """
    if WORKSPACE_PATH not in sys.path:
        sys.path.append(WORKSPACE_PATH)
        return True
    return False

def get_workspace_path():
    """
    Returns the workspace path
    """
    return WORKSPACE_PATH

def get_module_path(module_name):
    """
    Returns the path to a specific module within the workspace
    """
    return os.path.join(WORKSPACE_PATH, module_name)