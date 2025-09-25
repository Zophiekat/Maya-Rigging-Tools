import os
import sys
import inspect

class ProjectPaths:
    """Class to manage all project paths for the Maya Rigging Tools."""
    
    def __init__(self, base_path=None):
        # Use the provided base path if available
        if base_path:
            self.script_dir = base_path
        # Otherwise find the script directory - this handles whether run from Maya or command line
        elif hasattr(inspect, 'getframeinfo') and inspect.getframeinfo(inspect.currentframe()).filename:
            # When running in Maya or standard Python
            self.script_dir = os.path.dirname(os.path.abspath(inspect.getframeinfo(inspect.currentframe()).filename))
        else:
            # Fallback - use current working directory
            self.script_dir = os.path.dirname(os.path.abspath(__file__))
            
        # Project root directory (one level up from script dir)
        self.project_root = os.path.dirname(self.script_dir)
        
        # Tool-specific directories
        self.mirror_selected_nodes_dir = self.script_dir  # We're already in the Mirror_Selected_Nodes directory
        
        # Data directories
        self.data_dir = os.path.join(self.mirror_selected_nodes_dir, "data")
        self.versions_dir = os.path.join(self.mirror_selected_nodes_dir, "versions")
        
        # Ensure all directories exist
        self._ensure_directories_exist()
        
        # Add project directories to Python path for relative imports
        self._add_to_python_path()

    def _ensure_directories_exist(self):
        """Ensure all required directories exist."""
        directories = [
            self.data_dir,
            self.versions_dir
        ]
        
        for directory in directories:
            if not os.path.exists(directory):
                os.makedirs(directory)
                print(f"Created directory: {directory}")
    
    def _add_to_python_path(self):
        """Add relevant directories to Python path for imports."""
        paths_to_add = [
            self.project_root,
            self.mirror_selected_nodes_dir
        ]
        
        for path in paths_to_add:
            if path not in sys.path:
                sys.path.append(path)
                print(f"Added to Python path: {path}")
    
    def get_data_file_path(self, filename):
        """Get the full path to a data file."""
        return os.path.join(self.data_dir, filename)
    
    def get_version_file_path(self, filename):
        """Get the full path to a version file."""
        return os.path.join(self.versions_dir, filename)
    
    def get_latest_version_number(self, base_filename, extension='.py'):
        """Get the latest version number for a versioned file."""
        version_files = [f for f in os.listdir(self.versions_dir) 
                         if f.startswith(base_filename) and f.endswith(extension)]
        
        if not version_files:
            return -1  # No versions exist yet
            
        version_numbers = []
        for filename in version_files:
            # Extract version number between the base name and extension
            name_without_ext = filename[:-len(extension)]
            if '_' in name_without_ext:
                try:
                    version_str = name_without_ext.split('_')[-1]
                    version_numbers.append(int(version_str))
                except ValueError:
                    continue
                    
        return max(version_numbers) if version_numbers else -1


# Import the hardcoded path from the main module if it's been imported
try:
    from main import SCRIPT_DIR
    # Create a singleton instance with the hardcoded path
    PATHS = ProjectPaths(SCRIPT_DIR)
    print(f"Global paths initialized from main.py with path: {SCRIPT_DIR}")
except ImportError:
    # If main hasn't been imported yet, initialize with auto-detection
    PATHS = ProjectPaths()
    print("Global paths initialized with auto-detected paths")


# Example usage
if __name__ == "__main__":
    print("Project root:", PATHS.project_root)
    print("Mirror Selected Nodes directory:", PATHS.mirror_selected_nodes_dir)
    print("Data directory:", PATHS.data_dir)
    print("Versions directory:", PATHS.versions_dir)
    
    # Example of getting a data file path
    hierarchy_data_path = PATHS.get_data_file_path("hierarchy_data.json")
    print("Hierarchy data path:", hierarchy_data_path)