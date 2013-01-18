
part of communication;

class RealREST implements IREST{
  final String    _url;
  final EventBus  _eventbus;
  final Localizer _localizer;

  RealREST(final String this._url,final EventBus this._eventbus) : _localizer = new Localizer();

  void send(final JsonTO jsonto,final RESTFeedbackEvent handler) {
    final HttpRequest req = new HttpRequest();

    req.open("post",_url,true); // WICHTIG: open for setRequestHeader
    req.setRequestHeader('Content-type', 'application/json');

    //req.on.load.add((Event event) {
    //  print(req.responseText);
    //});
    req.on.readyStateChange.add((Event event) {
      final RESTResponse resonse = new RESTResponse.fromRequest(req);

      if (req.readyState == HttpRequest.DONE) {
        switch(req.status) {

          case HttpStatus.HTTP_200_OK:
            print("Text: ${req.responseText}, Status: ${req.status}");
            try {
              handler(resonse); // called when the POST successfully completes

            } on ServerNotAvailableException catch( exception) {
              _eventbus.on.event[new ErrorOnServer()].dispatch(new AppEventParam(exception.toString()));

            } catch(error) {
              print(error);

            }
          break;

          case HttpStatus.HTTP_0_COMMUNICATION_FAILED:
            _eventbus.on.event[new ErrorOnServer()].dispatch(new AppEventParam(_localizer[MessageResolver.ERROR_SERVER_NOT_RUNNING]));
            break;
        }
      }
    });

    try {
      req.send(jsonto.json);

    } on Exception catch (exception) {
      print(exception);

    }
  }
}
