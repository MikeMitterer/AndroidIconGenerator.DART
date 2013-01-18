
part of eventbus;

class AppEventListenerList {
  List<AppEventListener> _listenerList;

  AppEventListenerList() {
    _listenerList = new List<AppEventListener>();
  }

  AppEventListenerList add(AppEventListener handler) {
    _listenerList.add(handler);
    return this;
  }

  AppEventListenerList remove(AppEventListener handler) {
    int i = 0;
    while (i < _listenerList.length) {
      if (_listenerList[i] == handler) {
        _listenerList.removeRange(i, 1);
        continue;
      }
      i++;
    }
    return this;
  }

  bool dispatch(final AppEvent event) {
    // TODO where the returned bool should come from?
    for (AppEventListener handler in _listenerList) {
      handler(event);
    }
    return true;
  }
}

