import 'package:intl/intl.dart';

// Date formatter utility using intl package
class DateFormatter {
  // Common date formats
  static const String dateFormat = 'dd/MM/yyyy';
  static const String timeFormat = 'HH:mm';
  static const String dateTimeFormat = 'dd/MM/yyyy HH:mm';
  static const String fullDateFormat = 'EEEE, dd MMMM yyyy';
  static const String shortDateFormat = 'dd MMM yyyy';
  static const String monthYearFormat = 'MMMM yyyy';
  static const String yearFormat = 'yyyy';

  // Format date with custom pattern
  static String formatDate(DateTime date, String pattern) {
    try {
      return DateFormat(pattern).format(date);
    } catch (e) {
      // Fallback to default format if pattern is invalid
      return DateFormat(dateFormat).format(date);
    }
  }

  // Format date with default pattern
  static String formatDateDefault(DateTime date) {
    return formatDate(date, dateFormat);
  }

  // Format time with default pattern
  static String formatTime(DateTime date) {
    return formatDate(date, timeFormat);
  }

  // Format date and time with default pattern
  static String formatDateTime(DateTime date) {
    return formatDate(date, dateTimeFormat);
  }

  // Format date with full format (e.g., "Monday, 15 January 2024")
  static String formatFullDate(DateTime date) {
    return formatDate(date, fullDateFormat);
  }

  // Format date with short format (e.g., "15 Jan 2024")
  static String formatShortDate(DateTime date) {
    return formatDate(date, shortDateFormat);
  }

  // Format month and year (e.g., "January 2024")
  static String formatMonthYear(DateTime date) {
    return formatDate(date, monthYearFormat);
  }

  // Format year only
  static String formatYear(DateTime date) {
    return formatDate(date, yearFormat);
  }

  // Format relative time (e.g., "2 hours ago", "yesterday")
  static String formatRelativeTime(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays > 0) {
      if (difference.inDays == 1) {
        return 'Yesterday';
      } else if (difference.inDays < 7) {
        return '${difference.inDays} days ago';
      } else if (difference.inDays < 30) {
        final weeks = (difference.inDays / 7).floor();
        return '$weeks week${weeks > 1 ? 's' : ''} ago';
      } else if (difference.inDays < 365) {
        final months = (difference.inDays / 30).floor();
        return '$months month${months > 1 ? 's' : ''} ago';
      } else {
        final years = (difference.inDays / 365).floor();
        return '$years year${years > 1 ? 's' : ''} ago';
      }
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
    } else {
      return 'Just now';
    }
  }

  // Format time ago with custom thresholds
  static String formatTimeAgo(
    DateTime date, {
    Duration? maxAge,
    String? maxAgeText,
  }) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (maxAge != null && difference > maxAge) {
      return maxAgeText ?? formatDateDefault(date);
    }

    return formatRelativeTime(date);
  }

  // Format date for chat/message (e.g., "Today", "Yesterday", or date)
  static String formatChatDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final messageDate = DateTime(date.year, date.month, date.day);

    if (messageDate == today) {
      return 'Today';
    } else if (messageDate == yesterday) {
      return 'Yesterday';
    } else if (now.difference(date).inDays < 7) {
      return DateFormat('EEEE').format(date); // Day name
    } else {
      return formatDateDefault(date);
    }
  }

  // Format date range
  static String formatDateRange(DateTime startDate, DateTime endDate) {
    if (startDate.year == endDate.year) {
      if (startDate.month == endDate.month) {
        if (startDate.day == endDate.day) {
          return formatDateDefault(startDate);
        } else {
          return '${startDate.day} - ${endDate.day} ${DateFormat('MMMM').format(startDate)} ${startDate.year}';
        }
      } else {
        return '${DateFormat('MMM').format(startDate)} ${startDate.day} - ${DateFormat('MMM').format(endDate)} ${endDate.day}, ${startDate.year}';
      }
    } else {
      return '${formatDateDefault(startDate)} - ${formatDateDefault(endDate)}';
    }
  }

  // Parse date from string
  static DateTime? parseDate(String dateString, String pattern) {
    try {
      return DateFormat(pattern).parse(dateString);
    } catch (e) {
      return null;
    }
  }

  // Parse date from common formats
  static DateTime? parseDateAuto(String dateString) {
    final patterns = [
      'yyyy-MM-dd',
      'dd/MM/yyyy',
      'MM/dd/yyyy',
      'yyyy/MM/dd',
      'dd-MM-yyyy',
      'MM-dd-yyyy',
    ];

    for (final pattern in patterns) {
      final date = parseDate(dateString, pattern);
      if (date != null) {
        return date;
      }
    }

    return null;
  }

  // Check if date is today
  static bool isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  // Check if date is yesterday
  static bool isYesterday(DateTime date) {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return date.year == yesterday.year &&
        date.month == yesterday.month &&
        date.day == yesterday.day;
  }

  // Check if date is this week
  static bool isThisWeek(DateTime date) {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final endOfWeek = startOfWeek.add(const Duration(days: 6));
    return date.isAfter(startOfWeek.subtract(const Duration(days: 1))) &&
        date.isBefore(endOfWeek.add(const Duration(days: 1)));
  }

  // Check if date is this month
  static bool isThisMonth(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year && date.month == now.month;
  }

  // Check if date is this year
  static bool isThisYear(DateTime date) {
    return date.year == DateTime.now().year;
  }

  // Get age from birth date
  static int getAge(DateTime birthDate) {
    final now = DateTime.now();
    int age = now.year - birthDate.year;
    if (now.month < birthDate.month ||
        (now.month == birthDate.month && now.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  // Get days between two dates
  static int getDaysBetween(DateTime startDate, DateTime endDate) {
    return endDate.difference(startDate).inDays;
  }

  // Get working days between two dates (excluding weekends)
  static int getWorkingDaysBetween(DateTime startDate, DateTime endDate) {
    int workingDays = 0;
    DateTime current = startDate;

    while (current.isBefore(endDate) || current.isAtSameMomentAs(endDate)) {
      if (current.weekday != DateTime.saturday &&
          current.weekday != DateTime.sunday) {
        workingDays++;
      }
      current = current.add(const Duration(days: 1));
    }

    return workingDays;
  }
}
