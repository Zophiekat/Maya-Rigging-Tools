# Attribute Connector package initialization file
# This file makes the directory a proper Python package

# Import modules needed throughout the package
from Attribute_Connector.class_widget_registry import widget_registry

# Make template functionality available
from Attribute_Connector.attribute_connector_templates import (
    load_templates, 
    save_templates,
    save_current_connections_as_template
)
