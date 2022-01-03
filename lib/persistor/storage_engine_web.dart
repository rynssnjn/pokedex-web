// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:typed_data';

import 'package:pokedex_web/persistor/state_persistor.dart';
import 'package:pokedex_web/persistor/storage_engine.dart';

class StandardEngine extends StorageEngine {
  StandardEngine({String key = 'web'}) : super(key);

  @override
  Future<Uint8List?> load() async =>
      window.localStorage.containsKey(key) ? stringToUint8List(window.localStorage[key]!) : null;

  @override
  Future<void> save(Uint8List data) async => window.localStorage[key] = uint8ListToString(data);

  @override
  Future<void> delete() async => window.localStorage.remove(key);
}
