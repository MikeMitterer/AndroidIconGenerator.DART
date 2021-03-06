part of tos;

class NameTO implements JsonTO<NameTO> {
  int id;
  String firstname;

  NameTO(this.firstname);

  NameTO.fromJson(json) {
    Map<String,dynamic> map;
    print(json.runtimeType);

    if(json is LinkedHashMap<String,dynamic> ) { map = json; }
    else { map = parse(json); }

    id = map['id'];
    firstname = map['firstname'];
  }

  String toJson() => stringify(toMap());

  Map toMap() {
    final Map map = new HashMap<String,dynamic>();
    
    map["id"] = id;
    map["firstname"] = firstname;
    
    return map;
  }

}

