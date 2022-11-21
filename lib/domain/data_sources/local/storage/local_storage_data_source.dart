abstract class LocalStorageDataSource {
  Future<void> init();

  bool? getBool(String key);
  Future<bool> setBool(String key, bool value);
  int? getInt(String key);
  Future<bool> setInt(String key, int value);
  String? getString(String key);
  Future<bool> setString(String key, String value);
  Future<bool> clearAll();
  Future<bool> setDouble(String key, double value);
  double? getDouble(String key);
}
