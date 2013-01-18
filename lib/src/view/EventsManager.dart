
library view;

import 'dart:html';
import 'package:androidicongenerator/eventbus.dart';

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

    _colorInput.on.change.add((event) {
      _eventbus.on['foreground'].dispatch(new AppEvent('fg'));
      });

    _backgroundInput.on.change.add((event) {
      _eventbus.on['background'].dispatch(new AppEvent('bg'));
      });
  }
}
