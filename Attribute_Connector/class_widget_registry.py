import weakref

class WidgetRegistry:
    def __init__(self):
        self._widgets_by_name = {}
        self._widgets_by_id = {}

    def register(self, widget, name=None):
        if name is None:
            name = widget.objectName() or f"widget_{id(widget)}"
        widget.setObjectName(name)
        self._widgets_by_name[name] = weakref.ref(widget)
        self._widgets_by_id[id(widget)] = weakref.ref(widget)

    def get(self, name=None, obj_id=None):
        if name and name in self._widgets_by_name:
            w = self._widgets_by_name[name]()
            if w is not None and self.is_valid(w):
                return w
        if obj_id and obj_id in self._widgets_by_id:
            w = self._widgets_by_id[obj_id]()
            if w is not None and self.is_valid(w):
                return w
        return None

    def unregister(self, widget):
        name = widget.objectName()
        obj_id = id(widget)
        self._widgets_by_name.pop(name, None)
        self._widgets_by_id.pop(obj_id, None)

    def is_valid(self, widget):
        try:
            return widget is not None and hasattr(widget, 'parent') and widget.parent() is not None
        except RuntimeError:
            return False

    def all_widgets(self):
        return [w() for w in self._widgets_by_id.values() if w() is not None]

# Global instance for Attribute Connector only
widget_registry = WidgetRegistry()
