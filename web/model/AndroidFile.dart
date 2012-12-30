part of model;

class AndroidFile {
  File _file;  
  
  String filename;
  String src;
  //String imgtag;
  String width;
  String height;

  bool isImage;
  
  AndroidFile(this._file) : isImage = false {
    filename = htmlEscape(_file.name);
    
    // If the file is an image, read and display its thumbnail.
    if (_file.type.startsWith('image')) {
      FileReader reader = new FileReader();
      reader.on.load.add((e) {
        src = reader.result.toString().trim();
        print(src);
        //imgtag = '<img src="$src" alt="$filename">';
        isImage = true;  
        watcher.dispatch();
      });
      reader.readAsDataUrl(_file);  
    }
  }
}
