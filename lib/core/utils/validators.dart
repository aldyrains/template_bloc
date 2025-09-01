// Validation utility for forms and data validation
class Validators {
  // Email validation
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    
    final emailRegex = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    
    return null;
  }

  // Password validation
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }
    
    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase letter';
    }
    
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    }
    
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character';
    }
    
    return null;
  }

  // Confirm password validation
  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    
    if (value != password) {
      return 'Passwords do not match';
    }
    
    return null;
  }

  // Required field validation
  static String? validateRequired(String? value, [String fieldName = 'This field']) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  // Minimum length validation
  static String? validateMinLength(String? value, int minLength, [String fieldName = 'This field']) {
    if (value == null || value.length < minLength) {
      return '$fieldName must be at least $minLength characters long';
    }
    return null;
  }

  // Maximum length validation
  static String? validateMaxLength(String? value, int maxLength, [String fieldName = 'This field']) {
    if (value != null && value.length > maxLength) {
      return '$fieldName must not exceed $maxLength characters';
    }
    return null;
  }

  // Phone number validation
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    
    final digitsOnly = value.replaceAll(RegExp(r'[^\d]'), '');
    
    if (digitsOnly.length < 10) {
      return 'Phone number must be at least 10 digits';
    }
    
    if (digitsOnly.length > 15) {
      return 'Phone number must not exceed 15 digits';
    }
    
    return null;
  }

  // URL validation
  static String? validateUrl(String? value) {
    if (value == null || value.isEmpty) {
      return 'URL is required';
    }
    
    try {
      final uri = Uri.parse(value);
      if (!uri.hasScheme || (!uri.hasAuthority && uri.path.isEmpty)) {
        return 'Please enter a valid URL';
      }
    } catch (e) {
      return 'Please enter a valid URL';
    }
    
    return null;
  }

  // Numeric validation
  static String? validateNumeric(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    
    if (double.tryParse(value) == null) {
      return 'Please enter a valid number';
    }
    
    return null;
  }

  // Integer validation
  static String? validateInteger(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    
    if (int.tryParse(value) == null) {
      return 'Please enter a valid integer';
    }
    
    return null;
  }

  // Positive number validation
  static String? validatePositiveNumber(String? value) {
    final numericError = validateNumeric(value);
    if (numericError != null) return numericError;
    
    final number = double.parse(value!);
    if (number <= 0) {
      return 'Please enter a positive number';
    }
    
    return null;
  }

  // Date validation
  static String? validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Date is required';
    }
    
    try {
      DateTime.parse(value);
    } catch (e) {
      return 'Please enter a valid date (YYYY-MM-DD)';
    }
    
    return null;
  }

  // Future date validation
  static String? validateFutureDate(String? value) {
    final dateError = validateDate(value);
    if (dateError != null) return dateError;
    
    final date = DateTime.parse(value!);
    final now = DateTime.now();
    
    if (date.isBefore(now)) {
      return 'Date must be in the future';
    }
    
    return null;
  }

  // Past date validation
  static String? validatePastDate(String? value) {
    final dateError = validateDate(value);
    if (dateError != null) return dateError;
    
    final date = DateTime.parse(value!);
    final now = DateTime.now();
    
    if (date.isAfter(now)) {
      return 'Date must be in the past';
    }
    
    return null;
  }

  // Username validation
  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username is required';
    }
    
    if (value.length < 3) {
      return 'Username must be at least 3 characters long';
    }
    
    if (value.length > 20) {
      return 'Username must not exceed 20 characters';
    }
    
    final usernameRegex = RegExp(r'^[a-zA-Z0-9_-]+$');
    
    if (!usernameRegex.hasMatch(value)) {
      return 'Username can only contain letters, numbers, underscores, and hyphens';
    }
    
    return null;
  }

  // Range validation for numbers
  static String? validateRange(
    String? value,
    double min,
    double max,
    [String fieldName = 'This field']
  ) {
    final numericError = validateNumeric(value);
    if (numericError != null) return numericError;
    
    final number = double.parse(value!);
    
    if (number < min || number > max) {
      return '$fieldName must be between $min and $max';
    }
    
    return null;
  }

  // Pattern validation with custom regex
  static String? validatePattern(
    String? value,
    RegExp pattern,
    String errorMessage,
  ) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    
    if (!pattern.hasMatch(value)) {
      return errorMessage;
    }
    
    return null;
  }

  // Check if string contains only letters
  static String? validateLettersOnly(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return 'This field can only contain letters and spaces';
    }
    
    return null;
  }

  // Check if string contains only digits
  static String? validateDigitsOnly(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'This field can only contain digits';
    }
    
    return null;
  }

  // Check if string contains only alphanumeric characters
  static String? validateAlphanumeric(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    
    if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
      return 'This field can only contain letters and numbers';
    }
    
    return null;
  }

  // Check if string is a valid time (HH:MM format)
  static String? validateTime(String? value) {
    if (value == null || value.isEmpty) {
      return 'Time is required';
    }
    
    final timeRegex = RegExp(r'^([0-1]?[0-9]|2[0-3]):[0-5][0-9]$');
    
    if (!timeRegex.hasMatch(value)) {
      return 'Please enter a valid time (HH:MM)';
    }
    
    return null;
  }

  // Check if string is a valid color hex code
  static String? validateHexColor(String? value) {
    if (value == null || value.isEmpty) {
      return 'Color is required';
    }
    
    final hexRegex = RegExp(r'^#?([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$');
    
    if (!hexRegex.hasMatch(value)) {
      return 'Please enter a valid hex color code';
    }
    
    return null;
  }
}
