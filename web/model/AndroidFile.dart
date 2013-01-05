part of model;

class AndroidFile {
  File    _file;
  String  _src;

  String  filename;
  SafeUri safeuri;

  //String imgtag;
  //String width;
  //String height;

  bool isImage;

  AndroidFile(this._file) : isImage = false {
    filename = htmlEscape(_file.name);

    // If the file is an image, read and display its thumbnail.
    if (_file.type.startsWith('image')) {
      FileReader reader = new FileReader();
      reader.on.load.add((e) {
        _src = reader.result.toString().trim();
        safeuri = new SafeUri.unsafe(_src);
        isImage = true;
        watcher.dispatch();
      });
      reader.readAsDataUrl(_file);
    }
  }
  
  AndroidFile.fromUri(Uri uri) :
    isImage = true {
    
    RegExp regex = new RegExp(".*/((.+)\.(.+))");
    Match match = regex.firstMatch(uri.path);
    filename = match.group(1);
    
    safeuri = new SafeUri.unsafe(templating.sanitizeUri(uri));
  }
}
