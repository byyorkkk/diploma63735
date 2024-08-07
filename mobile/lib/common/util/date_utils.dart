abstract final class ADDateUtils {
  static String weekdayIndicator(DateTime date) => switch (date.weekday) {
        1 => 'M',
        2 => 'TU',
        3 => 'W',
        4 => 'TH',
        5 => 'F',
        6 => 'SA',
        7 => 'SU',
        _ => throw StateError('Could not translate weekday for date $date')
      };
}

extension XDateTime on DateTime {
  bool sameDateAs(DateTime dateTime) {
    return day == dateTime.day &&
        month == dateTime.month &&
        year == dateTime.year;
  }

  DateTime get date => DateTime.utc(year, month, day);
}
