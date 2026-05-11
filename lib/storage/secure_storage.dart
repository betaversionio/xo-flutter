import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Centralized secure storage and shared preferences management.
class SecureStorage {
  SecureStorage._();

  static final SecureStorage _instance = SecureStorage._();
  static SecureStorage get instance => _instance;

  static late FlutterSecureStorage _storage;
  static late SharedPreferences _prefs;

  // Storage key prefix — change this to your app name or bundle ID suffix.
  static const String _prefix = 'app_';

  static Future<void> initialize() async {
    _storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
        storageCipherAlgorithm: StorageCipherAlgorithm.AES_GCM_NoPadding,
      ),
      iOptions: IOSOptions(
        accessibility: KeychainAccessibility.first_unlock_this_device,
      ),
    );
    _prefs = await SharedPreferences.getInstance();
  }

  static String _key(String key) => '$_prefix$key';

  // Auth token helpers
  static Future<void> saveAuthToken(String token) async =>
      _storage.write(key: _key('auth_token'), value: token);

  static Future<String?> getAuthToken() async =>
      _storage.read(key: _key('auth_token'));

  static Future<void> saveRefreshToken(String token) async =>
      _storage.write(key: _key('refresh_token'), value: token);

  static Future<String?> getRefreshToken() async =>
      _storage.read(key: _key('refresh_token'));

  static Future<void> clearAuthTokens() async {
    await _storage.delete(key: _key('auth_token'));
    await _storage.delete(key: _key('refresh_token'));
  }

  // User data helpers
  static Future<void> saveUserId(String userId) async =>
      _storage.write(key: _key('user_id'), value: userId);

  static Future<String?> getUserId() async =>
      _storage.read(key: _key('user_id'));

  // Onboarding
  static Future<void> setOnboardingCompleted(bool completed) async =>
      _prefs.setBool(_key('onboarding_completed'), completed);

  static Future<bool> isOnboardingCompleted() async =>
      _prefs.getBool(_key('onboarding_completed')) ?? false;

  // Generic secure storage
  static Future<void> setSecureString(String key, String value) async =>
      _storage.write(key: _key(key), value: value);

  static Future<String?> getSecureString(String key) async =>
      _storage.read(key: _key(key));

  static Future<void> removeSecure(String key) async =>
      _storage.delete(key: _key(key));

  static Future<void> clearAll() async => _storage.deleteAll();

  // Generic shared preferences
  static Future<void> setString(String key, String value) async =>
      _prefs.setString(_key(key), value);

  static String? getString(String key) => _prefs.getString(_key(key));

  static Future<void> setBool(String key, bool value) async =>
      _prefs.setBool(_key(key), value);

  static bool getBool(String key, {bool defaultValue = false}) =>
      _prefs.getBool(_key(key)) ?? defaultValue;

  static Future<void> setInt(String key, int value) async =>
      _prefs.setInt(_key(key), value);

  static int? getInt(String key) => _prefs.getInt(_key(key));

  // Debug helper — skips token values
  static Future<void> printAllSecureKeys() async {
    final all = await _storage.readAll();
    log('Secure Storage:');
    for (final entry in all.entries) {
      final val = entry.key.contains('token') ? '***' : entry.value;
      log('  ${entry.key}: $val');
    }
  }
}
