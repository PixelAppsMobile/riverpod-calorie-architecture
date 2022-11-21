import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:totaltest/domain/data_sources/local/storage/local_storage_data_source.dart';

final localStorageDataSource = Provider((ref) => LocalStorageDataSourceImpl());

class LocalStorageDataSourceImpl implements LocalStorageDataSource {
  late SharedPreferences preferences;

  @override
  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  @override
  bool? getBool(String key) => preferences.getBool(key);

  @override
  Future<bool> setBool(String key, bool value) async =>
      preferences.setBool(key, value);

  @override
  int? getInt(String key) => preferences.getInt(key);

  @override
  Future<bool> setInt(String key, int value) async =>
      preferences.setInt(key, value);

  @override
  String? getString(String key) => preferences.getString(key);

  @override
  Future<bool> setString(String key, String value) async =>
      preferences.setString(key, value);

  @override
  Future<bool> clearAll() async => preferences.clear();

  @override
  Future<bool> setDouble(String key, double value) async =>
      preferences.setDouble(key, value);

  @override
  double? getDouble(String key) => preferences.getDouble(key);
}
