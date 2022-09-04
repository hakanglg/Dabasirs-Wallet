// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

enum SharedKeys { language, theme, currency, IS_FIRST_APP }

class CacheManager {
  static CacheManager? _instance;
  static CacheManager get instance {
    _instance ??= CacheManager._init();
    return _instance!;
  }

  late SharedPreferences _prefs;
  CacheManager._init();

  Future<void> initPref() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> clearAll() async {
    await _prefs.clear();
  }

  Future<void> saveString(SharedKeys key, String value) async {
    await _prefs.setString(key.name, value);
  }

  Future<void> saveBool(SharedKeys key, bool value) async {
    await _prefs.setBool(key.name, value);
  }

  bool? readBool(SharedKeys key) {
    return _prefs.getBool(key.name);
  }

  String? readString(SharedKeys key) {
    return _prefs.getString(key.name);
  }

  Future<bool> remove(SharedKeys key) async {
    return (await _prefs.remove(key.name));
  }
}
