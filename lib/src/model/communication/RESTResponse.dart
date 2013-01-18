
part of communication;

class RESTResponse {
  String _responseText;

  final Object response;
  final String responseType;
  final int status;
  final String statusText;

  RESTResponse(this.status,this.response,this._responseText,this.responseType,this.statusText);

  RESTResponse.fromRequest(final HttpRequest request) :
    //RESTResponse(request.status,request.status,request.responseText,request.responseType)
    response = request.response,
    _responseText = request.responseText,
    responseType = request.responseType,
    status = request.status,
    statusText = request.statusText
      {}

  String get responseText => _responseText;
  void set responseText(final String text) {
    try {
      _responseText = text;
    } on Exception catch(e) {
      print("hhhh $e");
    }
  }
}
