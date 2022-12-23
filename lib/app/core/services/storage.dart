import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IStorageService {
  Future<void> init();
  Future<void> setString(String key, String value);
  String? readString(String key);
  Future<void> setBool(String key, bool value);
  bool? readBool(String key);
  Future<void> setStringList(String key, List<String> value);
  List<String>? readStringList(String key);
  Future<void> remove(String key);
}

class StorageService extends GetxService implements IStorageService {
  late final SharedPreferences _shared;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  @override
  Future<void> init() async {
    _shared = await SharedPreferences.getInstance();
  }

  @override
  Future<void> setString(String key, String value) async {
    await _shared.setString(key.toString(), value.toString());
  }

  @override
  String? readString(String key) {
    return _shared.getString(key.toString());
  }

  @override
  Future<void> remove(String key) async {
    await _shared.remove(key.toString());
  }

  @override
  bool? readBool(String key) {
    return _shared.getBool(key.toString());
  }

  @override
  Future<void> setBool(String key, bool value) async {
    await _shared.setBool(key.toString(), value);
  }

  @override
  List<String>? readStringList(String key) {
    return _shared.getStringList(key.toString());
  }

  @override
  Future<void> setStringList(String key, List<String> value) async {
    await _shared.setStringList(key.toString(), value);
  }
}
