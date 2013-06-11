part of tos;

class SimpleUploadResponseTO implements JsonTO<SimpleUploadResponseTO> {
  String        path;

  SimpleUploadResponseTO(this.path);


  SimpleUploadResponseTO.fromJson(json) {
    Map<String,dynamic> map;
    print(json.runtimeType);

    if(json is LinkedHashMap<String,dynamic> ) { map = json; }
    else { map = parse(json); }

    path = map['path'];
  }

  String toJson() => stringify(toMap());

  Map toMap() {
    final Map map = new HashMap<String,dynamic>();

    map["path"] = path;
    
    return map;
  }

}


