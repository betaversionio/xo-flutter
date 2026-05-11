import 'package:{{ inputs.projectName }}/utils/logger/logger.dart';
{{#if (includes inputs.features "firebase")}}
import 'package:{{ inputs.projectName }}/services/firebase/firebase_service.dart';
{{/if}}
{{#if (includes inputs.features "storage")}}
import 'package:{{ inputs.projectName }}/services/storage/secure_storage.dart';
{{/if}}
{{#if (includes inputs.features "navigation")}}
import 'package:{{ inputs.projectName }}/routes/app_router.dart';
{{/if}}
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Handles the complete app initialization sequence.
///
/// Call [AppInitializer.initialize] inside main() before runApp().
class AppInitializer {
  AppInitializer._();

  /// Runs all initialization phases in the correct order.
  /// Returns true on success, throws on critical failure.
  static Future<bool> initialize() async {
    AppLogger.init();

    try {
      AppLogger.i('Starting {{ inputs.appName }} initialization...');

      await _initializeCore();

{{#if (includes inputs.features "firebase")}}
      await _initializeFirebase();
{{/if}}

      AppLogger.i('Initialization complete.');
      return true;
    } catch (e, st) {
      AppLogger.f('Initialization failed', e, st);
      rethrow;
    }
  }

  // ---------------------------------------------------------------------------
  // Phase 1: Core
  // ---------------------------------------------------------------------------

  static Future<void> _initializeCore() async {
    // Load .env file
    await dotenv.load(fileName: '.env');
    AppLogger.i('Environment loaded');

{{#if (includes inputs.features "storage")}}
    await SecureStorage.initialize();
    AppLogger.i('Secure storage ready');
{{/if}}
  }

{{#if (includes inputs.features "firebase")}}
  // ---------------------------------------------------------------------------
  // Phase 2: Firebase
  // ---------------------------------------------------------------------------

  static Future<void> _initializeFirebase() async {
    final ok = await FirebaseService.initialize();
    if (!ok) {
      AppLogger.w('Firebase unavailable — app will run with limited features');
    }
  }
{{/if}}
}
