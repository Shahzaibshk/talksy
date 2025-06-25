import 'utils.dart';

String getOtherUserName(
  String currentUserId,
  String userId,
  String helperName,
  String userName,
) {
  String otherUserName = '';
  if (currentUserId == userId) {
    otherUserName = helperName;
  } else {
    otherUserName = userName;
  }
  return otherUserName;
}

String timeAgoSinceDate(DateTime dateTime) {
  final now = DateTime.now();
  final difference = now.difference(dateTime);

  if (difference.inSeconds < 60) {
    return 'just now';
  } else if (difference.inMinutes < 60) {
    return '${difference.inMinutes} minute${difference.inMinutes == 1 ? '' : 's'} ago';
  } else if (difference.inHours < 24) {
    return '${difference.inHours} hour${difference.inHours == 1 ? '' : 's'} ago';
  } else if (difference.inDays < 7) {
    return '${difference.inDays} day${difference.inDays == 1 ? '' : 's'} ago';
  } else if (difference.inDays < 30) {
    final weeks = (difference.inDays / 7).floor();
    return '$weeks week${weeks == 1 ? '' : 's'} ago';
  } else if (difference.inDays < 365) {
    final months = (difference.inDays / 30).floor();
    return '$months month${months == 1 ? '' : 's'} ago';
  } else {
    final years = (difference.inDays / 365).floor();
    return '$years year${years == 1 ? '' : 's'} ago';
  }
}

DateTime roundToNearestQuarterHour(DateTime dateTime) {
  // Calculate total minutes including seconds as a fraction
  final double totalMinutesWithSeconds =
      dateTime.minute + (dateTime.second / 60.0);
  // Round to nearest quarter (0, 15, 30, 45)
  final int quarterHours = (totalMinutesWithSeconds / 15.0).round();
  if (quarterHours == 4) {
    // If rounding to 60 minutes, increment the hour and set minutes to 0 as 60 minutes
    // is not a valid minute value
    return DateTime(
      dateTime.year,
      dateTime.month,
      dateTime.day,
      dateTime.hour + 1,
      0, // minutes
      0,
      dateTime.millisecond,
      dateTime.microsecond,
    );
  } else {
    // Otherwise, set the minutes to the nearest quarter hour
    return DateTime(
      dateTime.year,
      dateTime.month,
      dateTime.day,
      dateTime.hour,
      quarterHours * 15, // minutes
      0,
      dateTime.millisecond,
      dateTime.microsecond,
    );
  }
}

// add one hour in to time
String addOneHourInToTime(String startTime) {
  final dateTimeformat = startTime.dateFromTimeFormat;
  final rounded = roundToNearestQuarterHour(dateTimeformat ?? DateTime.now());
  final toTIme = rounded.add(const Duration(hours: 1));
  final formattedToTIme = toTIme.toTimeFormat;
  return formattedToTIme;
}
