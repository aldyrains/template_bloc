// Simple logger utility
// TODO: Replace with proper logging package when available

class Logger {
  static const bool _enableLogging = true;
  static const String _tag = '[TemplateBloc]';

  static void d(String message) {
    if (_enableLogging) {
      print('$_tag DEBUG: $message');
    }
  }

  static void i(String message) {
    if (_enableLogging) {
      print('$_tag INFO: $message');
    }
  }

  static void w(String message) {
    if (_enableLogging) {
      print('$_tag WARN: $message');
    }
  }

  static void e(String message, [dynamic error, StackTrace? stackTrace]) {
    if (_enableLogging) {
      print('$_tag ERROR: $message');
      if (error != null) {
        print('$_tag ERROR DETAILS: $error');
      }
      if (stackTrace != null) {
        print('$_tag STACK TRACE: $stackTrace');
      }
    }
  }

  static void v(String message) {
    if (_enableLogging) {
      print('$_tag VERBOSE: $message');
    }
  }

  static void wtf(String message) {
    if (_enableLogging) {
      print('$_tag WTF: $message');
    }
  }

  // Method to log API requests
  static void logApiRequest(String method, String url,
      {Map<String, dynamic>? headers, dynamic body}) {
    d('API REQUEST: $method $url');
    if (headers != null) {
      d('Headers: $headers');
    }
    if (body != null) {
      d('Body: $body');
    }
  }

  // Method to log API responses
  static void logApiResponse(String method, String url, int statusCode,
      {dynamic body}) {
    d('API RESPONSE: $method $url - Status: $statusCode');
    if (body != null) {
      d('Response Body: $body');
    }
  }

  // Method to log API errors
  static void logApiError(String method, String url, dynamic error) {
    e('API ERROR: $method $url', error);
  }

  // Method to log user actions
  static void logUserAction(String action, {Map<String, dynamic>? parameters}) {
    i('USER ACTION: $action');
    if (parameters != null) {
      i('Parameters: $parameters');
    }
  }

  // Method to log navigation
  static void logNavigation(String from, String to,
      {Map<String, dynamic>? arguments}) {
    i('NAVIGATION: $from -> $to');
    if (arguments != null) {
      i('Arguments: $arguments');
    }
  }

  // Method to log performance metrics
  static void logPerformance(String operation, Duration duration) {
    i('PERFORMANCE: $operation took ${duration.inMilliseconds}ms');
  }

  // Method to log errors with context
  static void logErrorWithContext(String message, String context,
      {dynamic error, StackTrace? stackTrace}) {
    e('$message (Context: $context)', error, stackTrace);
  }

  // Method to log debug info with object details
  static void logObject(String name, dynamic object) {
    d('OBJECT $name: $object');
  }

  // Method to log list of items
  static void logList(String name, List<dynamic> items) {
    d('LIST $name (${items.length} items):');
    for (int i = 0; i < items.length; i++) {
      d('  [$i]: ${items[i]}');
    }
  }

  // Method to log map entries
  static void logMap(String name, Map<dynamic, dynamic> map) {
    d('MAP $name (${map.length} entries):');
    map.forEach((key, value) {
      d('  $key: $value');
    });
  }
}
