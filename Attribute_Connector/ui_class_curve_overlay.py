import importlib

# Defensive imports for widget deletion checks
try:
    import sip
except ImportError:
    sip = None
try:
    import shiboken6
except ImportError:
    shiboken6 = None

def _get_pyside_modules():
    in_maya = False
    maya_version = None
    try:
        # Import maya modules conditionally to avoid errors when not in Maya
        import importlib.util
        if importlib.util.find_spec("maya"):
            import maya
            in_maya = True
            import maya.cmds as cmds
            maya_version = int(cmds.about(version=True))
    except Exception:
        pass
    if in_maya:
        if maya_version and maya_version >= 2025:
            try:
                PySide6 = importlib.import_module('PySide6')
                QtWidgets = importlib.import_module('PySide6.QtWidgets')
                QtCore = importlib.import_module('PySide6.QtCore')
                QtGui = importlib.import_module('PySide6.QtGui')
                return QtWidgets, QtCore, QtGui
            except ImportError:
                pass
        else:
            try:
                PySide2 = importlib.import_module('PySide2')
                QtWidgets = importlib.import_module('PySide2.QtWidgets')
                QtCore = importlib.import_module('PySide2.QtCore')
                QtGui = importlib.import_module('PySide2.QtGui')
                return QtWidgets, QtCore, QtGui
            except ImportError:
                pass
    try:
        PySide6 = importlib.import_module('PySide6')
        QtWidgets = importlib.import_module('PySide6.QtWidgets')
        QtCore = importlib.import_module('PySide6.QtCore')
        QtGui = importlib.import_module('PySide6.QtGui')
        return QtWidgets, QtCore, QtGui
    except ImportError:
        raise ImportError("Could not import PySide2 or PySide6. Please install PySide6.")

QtWidgets, QtCore, QtGui = _get_pyside_modules()


class CurveOverlay(QtWidgets.QWidget):
    def __init__(self, parent, get_connections, get_dragging, get_drag_info):
        super().__init__(parent)
        self.get_connections = get_connections
        self.get_dragging = get_dragging
        self.get_drag_info = get_drag_info
        self.setAttribute(QtCore.Qt.WA_TransparentForMouseEvents)
        self.setAttribute(QtCore.Qt.WA_NoSystemBackground)
        self.setAttribute(QtCore.Qt.WA_TranslucentBackground)
        self.setMouseTracking(True)

    def paintEvent(self, _):
        try:
            # Force occlusion grid update before painting
            parent_ui = self.parent()
            if hasattr(parent_ui, 'update_grid_boxes'):
                parent_ui.update_grid_boxes()
            painter = QtGui.QPainter(self)
            painter.setRenderHint(QtGui.QPainter.Antialiasing)
            occlusion_map = {}
            # Draw all established connections
            for connection in self.get_connections():
                if len(connection) == 3:
                    source_socket, target_socket, color = connection
                else:
                    source_socket, target_socket = connection[:2]
                    color = QtCore.Qt.red
                # Defensive: check widget validity before drawing
                try:
                    if sip is not None:
                        if sip.isdeleted(source_socket) or sip.isdeleted(target_socket):
                            continue
                    elif shiboken6 is not None:
                        if not shiboken6.isValid(source_socket) or not shiboken6.isValid(target_socket):
                            continue
                except Exception:
                    continue
                start_result = self.get_socket_pos_and_occlusion(source_socket, occlusion_map)
                start, start_occluded = start_result[:2]
                end_result = self.get_socket_pos_and_occlusion(target_socket, occlusion_map)
                end, end_occluded = end_result[:2]
                # Defensive: skip if start or end is None
                if start is None or end is None:
                    continue
                path = QtGui.QPainterPath()
                path.moveTo(start)
                control_point_1 = QtCore.QPointF(start.x() + 50, start.y())
                control_point_2 = QtCore.QPointF(end.x() - 50, end.y())
                path.cubicTo(control_point_1, control_point_2, end)
                pen = QtGui.QPen(QtCore.Qt.black)
                pen.setWidth(5)
                pen.setCapStyle(QtCore.Qt.RoundCap)
                painter.setPen(pen)
                painter.setBrush(QtCore.Qt.NoBrush)
                painter.drawPath(path)
                pen = QtGui.QPen(color)
                pen.setWidth(2)
                pen.setCapStyle(QtCore.Qt.RoundCap)
                painter.setPen(pen)
                painter.setBrush(QtCore.Qt.NoBrush)
                painter.drawPath(path)
                # Draw tapers at occluded ends (smaller circles)
                if start_occluded:
                    painter.setBrush(color)
                    painter.setPen(QtGui.QPen(QtCore.Qt.black, 2))
                    painter.drawEllipse(start, 4, 4)
                if end_occluded:
                    painter.setBrush(color)
                    painter.setPen(QtGui.QPen(QtCore.Qt.black, 2))
                    painter.drawEllipse(end, 4, 4)

            # Draw drag preview curve if dragging
            if self.get_dragging():
                start, end, color = self.get_drag_info()
                # Defensive: skip if start or end is None
                if start is None or end is None:
                    return
                path = QtGui.QPainterPath()
                path.moveTo(start)
                control_point_1 = QtCore.QPointF(start.x() + 50, start.y())
                control_point_2 = QtCore.QPointF(end.x() - 50, end.y())
                path.cubicTo(control_point_1, control_point_2, end)
                pen = QtGui.QPen(QtCore.Qt.black)
                pen.setWidth(5)
                pen.setCapStyle(QtCore.Qt.RoundCap)
                painter.setPen(pen)
                painter.setBrush(QtCore.Qt.NoBrush)
                painter.drawPath(path)
                pen = QtGui.QPen(color)
                pen.setWidth(2)
                pen.setCapStyle(QtCore.Qt.RoundCap)
                painter.setPen(pen)
                painter.setBrush(QtCore.Qt.NoBrush)
                painter.drawPath(path)
                # Draw tapers (smaller circles) at both ends for drag preview
                painter.setBrush(color)
                painter.setPen(QtGui.QPen(QtCore.Qt.black, 2))
                painter.drawEllipse(start, 4, 4)
                painter.drawEllipse(end, 4, 4)
        except Exception as e:
            # print(f"[DEBUG] Exception in paintEvent: {e}")
            pass
    
    def get_socket_pos_and_occlusion(self, socket, _=None):
        # Import occlusion_utils here to avoid circular imports
        try:
            from Attribute_Connector.occlusion_utils import get_socket_pos_and_occlusion as get_socket_utils
        except ImportError:
            # If import fails, we'll just use our internal implementation
            pass
            
        # Defensive: check for deleted widgets
        if sip is not None:
            if sip.isdeleted(socket):
                return QtCore.QPoint(0, 0), False, None, None
        elif shiboken6 is not None:
            if not shiboken6.isValid(socket):
                return QtCore.QPoint(0, 0), False, None, None
        list_widget = None
        for col_name in ("source_column", "target_column"):
            col = getattr(self.parent(), col_name, None)
            if col and hasattr(col["list_widget"], "itemWidget"):
                for i in range(col["list_widget"].count()):
                    item = col["list_widget"].item(i)
                    widget = col["list_widget"].itemWidget(item)
                    if widget and hasattr(widget, 'socket') and widget.socket is socket:
                        list_widget = col["list_widget"]
                        break
        if not list_widget:
            return self.mapFromGlobal(socket.mapToGlobal(socket.rect().center())), False, None, None
        # Always return the socket's center, even if occluded
        return self.mapFromGlobal(socket.mapToGlobal(socket.rect().center())), False, None, None
