extension DateExt on DateTime {
  /// is same year with datetime
  bool sameYear(DateTime datetime) => year == datetime.year;

  /// is same month with datetime
  bool sameMonth(DateTime datetime) =>
      sameYear(datetime) && month == datetime.month;

  /// is same day with datetime
  bool sameDay(DateTime datetime) => sameMonth(datetime) && day == datetime.day;

  /// is same hour with datetime
  bool sameHour(DateTime datetime) =>
      sameDay(datetime) && hour == datetime.hour;

  /// is same minute with datetime
  bool sameMinute(DateTime datetime) =>
      sameHour(datetime) && minute == datetime.minute;

  /// is same second with datetime
  bool sameSecond(DateTime datetime) =>
      sameMinute(datetime) && second == datetime.second;

  /// is same last month
  bool sameLastMonth(DateTime datetime) =>
      sameYear(datetime) && month == datetime.month - 1;

  /// is same next month
  bool sameNextMonth(DateTime datetime) =>
      sameYear(datetime) && month == datetime.month + 1;
}
