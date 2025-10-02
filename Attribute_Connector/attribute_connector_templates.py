"""
Template management module for the Attribute Connector tool.
Handles loading, saving, and applying connection templates.
"""
import os
import json
import traceback
from pathlib import Path


def get_templates_file_path():
    """Get the path to the templates JSON file."""
    # Get the directory of this file (attribute_connector_templates.py)
    current_dir = Path(os.path.dirname(os.path.abspath(__file__)))
    return current_dir / "attribute_connector_templates.json"


def load_templates():
    """
    Load connection templates from the JSON file.
    
    Returns:
        list: List of template dictionaries with name, description, and connections
    """
    try:
        templates_path = get_templates_file_path()
        if not templates_path.exists():
            print(f"Templates file not found: {templates_path}")
            return []
            
        with open(templates_path, 'r') as f:
            data = json.load(f)
            
        return data.get("templates", [])
    except Exception as e:
        print(f"Error loading templates: {e}")
        traceback.print_exc()
        return []


def save_templates(templates_list):
    """
    Save connection templates to the JSON file.
    
    Args:
        templates_list (list): List of template dictionaries
    
    Returns:
        bool: True if successful, False otherwise
    """
    try:
        templates_path = get_templates_file_path()
        data = {"templates": templates_list}
        
        with open(templates_path, 'w') as f:
            json.dump(data, f, indent=4)
            
        return True
    except Exception as e:
        print(f"Error saving templates: {e}")
        traceback.print_exc()
        return False


def save_current_connections_as_template(name, description, connections):
    """
    Save the current connection setup as a new template.
    
    Args:
        name (str): Template name
        description (str): Template description
        connections (list): List of connection dictionaries
    
    Returns:
        bool: True if successful, False otherwise
    """
    try:
        # Load existing templates
        templates = load_templates()
        
        # Check if a template with this name already exists
        for i, template in enumerate(templates):
            if template["name"] == name:
                # Update existing template
                templates[i] = {
                    "name": name,
                    "description": description,
                    "connections": connections
                }
                return save_templates(templates)
        
        # Add new template
        templates.append({
            "name": name,
            "description": description,
            "connections": connections
        })
        
        return save_templates(templates)
    except Exception as e:
        print(f"Error saving template: {e}")
        traceback.print_exc()
        return False
