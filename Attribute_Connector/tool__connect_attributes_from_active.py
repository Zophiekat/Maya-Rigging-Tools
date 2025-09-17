import sys
import os
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

import logging
import pathlib

# Attribute Connector imports (new modular files)
from Attribute_Connector.class_widget_registry import widget_registry
from Attribute_Connector.attribute_connector_maya_utils import connect_node_attribute
from Attribute_Connector.occlusion_utils import get_socket_pos_and_occlusion
from Attribute_Connector.ui_class_curve_overlay import CurveOverlay
from Attribute_Connector.ui_class_attribute_connector import AttributeConnectorUI

# Setup logging to file in _debug_text_output
debug_dir = pathlib.Path(__file__).parent / '_debug_text_output'
debug_dir.mkdir(exist_ok=True)
log_file = debug_dir / 'attribute_connector_ui.log'
logging.basicConfig(
    level=logging.DEBUG,
    format='%(asctime)s %(levelname)s %(message)s',
    filename=str(log_file),
    filemode='a'
)

if __name__ == "__main__":
    try:
        from PySide2 import QtWidgets  # or PySide6, depending on your environment
    except ImportError:
        from PySide6 import QtWidgets
    try:
        app = QtWidgets.QApplication.instance()
        if app is None:
            app = QtWidgets.QApplication([])
        else:
            print("Using existing QApplication instance.")
        ui = AttributeConnectorUI()
        ui.show()
        app.exec()
    except Exception as e:
        print(f"Error: {e}")


