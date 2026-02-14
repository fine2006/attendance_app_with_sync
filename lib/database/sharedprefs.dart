import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static const _firstRunKey = 'firstRun';
  static const _darkModeKey = 'darkMode';
  static const _lowBoundKey = 'lowBound';
  static const _highBoundKey = 'highBound';

  static SharedPreferencesWithCache? _prefs;

  /// Returns the cached SharedPreferencesWithCache instance,
  /// creating it if necessary.
  static Future<SharedPreferencesWithCache> _getInstance() async {
    if (_prefs != null) return _prefs!;
    _prefs = await SharedPreferencesWithCache.create(
      cacheOptions: const SharedPreferencesWithCacheOptions(),
    );
    return _prefs!;
  }

  static Future<void> saveDarkMode(bool value) async {
    final prefs = await _getInstance();
    await prefs.setBool(_darkModeKey, value);
  }

  static Future<bool> loadDarkMode() async {
    final prefs = await _getInstance();
    return prefs.getBool(_darkModeKey) ?? false;
  }

  static Future<void> saveLowBound(double value) async {
    final prefs = await _getInstance();
    await prefs.setDouble(_lowBoundKey, value);
  }

  static Future<double> loadLowBound() async {
    final prefs = await _getInstance();
    return prefs.getDouble(_lowBoundKey) ?? 75;
  }

  static Future<void> saveHighBound(double value) async {
    final prefs = await _getInstance();
    await prefs.setDouble(_highBoundKey, value);
  }

  static Future<double> loadHighBound() async {
    final prefs = await _getInstance();
    return prefs.getDouble(_highBoundKey) ?? 85;
  }
}
