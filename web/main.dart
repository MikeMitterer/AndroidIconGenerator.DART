import 'dart:html';
import 'package:androidicongenerator/model.dart';
import 'package:androidicongenerator/eventbus.dart';

void main() {

  final EventsManager event = new EventsManager();
  final DndFiles dndfiles = new DndFiles();
  _setAppEventHandlers();
}

//-------------------------------------------------------------------------------------------------
// private
//-------------------------------------------------------------------------------------------------

void _setAppEventHandlers() {
  final EventBus eventbus = new EventBus();

  eventbus.on['foreground'].add((AppEvent event) {
    print("FGEvent from EventBus, Type: ${event.type}");
  });

  eventbus.on['background'].add((AppEvent event) {
    print("BGEvent from EventBus, Type: ${event.type}");
  });

}

class EventsManager {
  FormElement _settingsForm;
  InputElement _colorInput;
  InputElement _backgroundInput;
  final EventBus _eventbus;

  EventsManager()
    : _eventbus = new EventBus() {

    _settingsForm = document.query('#settings');
    _colorInput = _settingsForm.query('#foregroundColor');
    _backgroundInput = _settingsForm.query('#backgroundColor');

    _colorInput.onChange.listen((event) => _eventbus.on['foreground'].dispatch(new AppEvent('fg')));

    _backgroundInput.onChange.listen((event) => _eventbus.on['foreground'].dispatch(new AppEvent('bg')));
  }
}
