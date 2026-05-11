// ignore_for_file: avoid_redundant_argument_values

import 'package:PROJECTNAME/utils/logger/logger.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Loads platform-specific Firebase options from environment variables.
/// Set FIREBASE_* keys in your .env file — see .env.example.
class FirebaseConfig {
  FirebaseConfig._();

  static FirebaseOptions get currentPlatform {
    if (kIsWeb) throw UnsupportedError('Firebase web not configured.');
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return _android;
      case TargetPlatform.iOS:
        return _ios;
      case TargetPlatform.macOS:
        return _macos;
      default:
        throw UnsupportedError('Unsupported platform for Firebase.');
    }
  }

  static FirebaseOptions get _android => FirebaseOptions(
    apiKey: dotenv.env['FIREBASE_ANDROID_API_KEY'] ?? '',
    appId: dotenv.env['FIREBASE_ANDROID_APP_ID'] ?? '',
    messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID'] ?? '',
    projectId: dotenv.env['FIREBASE_PROJECT_ID'] ?? '',
    storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET'] ?? '',
  );

  static FirebaseOptions get _ios => FirebaseOptions(
    apiKey: dotenv.env['FIREBASE_IOS_API_KEY'] ?? '',
    appId: dotenv.env['FIREBASE_IOS_APP_ID'] ?? '',
    messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID'] ?? '',
    projectId: dotenv.env['FIREBASE_PROJECT_ID'] ?? '',
    storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET'] ?? '',
    iosBundleId: dotenv.env['FIREBASE_IOS_BUNDLE_ID'] ?? '',
    iosClientId: dotenv.env['FIREBASE_IOS_CLIENT_ID'],
    androidClientId: dotenv.env['FIREBASE_ANDROID_CLIENT_ID'],
  );

  static FirebaseOptions get _macos => _ios;
}

/// Manages Firebase initialization and readiness checks.
class FirebaseService {
  FirebaseService._();

  /// Initializes Firebase. Returns true on success, false on failure.
  static Future<bool> initialize() async {
    try {
      await Firebase.initializeApp(options: FirebaseConfig.currentPlatform);
      AppLogger.i('Firebase initialized successfully');
      return true;
    } on PlatformException catch (e, st) {
      AppLogger.w('Firebase initialization skipped (missing config)', e, st);
    } catch (e, st) {
      AppLogger.w('Firebase initialization failed', e, st);
    }
    return false;
  }

  /// Returns true if Firebase.app() is accessible (i.e. initialized).
  static bool get isInitialized {
    try {
      Firebase.app();
      return true;
    } catch (_) {
      return false;
    }
  }
}
