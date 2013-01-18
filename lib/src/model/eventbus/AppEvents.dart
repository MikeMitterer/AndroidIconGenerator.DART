
part of eventbus;

class AppEvents {
  HashMap<String, AppEventListenerList> _listenerMap;

  AppEvents() {
    _listenerMap = new HashMap<String, AppEventListenerList>();
  }

  AppEventListenerList operator [](String type) {
    type = type.toLowerCase();
    _listenerMap.putIfAbsent(type, () => new AppEventListenerList());
    return _listenerMap[type];
  }
}
