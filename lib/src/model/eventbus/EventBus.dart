
part of eventbus;

class EventBus implements AppEventTarget {
  static EventBus _eventbus;
  AppEvents       _on;

  factory EventBus() {
    if(_eventbus == null) {
      _eventbus = new EventBus._internal();
    }
    return _eventbus;
  }

  AppEvents get on {
    if (_on == null) {
      _on = new AppEvents();
    }
    return _on;
  }

  //------------------------------------------------------------------------------------------------
  // private
  //------------------------------------------------------------------------------------------------

  EventBus._internal() {

  }
}