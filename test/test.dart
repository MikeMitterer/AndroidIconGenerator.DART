library test;

import 'package:unittest/unittest.dart';
import 'package:unittest/html_enhanced_config.dart';
import 'package:unittest/mock.dart';
import 'package:crypto/crypto.dart';

import 'package:androidicongenerator/communication.dart';
import 'package:androidicongenerator/tos.dart';

import 'dart:html'; // as html;
import 'dart:json';
import 'dart:collection';
import 'dart:typed_data';

//import 'dart:io' as io;

part 'src/simple.dart';
part 'src/restserver.dart';
part 'src/guid.dart';

//
// Mehr Infos: http://www.dartlang.org/articles/dart-unit-tests/
//
main() {
  //useHtmlInteractiveConfiguration();
  useHtmlEnhancedConfiguration();

  final UriProvider uriprovider = new UriProvider.forTesting();

  testSimple();
  testREST(uriprovider);
  testGUID();
}