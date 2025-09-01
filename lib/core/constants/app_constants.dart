class AppConstants {
  // App Info
  static const String appName = 'Template Bloc';
  static const String appVersion = '1.0.0';
  static const String appBuildNumber = '1';

  // API Configuration
  static const String baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: 'https://api.example.com',
  );
  static const String apiVersion = '/v1';
  static const int connectionTimeout = 30000; // 30 seconds
  static const int receiveTimeout = 30000; // 30 seconds

  // Storage Keys
  static const String authTokenKey = 'auth_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String userDataKey = 'user_data';
  static const String appSettingsKey = 'app_settings';
  static const String onboardingCompletedKey = 'onboarding_completed';

  // Feature Flags
  static const bool enableAnalytics = bool.fromEnvironment(
    'ENABLE_ANALYTICS',
    defaultValue: true,
  );
  static const bool enableCrashlytics = bool.fromEnvironment(
    'ENABLE_CRASHLYTICS',
    defaultValue: true,
  );
  static const bool enableAds = bool.fromEnvironment(
    'ENABLE_ADS',
    defaultValue: false,
  );

  // Cache Configuration
  static const int maxCacheAge = 7 * 24 * 60 * 60 * 1000; // 7 days
  static const int maxCacheSize = 50 * 1024 * 1024; // 50 MB

  // Animation Durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 300);
  static const Duration longAnimation = Duration(milliseconds: 500);

  // UI Constants
  static const double defaultPadding = 16.0;
  static const double defaultRadius = 8.0;
  static const double defaultIconSize = 24.0;

  // Supported Languages
  static const List<String> supportedLocales = ['en', 'id'];
  static const String defaultLocale = 'en';

  // Error Messages
  static const String networkErrorMessage = 'Network error occurred';
  static const String serverErrorMessage = 'Server error occurred';
  static const String unknownErrorMessage = 'Unknown error occurred';
  static const String timeoutErrorMessage = 'Request timeout';

  // Validation Messages
  static const String emailRequiredMessage = 'Email is required';
  static const String passwordRequiredMessage = 'Password is required';
  static const String invalidEmailMessage = 'Please enter a valid email';
  static const String passwordTooShortMessage =
      'Password must be at least 6 characters';
}
