// Auto-generated from main.html.
// DO NOT EDIT.

library main_html;

import 'dart:html' as autogenerated_html;
import 'dart:web_audio' as autogenerated_audio;
import 'dart:svg' as autogenerated_svg;
import 'package:web_ui/web_ui.dart' as autogenerated;

import 'dart:html';

import '../model/Model.dart';


// Original code
void main() {
  final DndFiles dndfiles = new DndFiles();
}



// Additional generated code
/** Create the views and bind them to models. */
void init_autogenerated() {
  var _root = autogenerated_html.document.body;
  autogenerated_html.DivElement __dropZone;
  
  autogenerated_html.FormElement __read;
  
  autogenerated_html.InputElement __file;
  
  autogenerated_html.UListElement __list;
  
  autogenerated_html.UnknownElement __e5;
  
  List<autogenerated.WatcherDisposer> __stoppers1;
  
  List<Function> _removeChild__e5 = [];
  
  autogenerated_html.Node _endPosition__e5;
  


  // Initialize fields.
  __dropZone = _root.query('#drop-zone');
  __read = _root.query('#read');
  __file = __read.query('#file');
  __list = _root.query('#list');
  __e5 = __list.query('#__e-5');
  __stoppers1 = [];
  

  // Attach model to views.
  _endPosition__e5 = __e5;
  
  __stoppers1.add(autogenerated.watchAndInvoke(() => convertedfiles.files, (_) {
    for (var remover in _removeChild__e5) remover();
    _removeChild__e5.clear();
    
    _endPosition__e5 = autogenerated.removeNodes(__e5, _endPosition__e5);
    
    var __insert___e5 = __e5.nextNode;
    
    for (var file in convertedfiles.files) {
      
      autogenerated_html.LIElement __e4;
      var __binding0;
      List<autogenerated.WatcherDisposer> __stoppers2_1;
      autogenerated_html.UnknownElement __e3;
      autogenerated_html.Node _endPosition__e3;
      bool _isVisible__e3 = false;
      autogenerated_html.ImageElement __e1;
      List<autogenerated.WatcherDisposer> __stoppers3_2_1;
      var __binding2;
      
      __e4 = new autogenerated_html.LIElement();
      __binding0 = new autogenerated_html.Text('');
      __stoppers2_1 = [];
      __e3 = new autogenerated_html.Element.html('<template style="display:none"></template>');
      __e4.nodes.add(__binding0);
      __e4.nodes.add(new autogenerated_html.Text('\n        '));
      __e4.nodes.add(__e3);
      __e4.nodes.add(new autogenerated_html.Text('\n        '));
      
      autogenerated.insertAllBefore(__e5.parent, __insert___e5,
      
      [new autogenerated_html.Text('\n        '), __e4, _endPosition__e5 = new autogenerated_html.Text('\n      ')]);
      
      __stoppers2_1.add(autogenerated.watchAndInvoke(() => '${file.filename}', (__e) {
        __binding0 = autogenerated.updateBinding(file.filename, __binding0, __e.newValue);
      }));
      _endPosition__e3 = __e3;
      __stoppers2_1.add(autogenerated.watchAndInvoke(() => file.isImage, (__e) {
        bool showNow = __e.newValue;
        if (_isVisible__e3 && !showNow) {
          _isVisible__e3 = false;
          
          (__stoppers3_2_1..forEach((s) => s())).clear();
          __e1 = null;
          __binding2 = null;
          _endPosition__e3 = autogenerated.removeNodes(__e3, _endPosition__e3);
        } else if (!_isVisible__e3 && showNow) {
          _isVisible__e3 = true;
          __e1 = new autogenerated_html.ImageElement();
          __stoppers3_2_1 = [];
          __binding2 = new autogenerated_html.Text('');
          autogenerated.insertAllBefore(__e3.parent, __e3.nextNode,
          [new autogenerated_html.Text('\n          '), __e1, new autogenerated_html.BRElement(), new autogenerated_html.Text('\n          Source: '), __binding2, _endPosition__e3 = new autogenerated_html.Text('\n         ')]);
          __stoppers3_2_1.add(autogenerated.watchAndInvoke(() => file.filename, (__e) { __e1.alt = __e.newValue; }));
          __stoppers3_2_1.add(autogenerated.watchAndInvoke(() => file.src, (__e) { __e1.src = autogenerated.sanitizeUri(__e.newValue); }));
          __stoppers3_2_1.add(autogenerated.watchAndInvoke(() => '${file.src}', (__e) {
            __binding2 = autogenerated.updateBinding(file.src, __binding2, __e.newValue);
          }));
          
        }
      }));
      
      _removeChild__e5.add(() {
        
        __e4 = null;
        (__stoppers2_1..forEach((s) => s())).clear();
        __binding0 = null;
        if (_isVisible__e3) {
          _endPosition__e3 = autogenerated.removeNodes(__e3, _endPosition__e3);
          (__stoppers3_2_1..forEach((s) => s())).clear();
          __e1 = null;
          __binding2 = null;
        }
        __e3 = null;
        
      });
    }
  }));
  

}