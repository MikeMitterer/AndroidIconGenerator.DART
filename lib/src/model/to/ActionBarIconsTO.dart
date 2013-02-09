part of tos;

 class ActionBarIconsTO  implements JsonTO<ActionBarIconsTO> {
   String ldpi18x18;
   String mdpi24x24;
   String hdpi36x36;
   String xhdpi48x48;
   String hdpi48x48_v10;
   String mdpi32x32_v10;
   String ldpi24x24_v10;

   ActionBarIconsTO(this.ldpi18x18, this.mdpi24x24, this.hdpi36x36, this.xhdpi48x48,
                    this.hdpi48x48_v10, this.mdpi32x32_v10, this.ldpi24x24_v10);
   
   
   ActionBarIconsTO.fromJson(json) {
     Map<String,dynamic> map;
     print(json.runtimeType);

     if(json is LinkedHashMap<String,dynamic> ) { map = json; }
     else { map = parse(json); }

     ldpi18x18 = map['ldpi18x18'];
     mdpi24x24 = map['mdpi24x24'];
     hdpi36x36 = map['hdpi36x36'];
     xhdpi48x48 = map['xhdpi48x48'];
     hdpi48x48_v10 = map['hdpi48x48_v10'];
     mdpi32x32_v10 = map['mdpi32x32_v10'];
     ldpi24x24_v10 = map['ldpi24x24_v10'];
   }

   String toJson() => stringify(toMap());
   
   Map toMap() {
     final Map map = new HashMap<String,dynamic>();
     
     map["ldpi18x18"] = ldpi18x18;
     map["mdpi24x24"] = mdpi24x24;
     map["hdpi36x36"] = hdpi36x36;
     map["xhdpi48x48"] = xhdpi48x48;
     map["hdpi48x48_v10"] = hdpi48x48_v10;
     map["mdpi32x32_v10"] = mdpi32x32_v10;
     map["ldpi24x24_v10"] = ldpi24x24_v10;

     return map;
   }
}

