// Device info utility placeholder
// TODO: Implement actual device info when device_info_plus package is available

class DeviceInfo {
  static Future<String> get platformName async {
    // TODO: Implement actual platform detection
    return 'unknown';
  }

  static Future<String> get platformVersion async {
    // TODO: Implement actual version detection
    return 'unknown';
  }

  static Future<String> get deviceName async {
    // TODO: Implement actual device name detection
    return 'unknown';
  }

  static Future<String> get deviceModel async {
    // TODO: Implement actual device model detection
    return 'unknown';
  }

  static Future<String> get systemVersion async {
    // TODO: Implement actual system version detection
    return 'unknown';
  }

  static Future<String> get appVersion async {
    // TODO: Implement actual app version detection
    return '1.0.0';
  }

  static Future<String> get buildNumber async {
    // TODO: Implement actual build number detection
    return '1';
  }

  static Future<String> get packageName async {
    // TODO: Implement actual package name detection
    return 'com.example.template_bloc';
  }

  static Future<bool> get isPhysicalDevice async {
    // TODO: Implement actual device type detection
    return true;
  }

  static Future<bool> get isIOS async {
    // TODO: Implement actual platform detection
    return false;
  }

  static Future<bool> get isAndroid async {
    // TODO: Implement actual platform detection
    return true;
  }

  static Future<bool> get isWeb async {
    // TODO: Implement actual platform detection
    return false;
  }

  static Future<bool> get isDesktop async {
    // TODO: Implement actual platform detection
    return false;
  }

  static Future<Map<String, dynamic>> get allInfo async {
    // TODO: Implement actual device info collection
    return {
      'platformName': await platformName,
      'platformVersion': await platformVersion,
      'deviceName': await deviceName,
      'deviceModel': await deviceModel,
      'systemVersion': await systemVersion,
      'appVersion': await appVersion,
      'buildNumber': await buildNumber,
      'packageName': await packageName,
      'isPhysicalDevice': await isPhysicalDevice,
      'isIOS': await isIOS,
      'isAndroid': await isAndroid,
      'isWeb': await isWeb,
      'isDesktop': await isDesktop,
    };
  }
}
