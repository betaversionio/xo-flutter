import 'dart:developer';

/// Flavor/environment configuration driven by build-time --dart-define flags.
///
/// Usage:
///   flutter run --dart-define=FLAVOR=development
///   flutter run --dart-define=FLAVOR=staging
///   flutter run --dart-define=FLAVOR=production
class FlavorConfig {
  static const String _flavorKey = 'FLAVOR';
  static const String _environmentKey = 'ENVIRONMENT';

  static const String development = 'development';
  static const String staging = 'staging';
  static const String production = 'production';

  static String get currentFlavor =>
      const String.fromEnvironment(_flavorKey, defaultValue: development);

  static String get currentEnvironment =>
      const String.fromEnvironment(_environmentKey, defaultValue: development);

  static bool get isDevelopment => currentFlavor == development;
  static bool get isStaging => currentFlavor == staging;
  static bool get isProduction => currentFlavor == production;

  /// Flavor-specific display name for the app.
  /// Update these to match your actual app name.
  static String get appName {
    switch (currentFlavor) {
      case development:
        return 'PROJECTNAME Dev';
      case staging:
        return 'PROJECTNAME Staging';
      default:
        return 'PROJECTNAME';
    }
  }

  /// Flavor-specific bundle ID suffix.
  /// Update with your orgId.projectName pattern.
  static String get packageName {
    switch (currentFlavor) {
      case development:
        return 'com.example.PROJECTNAME.dev';
      case staging:
        return 'com.example.PROJECTNAME.staging';
      default:
        return 'com.example.PROJECTNAME';
    }
  }

  static void printFlavorInfo() {
    if (!isProduction) {
      log('Flavor: $currentFlavor');
      log('Environment: $currentEnvironment');
      log('App Name: $appName');
      log('Package: $packageName');
    }
  }
}
