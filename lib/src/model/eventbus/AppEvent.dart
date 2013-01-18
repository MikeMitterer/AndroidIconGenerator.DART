
part of eventbus;

class AppEvent {
  final String type;

  AppEvent(String this.type);

  void execute() {}
}
