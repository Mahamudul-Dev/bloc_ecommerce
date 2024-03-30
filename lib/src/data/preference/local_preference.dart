import 'package:shared_preferences/shared_preferences.dart';

class LocalPreferences {
  static LocalPreferences? _instance;
  static late SharedPreferences _prefs;

  // Private constructor to prevent instantiation
  LocalPreferences._();

  // Public factory method to get the instance
  factory LocalPreferences() {
    _instance ??= LocalPreferences._();
    return _instance!;
  }

  // Initialize SharedPreferences
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Methods for reading and writing data

  static String getString(String key, {String defaultValue = ''}) {
    return _prefs.getString(key) ?? defaultValue;
  }

  static Future<bool> setString(String key, String value) {
    return _prefs.setString(key, value);
  }

  static int getInt(String key, {int defaultValue = 0}) {
    return _prefs.getInt(key) ?? defaultValue;
  }

  static Future<bool> setInt(String key, int value) {
    return _prefs.setInt(key, value);
  }

  static double getDouble(String key, {double defaultValue = 0.0}) {
    return _prefs.getDouble(key) ?? defaultValue;
  }

  static Future<bool> setDouble(String key, double value) {
    return _prefs.setDouble(key, value);
  }

  static bool getBool(String key, {bool defaultValue = false}) {
    return _prefs.getBool(key) ?? defaultValue;
  }

  static Future<bool> setBool(String key, bool value) {
    return _prefs.setBool(key, value);
  }

  // Add other methods as needed

  // Clear all data in SharedPreferences
  static Future<void> clear() async {
    await _prefs.clear();
  }
}