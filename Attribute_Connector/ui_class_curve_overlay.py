import sys
import importlib
from .class_widget_registry import widget_registry

# Defensive imports for widget deletion checks
try:
    import sip
except ImportError:
    sip = None
try:
    import shiboken6
except ImportError:
    shiboken6 = None

QtWidgets, QtCore, QtGui = None, None, None

def _get_pyside_modules():
    in_maya = False
    maya_version = None
    try:
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
    def __del__(self):
        print(f"[DEBUG] __del__ called for CurveOverlay: {self}")
    def get_socket_pos_and_occlusion(self, socket, occlusion_map=None):
    # print(f"[DEBUG] get_socket_pos_and_occlusion called for socket: {repr(socket)}")
        if sip is not None:
            if sip.isdeleted(socket):
                print(f"[DEBUG] Socket {repr(socket)} is deleted (sip)")
                return QtCore.QPoint(0, 0), False, None, None
        elif shiboken6 is not None:
            if not shiboken6.isValid(socket):
                print(f"[DEBUG] Socket {repr(socket)} is deleted (shiboken6)")
                return QtCore.QPoint(0, 0), False, None, None
    # print(f"[DEBUG] Socket {repr(socket)} is valid")
        parent = socket.parent()
        list_widget = None
        side = None
        item_index = None
        for col_name in ("source_column", "target_column"):
            col = getattr(self.parent(), col_name, None)
            if col and hasattr(col["list_widget"], "itemWidget"):
                for i in range(col["list_widget"].count()):
                    item = col["list_widget"].item(i)
                    widget = col["list_widget"].itemWidget(item)
                    # print(f"[DEBUG] Checking widget: {repr(widget)} for socket: {repr(socket)}")
                    try:
                        if widget and hasattr(widget, 'socket'):
                            if sip is not None:
                                if sip.isdeleted(widget.socket):
                                    # print(f"[DEBUG] widget.socket {repr(widget.socket)} is deleted (sip)")
                                    continue
                            elif shiboken6 is not None:
                                if not shiboken6.isValid(widget.socket):
                                    # print(f"[DEBUG] widget.socket {repr(widget.socket)} is deleted (shiboken6)")
                                    continue
                            if widget.socket is socket:
                                print(f"[DEBUG] Found matching widget.socket for socket: {repr(socket)} at index {i}")
                                list_widget = col["list_widget"]
                                side = col_name
                                item_index = i
                                break
                    except Exception as e:
                        # print(f"[DEBUG] Exception while checking widget.socket: {repr(e)}")
                        continue
        if not list_widget:
            # print(f"[DEBUG] No list_widget found for socket: {repr(socket)}")
            return self.mapFromGlobal(socket.mapToGlobal(socket.rect().center())), False, None, None
        socket_rect = socket.geometry()
        socket_pos_in_viewport = socket.mapTo(list_widget.viewport(), socket.rect().center())
        viewport_rect = list_widget.viewport().rect()
        if viewport_rect.contains(socket_pos_in_viewport):
            # print(f"[DEBUG] Socket {repr(socket)} is visible in viewport")
            return self.mapFromGlobal(socket.mapToGlobal(socket.rect().center())), False, None, None
        if socket_pos_in_viewport.y() < viewport_rect.top():
            occlusion_direction = 'top'
        elif socket_pos_in_viewport.y() > viewport_rect.bottom():
            occlusion_direction = 'bottom'
        else:
            occlusion_direction = 'top'
        parent_ui = self.parent()
        occlusion_grids = getattr(parent_ui, 'occlusion_grids', [])
        grid = None
        if side == 'source_column':
            grid_corner = 'top_right' if occlusion_direction == 'top' else 'bottom_right'
        else:
            grid_corner = 'top_left' if occlusion_direction == 'top' else 'bottom_left'
        for g in occlusion_grids:
            if g['parent_column']['list_widget'] is list_widget and g['corner'] == grid_corner:
                grid = g
                break
        if grid is None:
            # print(f"[DEBUG] No occlusion grid found, using fallback anchor for socket: {repr(socket)}")
            anchor_pt = list_widget.mapTo(self, list_widget.rect().topLeft())
        else:
            rect = list_widget.rect()
            if grid_corner == 'top_left':
                anchor_pt = list_widget.mapTo(self, rect.topLeft())
            elif grid_corner == 'top_right':
                anchor_pt = list_widget.mapTo(self, rect.topRight())
            elif grid_corner == 'bottom_left':
                anchor_pt = list_widget.mapTo(self, rect.bottomLeft())
            elif grid_corner == 'bottom_right':
                anchor_pt = list_widget.mapTo(self, rect.bottomRight())
            else:
                anchor_pt = list_widget.mapTo(self, rect.topLeft())
        if occlusion_map is not None:
            key = (list_widget, side, grid_corner)
            if key not in occlusion_map:
                occlusion_map[key] = []
            if sip is not None:
                if not sip.isdeleted(socket):
                    # print(f"[DEBUG] Adding socket {repr(socket)} to occlusion_map under key {key}")
                    occlusion_map[key].append(socket)
            elif shiboken6 is not None:
                if shiboken6.isValid(socket):
                    # print(f"[DEBUG] Adding socket {repr(socket)} to occlusion_map under key {key}")
                    occlusion_map[key].append(socket)
            else:
                # print(f"[DEBUG] Adding socket {repr(socket)} to occlusion_map under key {key} (no sip/shiboken6)")
                occlusion_map[key].append(socket)
            idx = occlusion_map[key].index(socket)
            total = len(occlusion_map[key])
        else:
            idx = 0
            total = 1
        if total <= 4:
            grid_size = 2
        elif total <= 9:
            grid_size = 3
        else:
            grid_size = 4
        cell_size = 8
        grid_length = cell_size * grid_size
        grid_origin_x = anchor_pt.x()
        grid_origin_y = anchor_pt.y()
        perimeter = (grid_size - 1) * 4
        if total > perimeter:
            perimeter = total
        pos_on_perimeter = idx % perimeter
        if pos_on_perimeter < grid_size - 1:
            row = 0
            col = pos_on_perimeter
        elif pos_on_perimeter < 2 * (grid_size - 1):
            row = pos_on_perimeter - (grid_size - 1)
            col = grid_size - 1
        elif pos_on_perimeter < 3 * (grid_size - 1):
            row = grid_size - 1
            col = (grid_size - 1) - (pos_on_perimeter - 2 * (grid_size - 1))
        else:
            row = (grid_size - 1) - (pos_on_perimeter - 3 * (grid_size - 1))
            col = 0
        grid_x = grid_origin_x + col * cell_size + cell_size // 2
        grid_y = grid_origin_y + row * cell_size + cell_size // 2
        overlay_point = QtCore.QPoint(int(round(grid_x)), int(round(grid_y)))
        occluded_diameter = int(16 * 0.5)
    # print(f"[DEBUG] Returning overlay_point: {overlay_point}, True, {side}, None, {occluded_diameter} for socket: {repr(socket)}")
        return overlay_point, True, side, None, occluded_diameter
    def __init__(self, parent, get_connections, get_dragging, get_drag_info, get_target_socket_connection_count, grid_x_offset=0, grid_y_offset=0):
        super().__init__(parent)
        self.get_connections = get_connections
        self.get_dragging = get_dragging
        self.get_drag_info = get_drag_info
        self.get_target_socket_connection_count = get_target_socket_connection_count
        self.setAttribute(QtCore.Qt.WA_TransparentForMouseEvents)
        self.setAttribute(QtCore.Qt.WA_NoSystemBackground)
        self.setAttribute(QtCore.Qt.WA_TranslucentBackground)
        self.setMouseTracking(True)
        # Grid position offsets in pixels
        self.grid_x_offset = grid_x_offset
        self.grid_y_offset = grid_y_offset

    def paintEvent(self, event):
        try:
            painter = QtGui.QPainter(self)
            painter.setRenderHint(QtGui.QPainter.Antialiasing)
            occlusion_map = {}
            for connection in self.get_connections():
                # Unpack color if present, else default to red
                if len(connection) == 3:
                    source_socket, target_socket, color = connection
                else:
                    source_socket, target_socket = connection[:2]
                    color = QtCore.Qt.red
                # Get positions and occlusion info
                start_result = self.get_socket_pos_and_occlusion(source_socket, occlusion_map)
                if len(start_result) == 5:
                    start, start_occluded, start_arc_side, start_side, start_diam = start_result
                else:
                    start, start_occluded, start_arc_side, start_side = start_result
                    start_diam = 16
                end_result = self.get_socket_pos_and_occlusion(target_socket, occlusion_map)
                if len(end_result) == 5:
                    end, end_occluded, end_arc_side, end_side, end_diam = end_result
                else:
                    end, end_occluded, end_arc_side, end_side = end_result
                    end_diam = 16
                # Draw cubic Bezier curve between sockets
                path = QtGui.QPainterPath()
                path.moveTo(start)
                control_point_1 = QtCore.QPointF(start.x() + 50, start.y())
                control_point_2 = QtCore.QPointF(end.x() - 50, end.y())
                path.cubicTo(control_point_1, control_point_2, end)
                # Draw black outline
                pen = QtGui.QPen(QtCore.Qt.black)
                pen.setWidth(5)
                pen.setCapStyle(QtCore.Qt.RoundCap)
                painter.setPen(pen)
                painter.setBrush(QtCore.Qt.NoBrush)
                painter.drawPath(path)
                # Draw colored curve
                pen = QtGui.QPen(color)
                pen.setWidth(2)
                pen.setCapStyle(QtCore.Qt.RoundCap)
                painter.setPen(pen)
                painter.setBrush(QtCore.Qt.NoBrush)
                painter.drawPath(path)
                # Draw tapers at occluded ends
                if start_occluded:
                    painter.setBrush(color)
                    painter.setPen(QtGui.QPen(QtCore.Qt.black, 2))
                    painter.drawEllipse(start, start_diam // 2, start_diam // 2)
                if end_occluded:
                    painter.setBrush(color)
                    painter.setPen(QtGui.QPen(QtCore.Qt.black, 2))
                    painter.drawEllipse(end, end_diam // 2, end_diam // 2)
        except Exception as e:
            print(f"[DEBUG] Exception in paintEvent: {e}")
