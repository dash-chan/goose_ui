import 'package:flutter/material.dart';
import 'package:goose_ui/src/extensions/date_extension.dart';
import 'package:goose_ui/src/extensions/list_extension.dart';
import 'package:goose_ui/src/widgets/calendar/widgets/default_week_item.dart';
import 'package:goose_ui/src/widgets/common/grid_layout.dart';

import 'widgets/default_day_item.dart';

/// Weekday labels builder.
///
/// This widget is used to build weekday labels.
typedef WeekdayBuilder = Widget Function(BuildContext context, int weekday);

/// DayBuilder is used to build day widget.
typedef DayBuilder = Widget Function(
  BuildContext context,
  DateTime date,
  bool isSelected,
  bool isToday,
  bool isLastMonth,
  bool isNextMonth,
  bool isThisMonth,
);

typedef DayChildBuilder = Widget Function(BuildContext context, DateTime date);

class CalendarMonthView extends StatelessWidget {
  const CalendarMonthView({
    super.key,
    required this.date,
    this.fullScreen = true,
    this.offset = 0,
    WeekdayBuilder? weekdayBuilder,
    this.dayChildBuilder,
    this.dayBuilder,
    this.selectedDate,
    this.onSelected,
  }) : _weekdayBuilder = weekdayBuilder ??
            (fullScreen
                ? _defaultFullWeekdayBuilder
                : _defaultFullWeekdayBuilder);

  CalendarMonthView.value({
    super.key,
    required int year,
    required int month,
    this.fullScreen = true,
    this.offset = 0,
    WeekdayBuilder? weekdayBuilder,
    this.dayChildBuilder,
    this.dayBuilder,
    this.selectedDate,
    this.onSelected,
  })  : date = DateTime(year, month),
        _weekdayBuilder = weekdayBuilder ??
            (fullScreen ? _defaultFullWeekdayBuilder : _defaultWeekdayBuilder);

  final DateTime date;
  final DateTime? selectedDate;
  final bool fullScreen;
  final WeekdayBuilder _weekdayBuilder;
  final DayChildBuilder? dayChildBuilder;
  final DayBuilder? dayBuilder;
  final ValueChanged<DateTime>? onSelected;

  // TODO get offset from ThemeData
  /// the offset of the week
  ///
  /// default set to `0` which means the first week is Monday
  final int offset;

  int get _offset => offset % 7;

  DateTime get _startDate => date.subtract(Duration(days: _prefixDatesCount));

  List<DateTime> get _dates =>
      List.generate(7 * 6, (index) => _startDate.add(Duration(days: index)));

  int get _prefixDatesCount => (date.weekday - _offset + 7 - 1) % 7;

  @override
  Widget build(BuildContext context) {
    return AGridLayout(
      count: 7,
      spacing: 8,
      children: [
        for (final weekday in [1, 2, 3, 4, 5, 6, 7].offset(offset))
          _weekdayBuilder(context, weekday),
        for (final iDate in _dates)
          dayBuilder?.call(
                context,
                iDate,
                selectedDate == null ? false : iDate.sameDay(selectedDate!),
                iDate.sameDay(DateTime.now()),
                iDate.sameLastMonth(date),
                iDate.sameNextMonth(date),
                iDate.sameMonth(date),
              ) ??
              DefaultDayItem(
                date: iDate,
                isSelected:
                    selectedDate == null ? false : iDate.sameDay(selectedDate!),
                isToday: iDate.sameDay(DateTime.now()),
                isLastMonth: iDate.sameLastMonth(date),
                isNextMonth: iDate.sameNextMonth(date),
                isThisMonth: iDate.sameMonth(date),
                fullScreen: fullScreen,
                onSelected: onSelected,
                child: dayChildBuilder?.call(context, iDate),
              )
      ],
    );
  }
}

Widget _defaultFullWeekdayBuilder(BuildContext context, int weekday) {
  return DefaultWeekItem(fullScreen: true, weekday: weekday);
}

Widget _defaultWeekdayBuilder(BuildContext context, int weekday) {
  return DefaultWeekItem(fullScreen: false, weekday: weekday);
}
