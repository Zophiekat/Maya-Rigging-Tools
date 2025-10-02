import os
import shutil
import glob
import re
from maya import cmds

# Import the global paths
from global_paths import PATHS

def archive_json_data():
    """
    Archives all JSON files in the data folder by:
    1. Moving them to a numbered folder in data_archive (e.g., data_001)
    2. Adding an increment number suffix to the filenames
    """
    # Get the data directory from PATHS
    data_dir = PATHS.data_dir
    
    # Define data archive directory
    archive_dir = os.path.join(os.path.dirname(data_dir), "data_archive")
    if not os.path.exists(archive_dir):
        os.makedirs(archive_dir)
        print(f"Created archive directory: {archive_dir}")
    
    # Find next available archive folder number
    existing_folders = glob.glob(os.path.join(archive_dir, "data_*"))
    folder_numbers = []
    
    for folder in existing_folders:
        match = re.search(r'data_(\d+)$', folder)
        if match:
            folder_numbers.append(int(match.group(1)))
    
    next_number = 1
    if folder_numbers:
        next_number = max(folder_numbers) + 1
    
    # Create the new archive folder with padded number
    new_archive_folder = os.path.join(archive_dir, f"data_{next_number:03d}")
    os.makedirs(new_archive_folder)
    print(f"Created archive folder: {new_archive_folder}")
    
    # Get all JSON files in data directory
    json_files = glob.glob(os.path.join(data_dir, "*.json"))
    
    if not json_files:
        print("No JSON files found to archive.")
        return False
    
    # Archive each file with incremented name
    for json_file in json_files:
        file_name = os.path.basename(json_file)
        base_name = os.path.splitext(file_name)[0]
        extension = os.path.splitext(file_name)[1]
        
        # Create new filename with increment
        new_filename = f"{base_name}_{next_number:03d}{extension}"
        destination = os.path.join(new_archive_folder, new_filename)
        
        # Copy the file to the archive folder
        shutil.copy2(json_file, destination)
        print(f"Archived: {file_name} → {new_filename}")
    
    print(f"Successfully archived {len(json_files)} JSON files to {new_archive_folder}")
    return True

def run():
    """Run the JSON archiving tool directly."""
    return archive_json_data()

# Only run this code if the script is executed directly (not imported)
if __name__ == "__main__":
    run()