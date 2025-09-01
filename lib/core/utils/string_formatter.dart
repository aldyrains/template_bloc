// String formatter utility for common string operations
class StringFormatter {
  // Capitalize first letter of each word
  static String capitalizeWords(String text) {
    if (text.isEmpty) return text;

    return text.split(' ').map((word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(' ');
  }

  // Capitalize first letter only
  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  // Convert to title case
  static String toTitleCase(String text) {
    return capitalizeWords(text);
  }

  // Convert to sentence case
  static String toSentenceCase(String text) {
    if (text.isEmpty) return text;

    // Split by sentences and capitalize first letter of each
    final sentences = text.split(RegExp(r'[.!?]+'));
    return sentences.map((sentence) {
      final trimmed = sentence.trim();
      if (trimmed.isEmpty) return trimmed;
      return capitalize(trimmed);
    }).join('. ');
  }

  // Convert to camel case
  static String toCamelCase(String text) {
    if (text.isEmpty) return text;

    final words = text.split(RegExp(r'[\s\-_]+'));
    if (words.isEmpty) return text;

    final firstWord = words[0].toLowerCase();
    final otherWords = words.skip(1).map((word) => capitalize(word));

    return firstWord + otherWords.join();
  }

  // Convert to snake case
  static String toSnakeCase(String text) {
    if (text.isEmpty) return text;

    return text
        .replaceAllMapped(
            RegExp(r'[A-Z]'), (match) => '_${match.group(0)!.toLowerCase()}')
        .replaceAll(RegExp(r'[\s\-_]+'), '_')
        .toLowerCase()
        .replaceAll(RegExp(r'^_+|_+$'), '');
  }

  // Convert to kebab case
  static String toKebabCase(String text) {
    if (text.isEmpty) return text;

    return text
        .replaceAllMapped(
            RegExp(r'[A-Z]'), (match) => '-${match.group(0)!.toLowerCase()}')
        .replaceAll(RegExp(r'[\s\-_]+'), '-')
        .toLowerCase()
        .replaceAll(RegExp(r'^-+|-+$'), '');
  }

  // Convert to pascal case
  static String toPascalCase(String text) {
    if (text.isEmpty) return text;

    final words = text.split(RegExp(r'[\s\-_]+'));
    return words.map((word) => capitalize(word)).join();
  }

  // Truncate text with ellipsis
  static String truncate(String text, int maxLength, {String suffix = '...'}) {
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength - suffix.length)}$suffix';
  }

  // Truncate text at word boundary
  static String truncateWords(String text, int maxWords,
      {String suffix = '...'}) {
    final words = text.split(' ');
    if (words.length <= maxWords) return text;

    final truncatedWords = words.take(maxWords);
    return '${truncatedWords.join(' ')}$suffix';
  }

  // Remove extra spaces
  static String removeExtraSpaces(String text) {
    return text.trim().replaceAll(RegExp(r'\s+'), ' ');
  }

  // Remove special characters
  static String removeSpecialCharacters(String text) {
    return text.replaceAll(RegExp(r'[^\w\s]'), '');
  }

  // Remove numbers
  static String removeNumbers(String text) {
    return text.replaceAll(RegExp(r'\d'), '');
  }

  // Keep only numbers
  static String keepOnlyNumbers(String text) {
    return text.replaceAll(RegExp(r'[^\d]'), '');
  }

  // Keep only letters
  static String keepOnlyLetters(String text) {
    return text.replaceAll(RegExp(r'[^a-zA-Z]'), '');
  }

  // Keep only letters and numbers
  static String keepOnlyAlphanumeric(String text) {
    return text.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '');
  }

  // Format phone number
  static String formatPhoneNumber(String phoneNumber) {
    final cleaned = keepOnlyNumbers(phoneNumber);

    if (cleaned.length == 10) {
      return '(${cleaned.substring(0, 3)}) ${cleaned.substring(3, 6)}-${cleaned.substring(6)}';
    } else if (cleaned.length == 11 && cleaned.startsWith('1')) {
      return '+1 (${cleaned.substring(1, 4)}) ${cleaned.substring(4, 7)}-${cleaned.substring(7)}';
    }

    return phoneNumber;
  }

  // Format credit card number
  static String formatCreditCard(String cardNumber) {
    final cleaned = keepOnlyNumbers(cardNumber);

    if (cleaned.length == 16) {
      return '${cleaned.substring(0, 4)} ${cleaned.substring(4, 8)} ${cleaned.substring(8, 12)} ${cleaned.substring(12)}';
    } else if (cleaned.length == 15) {
      return '${cleaned.substring(0, 4)} ${cleaned.substring(4, 10)} ${cleaned.substring(10)}';
    }

    return cardNumber;
  }

  // Format currency
  static String formatCurrency(double amount,
      {String symbol = '\$', int decimalPlaces = 2}) {
    final formatted = amount.toStringAsFixed(decimalPlaces);
    final parts = formatted.split('.');
    final integerPart = parts[0];
    final decimalPart = parts.length > 1 ? parts[1] : '';

    // Add commas for thousands
    final formattedInteger = integerPart.replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (match) => '${match[1]},',
    );

    if (decimalPart.isNotEmpty) {
      return '$symbol$formattedInteger.$decimalPart';
    }
    return '$symbol$formattedInteger';
  }

  // Format file size
  static String formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    }
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
  }

  // Generate initials from name
  static String getInitials(String name) {
    if (name.isEmpty) return '';

    final words = name.trim().split(RegExp(r'\s+'));
    if (words.length == 1) {
      return words[0][0].toUpperCase();
    }

    return '${words[0][0]}${words[words.length - 1][0]}'.toUpperCase();
  }

  // Mask sensitive information
  static String maskText(String text,
      {int visibleStart = 2, int visibleEnd = 2, String maskChar = '*'}) {
    if (text.length <= visibleStart + visibleEnd) return text;

    final start = text.substring(0, visibleStart);
    final end = text.substring(text.length - visibleEnd);
    final masked = maskChar * (text.length - visibleStart - visibleEnd);

    return '$start$masked$end';
  }

  // Mask email
  static String maskEmail(String email) {
    final parts = email.split('@');
    if (parts.length != 2) return email;

    final username = parts[0];
    final domain = parts[1];

    if (username.length <= 2) return email;

    final maskedUsername = '${username[0]}***${username[username.length - 1]}';
    return '$maskedUsername@$domain';
  }

  // Mask phone number
  static String maskPhoneNumber(String phoneNumber) {
    final cleaned = keepOnlyNumbers(phoneNumber);

    if (cleaned.length == 10) {
      return '***-***-${cleaned.substring(6)}';
    } else if (cleaned.length == 11 && cleaned.startsWith('1')) {
      return '+1 ***-***-${cleaned.substring(7)}';
    }

    return phoneNumber;
  }

  // Check if string is numeric
  static bool isNumeric(String text) {
    return double.tryParse(text) != null;
  }

  // Check if string is alphabetic
  static bool isAlphabetic(String text) {
    return RegExp(r'^[a-zA-Z\s]+$').hasMatch(text);
  }

  // Check if string is alphanumeric
  static bool isAlphanumeric(String text) {
    return RegExp(r'^[a-zA-Z0-9\s]+$').hasMatch(text);
  }

  // Check if string is valid email
  static bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  // Check if string is valid URL
  static bool isValidUrl(String url) {
    try {
      Uri.parse(url);
      return true;
    } catch (_) {
      return false;
    }
  }

  // Count words
  static int countWords(String text) {
    if (text.trim().isEmpty) return 0;
    return text.trim().split(RegExp(r'\s+')).length;
  }

  // Count characters (excluding spaces)
  static int countCharacters(String text) {
    return text.replaceAll(RegExp(r'\s'), '').length;
  }

  // Reverse string
  static String reverse(String text) {
    return text.split('').reversed.join();
  }

  // Check if string is palindrome
  static bool isPalindrome(String text) {
    final cleaned = text.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]'), '');
    return cleaned == reverse(cleaned);
  }
}
