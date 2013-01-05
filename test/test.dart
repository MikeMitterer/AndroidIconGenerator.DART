library test;

import 'package:unittest/unittest.dart';
import 'package:unittest/html_enhanced_config.dart';
import 'package:unittest/mock.dart';

import 'dart:html' as html;

part 'src/simple.dart';

//
// Mehr Infos: http://www.dartlang.org/articles/dart-unit-tests/
//
main() {
  useHtmlEnhancedConfiguration();
  
  testSimple();
}