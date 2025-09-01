// Package info utility placeholder
// TODO: Implement actual package info when package_info_plus package is available

class PackageInfo {
  static Future<String> get appName async {
    // TODO: Implement actual app name detection
    return 'Template Bloc';
  }

  static Future<String> get packageName async {
    // TODO: Implement actual package name detection
    return 'com.example.template_bloc';
  }

  static Future<String> get version async {
    // TODO: Implement actual version detection
    return '1.0.0';
  }

  static Future<String> get buildNumber async {
    // TODO: Implement actual build number detection
    return '1';
  }

  static Future<Map<String, String>> get allInfo async {
    // TODO: Implement actual package info collection
    return {
      'appName': await appName,
      'packageName': await packageName,
      'version': await version,
      'buildNumber': await buildNumber,
    };
  }
}
