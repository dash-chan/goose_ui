import 'package:flutter/material.dart';
import 'package:goose_ui/goose_ui.dart';
import 'package:goose_ui/src/extensions/date_extension.dart';
import 'package:goose_ui/src/widgets/common/grid_layout.dart';

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
            (fullScreen
                ? _defaultFullWeekdayBuilder
                : _defaultFullWeekdayBuilder);

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
        for (final weekday in [1, 2, 3, 4, 5, 6, 7].weekOffset(offset))
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
              _DefaultDayItem(
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
  // TODO l10n
  return Expanded(
    child: Align(
      alignment: Alignment.centerRight,
      child: _defaultWeekdayBuilder(weekday),
    ),
  );
}

_defaultWeekdayBuilder(int weekday) {
  // TODO l10n
  return Text(_getWeekName(weekday));
}

//TODO l10n
String _getWeekName(int weekday) =>
    ['一', '二', '三', '四', '五', '六', '日'][weekday - 1];

class _DefaultDayItem extends StatelessWidget {
  const _DefaultDayItem({
    Key? key,
    required this.date,
    required this.isSelected,
    required this.isToday,
    required this.isLastMonth,
    required this.isNextMonth,
    required this.isThisMonth,
    required this.fullScreen,
    required this.child,
    this.onSelected,
  }) : super(key: key);

  final DateTime date;

  final bool isSelected;

  final bool isToday;

  final bool isLastMonth;

  final bool isNextMonth;

  final bool isThisMonth;

  final bool fullScreen;

  final ValueChanged<DateTime>? onSelected;

  final Widget? child;

  TextStyle _style(BuildContext context) {
    return isThisMonth
        ? TextStyle(
            fontSize: fullScreen ? 14 : 12,
          )
        : TextStyle(
            fontSize: fullScreen ? 14 : 12,
            color: AntColors.neutral.shade500,
          );
  }

  @override
  Widget build(BuildContext context) {
    late Widget result;
    if (!fullScreen) {
      result = SizedBox(
        width: 36,
        height: 24,
        child: Center(child: Text('${date.day}')),
      );
    } else {
      return Expanded(
        child: GestureDetector(
          onTap: () => onSelected?.call(date),
          child: Container(
            height: 116,
            color: isSelected ? AntColors.daybreakBlue.shade200 : null,
            child: Column(
              children: [
                Container(
                  height: 2,
                  color: isToday
                      ? AntColors.daybreakBlue
                      : AntColors.neutral.shade400,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '${date.day}',
                      style: _style(context),
                    ),
                  ),
                ),
                Expanded(child: child ?? const SizedBox.shrink()),
              ],
            ),
          ),
        ),
      );
    }
    return GestureDetector(
      onTap: () => onSelected?.call(date),
      child: result,
    );
  }
}

extension ListX on List<int> {
  /// offset to left
  List<int> weekOffset(int offsets) {
    offsets = offsets % length - 1;
    return [...getRange(offsets + 1, length), ...getRange(0, offsets + 1)];
  }
}
