library test;

import 'package:unittest/unittest.dart';
import 'package:unittest/html_enhanced_config.dart';
import 'package:unittest/mock.dart';

import 'package:androidicongenerator/communication.dart';

import 'dart:html'; // as html;
import 'dart:json';

part 'src/simple.dart';
part 'src/restserver.dart';

//
// Mehr Infos: http://www.dartlang.org/articles/dart-unit-tests/
//
main() {
  //useHtmlInteractiveConfiguration();
  useHtmlEnhancedConfiguration();

  testSimple();
  testREST();
}