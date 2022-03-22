import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final prefs = Provider((ref) => SharedPreferenceHelper());

class SharedPreferenceHelper {
  late SharedPreferences preferences;

  init() async {
    preferences = await SharedPreferences.getInstance();
  }

  bool? getBool(String key) => preferences.getBool(key);
  Future<bool> setBool(String key, bool value) async =>
      preferences.setBool(key, value);

  int? getInt(String key) => preferences.getInt(key);
  Future<bool> setInt(String key, int value) async =>
      preferences.setInt(key, value);
  String? getString(String key) => preferences.getString(key);
  Future<bool> setString(String key, String value) async =>
      preferences.setString(key, value);
  Future<bool> clearAll() async => preferences.clear();
  Future<bool> setDouble(String key, double value) async =>
      preferences.setDouble(key, value);
  double? getDouble(String key) => preferences.getDouble(key);
}
