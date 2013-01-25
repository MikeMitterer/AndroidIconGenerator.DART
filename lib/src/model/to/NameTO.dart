part of tos;

class NameTO implements JsonTO<NameTO> {
  String firstname;
  
  NameTO(this.firstname);
  
  NameTO.fromJson(json) {
    Map<String,dynamic> map;
    print(json.runtimeType);
    
    if(json is LinkedHashMap<String,dynamic> ) { map = json; }
    else { map = parse(json); }
    
    firstname = map['firstname'];
  }
  
  String toJson() {
    final Map map = new HashMap<String,String>();
    map["firstname"] = firstname;
    return stringify(map);      
  }
}

