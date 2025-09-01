class Constants {
  // App Information
  static const String appName = 'Template Bloc';
  static const String appVersion = '1.0.0';
  static const String appDescription =
      'A Flutter template with Clean Architecture and Bloc state management';

  // Navigation Routes
  static const String onboardingRoute = '/onboarding';
  static const String loginRoute = '/login';
  static const String signupRoute = '/signup';
  static const String homeRoute = '/home';

  // Storage Keys
  static const String userTokenKey = 'user_token';
  static const String userDataKey = 'user_data';
  static const String isFirstTimeKey = 'is_first_time';
  static const String themeModeKey = 'theme_mode';
  static const String languageKey = 'language';

  // API Endpoints
  static const String baseUrl = 'https://api.example.com';
  static const String loginEndpoint = '/auth/login';
  static const String signupEndpoint = '/auth/signup';
  static const String refreshTokenEndpoint = '/auth/refresh';
  static const String userProfileEndpoint = '/user/profile';

  // Validation Rules
  static const int minPasswordLength = 6;
  static const int minNameLength = 2;
  static const int maxNameLength = 50;
  static const int maxBioLength = 200;

  // UI Constants
  static const double defaultPadding = 16.0;
  static const double defaultMargin = 16.0;
  static const double defaultRadius = 8.0;
  static const double defaultElevation = 2.0;
  static const double defaultIconSize = 24.0;

  // Animation Durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 300);
  static const Duration longAnimation = Duration(milliseconds: 500);

  // Timeouts
  static const Duration networkTimeout = Duration(seconds: 30);
  static const Duration cacheTimeout = Duration(days: 7);

  // Error Messages
  static const String networkErrorMessage =
      'Network error occurred. Please check your connection.';
  static const String serverErrorMessage =
      'Server error occurred. Please try again later.';
  static const String unknownErrorMessage = 'An unknown error occurred.';
  static const String timeoutErrorMessage =
      'Request timeout. Please try again.';
  static const String validationErrorMessage =
      'Please check your input and try again.';

  // Success Messages
  static const String loginSuccessMessage = 'Login successful!';
  static const String signupSuccessMessage = 'Account created successfully!';
  static const String logoutSuccessMessage = 'Logged out successfully!';
  static const String profileUpdateMessage = 'Profile updated successfully!';

  // Placeholder Text
  static const String emailPlaceholder = 'Enter your email';
  static const String passwordPlaceholder = 'Enter your password';
  static const String namePlaceholder = 'Enter your full name';
  static const String confirmPasswordPlaceholder = 'Confirm your password';

  // Button Text
  static const String loginButtonText = 'Login';
  static const String signupButtonText = 'Sign Up';
  static const String logoutButtonText = 'Logout';
  static const String saveButtonText = 'Save';
  static const String cancelButtonText = 'Cancel';
  static const String nextButtonText = 'Next';
  static const String skipButtonText = 'Skip';
  static const String getStartedButtonText = 'Get Started';
}
