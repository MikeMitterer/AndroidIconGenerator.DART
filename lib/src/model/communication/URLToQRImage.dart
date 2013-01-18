
part of communication;

class URLToQRImage implements JsonTO {
  String _url;

  URLToQRImage(this._url);

  URLToQRImage.fromJSON(final String json) {
    try {
      final Map map = JSON.parse(json);
      this._url = map['url'];
    } on Exception catch(exception) {
      final Localizer localizer = new Localizer();
      throw new ServerNotAvailableException(localizer[MessageResolver.ERROR_PARSING_JSON_STRING]);
    }
  }

  String get url => this._url;

  String get json {
    final Map map = new HashMap<String,String>();
    map["url"] = _url;
    return JSON.stringify(map);
  }
}