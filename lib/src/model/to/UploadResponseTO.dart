part of tos;

class UploadResponseTO implements JsonTO<UploadResponseTO> {
  String        path;
  String        pathRelativeToDocRoot;
  ActionBarIconsTO  actionbaricons;

  UploadResponseTO(this.path, this.pathRelativeToDocRoot,this.actionbaricons);
  

  UploadResponseTO.fromJson(json) {
    Map<String,dynamic> map;
    print(json.runtimeType);

    if(json is LinkedHashMap<String,dynamic> ) { map = json; }
    else { map = parse(json); }

    path = map['path'];
    pathRelativeToDocRoot = map['pathRelativeToDocRoot'];
    actionbaricons = new ActionBarIconsTO.fromJson(map['actionBarIcons']);
  }

  String toJson() => stringify(toMap());
  
  Map toMap() {
    final Map map = new HashMap<String,dynamic>();
    
    map["path"] = path;
    map["pathRelativeToDocRoot"] = pathRelativeToDocRoot;
    
    map["actionbaricons"] = actionbaricons.toMap();
    
    return map;
  }  

}


