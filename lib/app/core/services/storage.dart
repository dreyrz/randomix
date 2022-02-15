// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IStorageService<K> {
  Future<void> init();
  Future<void> setString(K key, String value);
  String? readString(K key);
  Future<void> setBool(K key, bool value);
  bool? readBool(K key);
  Future<void> remove(K key);
}

class StorageService<K> extends GetxService implements IStorageService<K> {
  late final SharedPreferences _shared;

  @override
  void onInit() async {
    await init();
    super.onInit();
  }

  @override
  Future<void> init() async {
    _shared = await SharedPreferences.getInstance();
  }

  @override
  Future<void> setString(K key, String value) async {
    await _shared.setString(key.toString(), value.toString());
  }

  @override
  String? readString(K key) {
    return _shared.getString(key.toString());
  }

  @override
  Future<void> remove(K key) async {
    await _shared.remove(key.toString());
  }

  @override
  bool? readBool(K key) {
    return _shared.getBool(key.toString());
  }

  @override
  Future<void> setBool(K key, bool value) async {
    await _shared.setBool(key.toString(), value);
  }
}

//utilizar o controller do about, modules/about, 