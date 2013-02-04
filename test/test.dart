library test;

import 'package:unittest/unittest.dart';
import 'package:unittest/html_enhanced_config.dart';
import 'package:unittest/mock.dart';

import 'package:androidicongenerator/communication.dart';
import 'package:androidicongenerator/tos.dart';

import 'dart:html'; // as html;
import 'dart:json';
import 'dart:collection';

part 'src/simple.dart';
part 'src/restserver.dart';

//
// Mehr Infos: http://www.dartlang.org/articles/dart-unit-tests/
//
main() {
  //useHtmlInteractiveConfiguration();
  useHtmlEnhancedConfiguration();

  final UriProvider uriprovider = new UriProvider.forTesting();

  testSimple();
  testREST(uriprovider);
}