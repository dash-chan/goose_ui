import 'package:flutter/material.dart';
import 'package:goose_ui/src/extensions/datetime_extension.dart';

typedef RawDayBuilder = Widget Function({
  required bool isToday,
  required bool isCurrentMonth,
  required bool isLastMonth,
  required bool isNextMonth,
  required DateTime date,
  required DateTime currentMonth,
});

class GRawCalendar extends StatefulWidget {
  final bool showToday;
  final int offset;
  final int year;
  final int month;
  final RawDayBuilder? dayBuilder;
  final double aspectRatio;

  const GRawCalendar(
      {Key? key,
      this.showToday = true,
      this.offset = 0,
      required this.year,
      required this.month,
      this.dayBuilder,
      this.aspectRatio = 1})
      : super(key: key);

  @override
  State<GRawCalendar> createState() => _GRawCalendarState();
}

class _GRawCalendarState extends State<GRawCalendar> {
  DateTime get _firstDay => DateTime(widget.year, widget.month);
  int get _prefixOffset => ((_firstDay.weekday - 1) % 7 - widget.offset) % 7;
  DateTime get _startDate => _firstDay.subtract(Duration(days: _prefixOffset));

  List<DateTime> getMonthDates() {
    var start = _startDate;
    List<DateTime> _dates = [];
    bool isExactDivision = (_prefixOffset + _firstDay.lastDay.day) % 7 == 0;
    int fillUpCount = (_prefixOffset + _firstDay.lastDay.day) ~/ 7;
    if (!isExactDivision) {
      fillUpCount += 1;
    }
    for (var i = 0; i < fillUpCount; i++) {
      for (var j = 0; j < 7; j++) {
        _dates.add(start.add(Duration(days: j + i * 7)));
      }
    }

    return _dates;
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        childAspectRatio: widget.aspectRatio,
        mainAxisSpacing: 2,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: getMonthDates().map((e) {
        bool isCurrentMonth = e.year == widget.year && e.month == widget.month;
        bool isToday = e.isToday;
        Color? color;
        if (!isCurrentMonth) {
          color = Colors.black26;
        }
        if (isToday) {
          color = Colors.blue;
        }
        if (!isCurrentMonth && isToday) {
          color = Colors.blue.withOpacity(0.3);
        }
        if (widget.dayBuilder != null) {
          final currentMonth = DateTime(widget.year, widget.month);
          bool isLastMonth = false;
          bool isNextMonth = false;
          if (!isCurrentMonth) {
            isLastMonth = e.isBefore(currentMonth);
            isNextMonth = e.isAfter(currentMonth);
          }
          return widget.dayBuilder!(
            isToday: isToday,
            isCurrentMonth: isCurrentMonth,
            isLastMonth: isLastMonth,
            isNextMonth: isNextMonth,
            currentMonth: currentMonth,
            date: e,

            // isCurrentMonth,
            // e,
            // DateTime(widget.year, widget.month),
          );
        }
        return Center(
          child: Text(
            e.day.toString(),
            style: TextStyle(color: color),
          ),
        );
      }).toList(),
    );
  }
}
