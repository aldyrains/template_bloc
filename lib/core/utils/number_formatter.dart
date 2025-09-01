// Number formatter utility for formatting numbers in different ways
class NumberFormatter {
  // Format number with commas for thousands
  static String formatWithCommas(num number) {
    final parts = number.toString().split('.');
    final integerPart = parts[0];
    final decimalPart = parts.length > 1 ? parts[1] : '';

    final formattedInteger = integerPart.replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (match) => '${match[1]},',
    );

    if (decimalPart.isNotEmpty) {
      return '$formattedInteger.$decimalPart';
    }
    return formattedInteger;
  }

  // Format number with custom decimal places
  static String formatDecimal(num number, int decimalPlaces) {
    return number.toStringAsFixed(decimalPlaces);
  }

  // Format percentage
  static String formatPercentage(num number, {int decimalPlaces = 2}) {
    final percentage = (number * 100).toStringAsFixed(decimalPlaces);
    return '$percentage%';
  }

  // Format currency
  static String formatCurrency(
    num amount, {
    String symbol = '\$',
    int decimalPlaces = 2,
    bool showCommas = true,
  }) {
    String formatted;

    if (showCommas) {
      formatted = formatWithCommas(amount);
    } else {
      formatted = amount.toStringAsFixed(decimalPlaces);
    }

    return '$symbol$formatted';
  }

  // Format file size
  static String formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    }
    if (bytes < 1024 * 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
    }
    return '${(bytes / (1024 * 1024 * 1024 * 1024)).toStringAsFixed(1)} TB';
  }

  // Format duration in seconds to human readable format
  static String formatDuration(int seconds) {
    if (seconds < 60) return '${seconds}s';
    if (seconds < 3600) {
      final minutes = seconds ~/ 60;
      final remainingSeconds = seconds % 60;
      if (remainingSeconds == 0) return '${minutes}m';
      return '${minutes}m ${remainingSeconds}s';
    }
    if (seconds < 86400) {
      final hours = seconds ~/ 3600;
      final remainingMinutes = (seconds % 3600) ~/ 60;
      if (remainingMinutes == 0) return '${hours}h';
      return '${hours}h ${remainingMinutes}m';
    }

    final days = seconds ~/ 86400;
    final remainingHours = (seconds % 86400) ~/ 3600;
    if (remainingHours == 0) return '${days}d';
    return '${days}d ${remainingHours}h';
  }

  // Format number to compact form (e.g., 1.2K, 1.5M)
  static String formatCompact(num number) {
    if (number < 1000) return number.toString();
    if (number < 1000000) return '${(number / 1000).toStringAsFixed(1)}K';
    if (number < 1000000000) return '${(number / 1000000).toStringAsFixed(1)}M';
    if (number < 1000000000000) {
      return '${(number / 1000000000).toStringAsFixed(1)}B';
    }
    return '${(number / 1000000000000).toStringAsFixed(1)}T';
  }

  // Format number to ordinal form (e.g., 1st, 2nd, 3rd)
  static String formatOrdinal(int number) {
    if (number < 0) return number.toString();

    final lastDigit = number % 10;
    final lastTwoDigits = number % 100;

    if (lastTwoDigits >= 11 && lastTwoDigits <= 13) {
      return '${number}th';
    }

    switch (lastDigit) {
      case 1:
        return '${number}st';
      case 2:
        return '${number}nd';
      case 3:
        return '${number}rd';
      default:
        return '${number}th';
    }
  }

  // Format number to word form (e.g., one, two, three)
  static String formatToWords(int number) {
    if (number == 0) return 'zero';
    if (number < 0) return 'negative ${formatToWords(number.abs())}';

    if (number < 20) {
      const words = [
        'zero',
        'one',
        'two',
        'three',
        'four',
        'five',
        'six',
        'seven',
        'eight',
        'nine',
        'ten',
        'eleven',
        'twelve',
        'thirteen',
        'fourteen',
        'fifteen',
        'sixteen',
        'seventeen',
        'eighteen',
        'nineteen'
      ];
      return words[number];
    }

    if (number < 100) {
      const tens = [
        '',
        '',
        'twenty',
        'thirty',
        'forty',
        'fifty',
        'sixty',
        'seventy',
        'eighty',
        'ninety'
      ];
      final ten = number ~/ 10;
      final unit = number % 10;

      if (unit == 0) return tens[ten];
      return '${tens[ten]}-${formatToWords(unit)}';
    }

    if (number < 1000) {
      final hundred = number ~/ 100;
      final remainder = number % 100;

      if (remainder == 0) return '${formatToWords(hundred)} hundred';
      return '${formatToWords(hundred)} hundred ${formatToWords(remainder)}';
    }

    if (number < 1000000) {
      final thousand = number ~/ 1000;
      final remainder = number % 1000;

      if (remainder == 0) return '${formatToWords(thousand)} thousand';
      return '${formatToWords(thousand)} thousand ${formatToWords(remainder)}';
    }

    if (number < 1000000000) {
      final million = number ~/ 1000000;
      final remainder = number % 1000000;

      if (remainder == 0) return '${formatToWords(million)} million';
      return '${formatToWords(million)} million ${formatToWords(remainder)}';
    }

    return number.toString(); // For very large numbers
  }

  // Format number to roman numerals
  static String formatToRoman(int number) {
    if (number < 1 || number > 3999) return number.toString();

    const romanNumerals = [
      [1000, 'M'],
      [900, 'CM'],
      [500, 'D'],
      [400, 'CD'],
      [100, 'C'],
      [90, 'XC'],
      [50, 'L'],
      [40, 'XL'],
      [10, 'X'],
      [9, 'IX'],
      [5, 'V'],
      [4, 'IV'],
      [1, 'I'],
    ];

    String result = '';
    int remaining = number;

    for (final numeral in romanNumerals) {
      final value = numeral[0] as int;
      final symbol = numeral[1] as String;

      while (remaining >= value) {
        result += symbol;
        remaining -= value;
      }
    }

    return result;
  }

  // Format number to binary
  static String formatToBinary(int number) {
    if (number == 0) return '0';
    if (number < 0) return '-${formatToBinary(number.abs())}';

    String binary = '';
    int remaining = number;

    while (remaining > 0) {
      binary = '${remaining % 2}$binary';
      remaining = remaining ~/ 2;
    }

    return binary;
  }

  // Format number to hexadecimal
  static String formatToHex(int number) {
    if (number == 0) return '0';
    if (number < 0) return '-${formatToHex(number.abs())}';

    const hexDigits = '0123456789ABCDEF';
    String hex = '';
    int remaining = number;

    while (remaining > 0) {
      hex = '${hexDigits[remaining % 16]}$hex';
      remaining = remaining ~/ 16;
    }

    return hex;
  }

  // Format number to octal
  static String formatToOctal(int number) {
    if (number == 0) return '0';
    if (number < 0) return '-${formatToOctal(number.abs())}';

    String octal = '';
    int remaining = number;

    while (remaining > 0) {
      octal = '${remaining % 8}$octal';
      remaining = remaining ~/ 8;
    }

    return octal;
  }

  // Check if number is even
  static bool isEven(int number) {
    return number % 2 == 0;
  }

  // Check if number is odd
  static bool isOdd(int number) {
    return number % 2 != 0;
  }

  // Check if number is prime
  static bool isPrime(int number) {
    if (number < 2) return false;
    if (number == 2) return true;
    if (number % 2 == 0) return false;

    for (int i = 3; i * i <= number; i += 2) {
      if (number % i == 0) return false;
    }

    return true;
  }

  // Get factorial of number
  static int factorial(int number) {
    if (number < 0) {
      throw ArgumentError('Factorial is not defined for negative numbers');
    }
    if (number == 0 || number == 1) return 1;

    int result = 1;
    for (int i = 2; i <= number; i++) {
      result *= i;
    }

    return result;
  }

  // Get greatest common divisor
  static int gcd(int a, int b) {
    a = a.abs();
    b = b.abs();

    while (b != 0) {
      final temp = b;
      b = a % b;
      a = temp;
    }

    return a;
  }

  // Get least common multiple
  static int lcm(int a, int b) {
    return (a * b).abs() ~/ gcd(a, b);
  }
}
