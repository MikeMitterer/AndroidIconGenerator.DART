part of communication;

abstract class IREST {
  IREST(final String url,final EventBus eventbus);
  void send(final JsonTO jsonto,final RESTFeedbackEvent handler);
}
