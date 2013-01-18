
part of communication;

class MockREST implements RealREST {
  final String    _url;
  final EventBus  _eventbus;
  final Localizer _localizer;

  MockREST(final String this._url,final EventBus this._eventbus) : _localizer = new Localizer();

  void send(final JsonTO jsonto,final RESTFeedbackEvent handler) {
    final HttpRequest req = new HttpRequest();
    RESTResponse resonse = new RESTResponse(HttpStatus.HTTP_200_OK,null,"","text","200 (OK)");
    //req.readyState = XMLHttpRequest.DONE;
    //req.status = HttpStatus.HTTP_200_OK;

    try {
      //'{"url":"file://assets/img/examples/bootstrap-example-fluid.jpg"}';
      if(_url == RestServerURLs.REQUEST_QRCODE_FOR_URL) {
        resonse.responseText = (new URLToQRImage("assets/img/example-frontend/qr-mikemitterer.png")).json; //file://
        //resonse.responseText = "Hallo"; // produziert einen Fehler

      } else if(_url == RestServerURLs.REQUEST_QRCODE_FOR_EMAIL) {
        resonse.responseText = (new URLToQRImage("assets/img/example-frontend/qr-officeATmikemitterer.at.png")).json;

      }
      else {
        //req.status = HttpStatus.HTTP_0_COMMUNICATION_FAILED;
        _eventbus.on.event[new ErrorOnServer()].dispatch(new AppEventParam(_localizer[MessageResolver.ERROR_SERVER_NOT_RUNNING]));
        return;
      }

      handler(resonse);

    } on Exception catch(e) {
      _eventbus.on.event[new ErrorLocal()].dispatch(new AppEventParam(_localizer[e]));
    }
  }
}
