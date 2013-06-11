library model;

import 'dart:html';

import 'package:web_ui/watcher.dart' as watcher;
import 'package:web_ui/safe_html.dart';
import 'package:web_ui/templating.dart' as templating;

part 'src/model/AndroidFile.dart';
part 'src/model/ConvertedFiles.dart';
part 'src/model/business/dndfiles.dart';
part 'src/model/utils/htmlescape.dart';

final ConvertedFiles convertedfiles = new ConvertedFiles();