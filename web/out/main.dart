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
  
  autogenerated_html.UListElement __filelist;
  
  autogenerated_html.UnknownElement __e6;
  
  List<autogenerated.WatcherDisposer> __stoppers1;
  
  List<Function> _removeChild__e6 = [];
  
  autogenerated_html.Node _endPosition__e6;
  


  // Initialize fields.
  __dropZone = _root.query('#drop-zone');
  __read = _root.query('#read');
  __file = __read.query('#file');
  __filelist = _root.query('#filelist');
  __e6 = __filelist.query('#__e-6');
  __stoppers1 = [];
  

  // Attach model to views.
  _endPosition__e6 = __e6;
  
  __stoppers1.add(autogenerated.watchAndInvoke(() => convertedfiles.files, (_) {
    for (var remover in _removeChild__e6) remover();
    _removeChild__e6.clear();
    
    _endPosition__e6 = autogenerated.removeNodes(__e6, _endPosition__e6);
    
    var __insert___e6 = __e6.nextNode;
    
    for (var file in convertedfiles.files) {
      
      autogenerated_html.LIElement __e5;
      autogenerated_html.SpanElement __e1;
      var __binding0;
      List<autogenerated.WatcherDisposer> __stoppers2_1;
      autogenerated_html.UnknownElement __e4;
      autogenerated_html.Node _endPosition__e4;
      bool _isVisible__e4 = false;
      autogenerated_html.DivElement __e3;
      autogenerated_html.ImageElement __e2;
      List<autogenerated.WatcherDisposer> __stoppers3_2_1;
      
      __e5 = new autogenerated_html.Element.html('<li><span class="filename" id="__e-1"></span>\n        <template id="__e-4" style="display:none"></template>\n        </li>');
      __e1 = __e5.query('#__e-1');
      __binding0 = new autogenerated_html.Text('');
      __stoppers2_1 = [];
      __e1.nodes.add(__binding0);
      __e4 = __e5.query('#__e-4');
      
      autogenerated.insertAllBefore(__e6.parent, __insert___e6,
      
      [new autogenerated_html.Text('\n        '), __e5, _endPosition__e6 = new autogenerated_html.Text('\n      ')]);
      
      __stoppers2_1.add(autogenerated.watchAndInvoke(() => '${file.filename}', (__e) {
        __binding0 = autogenerated.updateBinding(file.filename, __binding0, __e.newValue);
      }));
      _endPosition__e4 = __e4;
      __stoppers2_1.add(autogenerated.watchAndInvoke(() => file.isImage, (__e) {
        bool showNow = __e.newValue;
        if (_isVisible__e4 && !showNow) {
          _isVisible__e4 = false;
          
          __e3 = null;
          (__stoppers3_2_1..forEach((s) => s())).clear();
          __e2 = null;
          _endPosition__e4 = autogenerated.removeNodes(__e4, _endPosition__e4);
        } else if (!_isVisible__e4 && showNow) {
          _isVisible__e4 = true;
          __e3 = new autogenerated_html.Element.html('<div class="image">\n            <img id="__e-2">\n          </div>');
          __e2 = __e3.query('#__e-2');
          __stoppers3_2_1 = [];
          autogenerated.insertAllBefore(__e4.parent, __e4.nextNode,
          [new autogenerated_html.Text('\n          '), __e3, _endPosition__e4 = new autogenerated_html.Text('\n         ')]);
          __stoppers3_2_1.add(autogenerated.watchAndInvoke(() => file.filename, (__e) { __e2.alt = __e.newValue; }));
          __stoppers3_2_1.add(autogenerated.watchAndInvoke(() => file.safeuri, (__e) { __e2.src = autogenerated.sanitizeUri(__e.newValue); }));
          
        }
      }));
      
      _removeChild__e6.add(() {
        
        __e5 = null;
        __e1 = null;
        (__stoppers2_1..forEach((s) => s())).clear();
        __binding0 = null;
        if (_isVisible__e4) {
          _endPosition__e4 = autogenerated.removeNodes(__e4, _endPosition__e4);
          __e3 = null;
          (__stoppers3_2_1..forEach((s) => s())).clear();
          __e2 = null;
        }
        __e4 = null;
        
      });
    }
  }));
  

}
