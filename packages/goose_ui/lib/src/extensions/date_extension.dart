extension DateExt on DateTime {
  bool sameYear(DateTime datetime) => year == datetime.year;

  bool sameMonth(DateTime datetime) =>
      sameYear(datetime) && month == datetime.month;
  bool sameLastMonth(DateTime datetime) =>
      sameYear(datetime) && month == datetime.month - 1;
  bool sameNextMonth(DateTime datetime) =>
      sameYear(datetime) && month == datetime.month + 1;
  bool sameDay(DateTime datetime) => sameMonth(datetime) && day == datetime.day;
}
