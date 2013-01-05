// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// This is a port of "Reading Files in JavaScript Using the File APIs" to Dart.
// See: http://www.html5rocks.com/en/tutorials/file/dndfiles/
part of model;

class DndFiles {
  FormElement _readForm;
  InputElement _fileInput;
  Element _dropZone;
  //OutputElement _output;

  DndFiles() {
    //_output = document.query('#list');
    _readForm = document.query('#read');
    _fileInput = document.query('#file');
    _fileInput.on.change.add((e) => _onFileInputChange());

    _dropZone = document.query('#drop-zone');
    _dropZone.on.dragOver.add(_onDragOver);
    _dropZone.on.dragEnter.add((e) => _dropZone.classes.add('hover'));
    _dropZone.on.dragLeave.add((e) => _dropZone.classes.remove('hover'));
    _dropZone.on.drop.add(_onDrop);
  }

  //----------------------------------------------------------------------------
  // private
  //----------------------------------------------------------------------------

  void _onDragOver(MouseEvent event) {
    event.stopPropagation();
    event.preventDefault();
    event.dataTransfer.dropEffect = 'copy';
  }

  void _onDrop(MouseEvent event) {
    event.stopPropagation();
    event.preventDefault();
    _dropZone.classes.remove('hover');
    _readForm.reset();

    //_onFilesSelected(event.dataTransfer.files);
    
    print("onDrop...");
    
    //ToDo: Funkt nicht in FF und Safari
    for(int counter = 0; counter < event.dataTransfer.items.length; counter++) {
      DataTransferItem item = event.dataTransfer.items.item(counter);
      
      print("Content-type: ${item.type}");
      if(item.type == "text/html") {
        print("Content: ${event.dataTransfer.getData(item.type)}");
        
        //RegExp regexp = new RegExp("<img.+?src=[\"'](.+?)[\"'].+?>", ignoreCase: true);    
        //RegExp regexp = new RegExp("<img.*?src=[\"'](.+?)[\"'].*?>", ignoreCase: true);
        RegExp regexp = new RegExp("<img.*?src=[\"'](.+?(\.png|\.jpg|\.gif))[\"'].*?>", ignoreCase: true);
        //RegExp regexp = new RegExp("<img.+?src=[\"'](.+\.gif)[\"'].+?>", ignoreCase: true);
        Match match = regexp.firstMatch(event.dataTransfer.getData(item.type));
        if(match != null && match.groupCount == 2) {
          print("Source: ${match.group(1)}");
          _addSelectedURIToModel(new Uri(match.group(1)));
          return;
        }
      }
    }
    
    _addSelectedFilesToModel(event.dataTransfer.files);
  }

  void _onFileInputChange() {
    //_onFilesSelected(_fileInput.files);
    _addSelectedFilesToModel(_fileInput.files);
  }

  void _addSelectedFilesToModel(List<File> files) {
    convertedfiles.files.clear();
    for (File file in files) {
      convertedfiles.files.add(new AndroidFile(file));
    }
    watcher.dispatch();
  }

  void _addSelectedURIToModel(Uri uri) {
    convertedfiles.files.clear();
    convertedfiles.files.add(new AndroidFile.fromUri(uri));
    watcher.dispatch();
  }
  
  void _onFilesSelected(List<File> files) {
    //_output.nodes.clear();
    Element list = new Element.tag('ul');
    for (var file in files) {
      Element item = new Element.tag('li');

      // If the file is an image, read and display its thumbnail.
      if (file.type.startsWith('image')) {
        Element thumbHolder = new Element.tag('span');
        FileReader reader = new FileReader();
        reader.on.load.add((e) {
          ImageElement thumbnail = new ImageElement(src: reader.result);
          thumbnail.classes.add('thumb');
          thumbnail.title = htmlEscape(file.name);
          thumbHolder.nodes.add(thumbnail);

          // _sendDatas(reader.result);

        });
        reader.readAsDataUrl(file);

        //_sendFormData(file);

        item.nodes.add(thumbHolder);
      }

      final StringBuffer buffer = new StringBuffer('<strong>');
          buffer.add(file.name).add('</strong> (')
          .add(file.type != null ? htmlEscape(file.type) : 'n/a')
          .add(') ')
          .add(file.size)
          .add(' bytes');

          // TODO(jason9t): Re-enable this when issue 5070 is resolved.
          // http://code.google.com/p/dart/issues/detail?id=5070
          // .add(', last modified: ')
          // .add(file.lastModifiedDate != null ?
          //     file.lastModifiedDate.toLocal().toString() :
          //     'n/a')

      // For all file types, display some properties.
      Element properties = new Element.tag('span');
      properties.innerHtml = buffer.toString();

      item.nodes.add(properties);
      list.nodes.add(item);
    }
    //_output.nodes.add(list);
  }

  //-----------------------------------------------------------------------------------------------
  // send data to server
  //
  // Weitere Infos:
  //    http://stackoverflow.com/questions/13298140/how-to-upload-a-file-in-dart
  //
  _sendDatas(dynamic data) {
    final HttpRequest req = new HttpRequest();

    req.on.readyStateChange.add((Event e) {
      if (req.readyState == HttpRequest.DONE &&
          (req.status == 200 || req.status == 0)) {
        window.alert("upload complete");
      }
    });

    req.open("POST", "http://localhost:8080/api/file/upload");
    req.send(data);
  }

  _sendFormData(final File file) {
    final HttpRequest httprequest = new HttpRequest();
    final String filename = file.name;

    httprequest.open('POST', "http://localhost:8080/api/file/upload");
    httprequest.on.readyStateChange.add((e) {
      if (httprequest.readyState == 4 && httprequest.status == 200) {
        window.alert("upload complete");
      } else {
        window.alert("Upload failed with status code: ${httprequest.status}");
      }
    });

    print("Filename: ${filename}");

    final FormData formData = new FormData();
    formData.append('file', file, filename);
    httprequest.send(formData);
  }
}


