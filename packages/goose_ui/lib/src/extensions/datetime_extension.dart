extension DateTimeExt on DateTime {
  DateTime get lastDay =>
      DateTime(year, month + 1).subtract(const Duration(days: 1));
  DateTime get firstDay => DateTime(year, month);
  bool sameYear(DateTime? date) => year == date?.year;
  bool sameMonth(DateTime? date) => sameYear(date) && date?.month == month;
  bool sameDay(DateTime? date) => sameMonth(date) && date?.day == day;
  bool get isToday => sameDay(DateTime.now());
}
