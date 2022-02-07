import 'package:flutter/material.dart';
import 'package:goose_ui/goose_ui.dart';
import 'package:goose_ui/src/extensions/datetime_extension.dart';

// TODO
typedef DayBuilder = Function();

/// 日历
class GCalendar extends StatefulWidget {
  final DateTime firstDate;
  final DateTime lastDate;
  final DateTime? initialDate;
  final ValueChanged<DateTime>? dateSelected;
  final ValueChanged<DateTimeRange>? dateRangeSelected;

  const GCalendar.date(
      {Key? key,
      required this.firstDate,
      required this.lastDate,
      this.initialDate,
      required this.dateSelected})
      : dateRangeSelected = null,
        assert(dateSelected != null),
        super(key: key);

  const GCalendar.range(
      {Key? key,
      required this.firstDate,
      required this.lastDate,
      this.initialDate,
      required this.dateRangeSelected})
      : dateSelected = null,
        assert(dateRangeSelected != null),
        super(key: key);

  @override
  State<GCalendar> createState() => _GCalendarState();
}

class _GCalendarState extends State<GCalendar> {
  late PageController _pageController;

  late DateTime _initialDate;

  DateTime? _selectedDate;

  DateTime? _dateRangeStart;
  DateTime? _dateRangeEnd;

  int getMonths(DateTime first, DateTime last) {
    var prefix = first.month - 1;
    var suffix = last.month;
    return (last.year - first.year) * 12 - prefix + suffix;
  }

  int get itemCount => getMonths(widget.firstDate, widget.lastDate);

  int get initIndex => getMonths(widget.firstDate, _initialDate) - 1;

  @override
  void initState() {
    super.initState();
    _initialDate = widget.initialDate ?? DateTime.now();
    _pageController = PageController(initialPage: initIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        DateTime currentDate =
            DateTime(widget.firstDate.year, widget.firstDate.month + index);
        return Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    _pageController
                        .jumpToPage(_pageController.page!.round() - 12);
                  },
                  icon: const Icon(Icons.keyboard_arrow_left_rounded),
                ),
                IconButton(
                  onPressed: () {
                    _pageController.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOutCubic);
                  },
                  icon: const Icon(Icons.arrow_left),
                ),
                Expanded(
                  child: Center(
                      child: Text('${currentDate.year}-${currentDate.month}')),
                ),
                IconButton(
                  onPressed: () {
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOutCubic);
                  },
                  icon: const Icon(Icons.arrow_right),
                ),
                IconButton(
                  onPressed: () {
                    _pageController
                        .jumpToPage(_pageController.page!.round() + 12);
                  },
                  icon: const Icon(Icons.keyboard_arrow_right_rounded),
                ),
              ],
            ),
            Row(
              children:
                  GooseLocalizations.of(context).current.weekNames.map((e) {
                return Expanded(child: Center(child: Text(e)));
              }).toList(),
            ),
            Expanded(
              child: GRawCalendar(
                year: currentDate.year,
                month: currentDate.month,
                aspectRatio: 2,
                dayBuilder: (
                    {required bool isToday,
                    required bool isCurrentMonth,
                    required bool isLastMonth,
                    required bool isNextMonth,
                    required DateTime date,
                    required DateTime currentMonth}) {
                  Color? color;
                  Color backgroundColor = Colors.transparent;
                  Color selectedColor = Colors.transparent;
                  ShapeBorder border = RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  );
                  ShapeBorder backgroundBorder = RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  );
                  if (!isCurrentMonth) {
                    color = Colors.black26;
                  }
                  if (isToday) {
                    color = Colors.blue;
                    if (!isCurrentMonth) color = Colors.blue.withOpacity(0.2);
                  }
                  // selected day
                  if (date.sameDay(_selectedDate)) {
                    color = Colors.white;
                    backgroundColor = Colors.blue;
                  }
                  // selected range
                  if (date.sameDay(_dateRangeStart)) {
                    color = Colors.white;
                    backgroundColor = Colors.blue;
                    selectedColor = Colors.blue;
                    if (_dateRangeEnd != null) {
                      backgroundColor = Colors.blue[100]!;
                      backgroundBorder = const RoundedRectangleBorder(
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(32)));
                    }
                  }
                  if (date.sameDay(_dateRangeEnd)) {
                    color = Colors.white;
                    backgroundColor = Colors.blue[100]!;
                    selectedColor = Colors.blue;
                    backgroundBorder = const RoundedRectangleBorder(
                        borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(32)));
                  }
                  if (_dateRangeStart != null && _dateRangeEnd != null) {
                    if (date.isAfter(_dateRangeStart!) &&
                        date.isBefore(_dateRangeEnd!)) {
                      backgroundColor = Colors.blue[100]!;
                      backgroundBorder = const RoundedRectangleBorder();
                    }
                  }

                  if (_dateRangeStart?.sameDay(_dateRangeEnd) == true) {
                    backgroundBorder = RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    );
                  }
                  return Material(
                    color: backgroundColor,
                    shape: backgroundBorder,
                    clipBehavior: Clip.none,
                    child: GRawButton(
                      onPressed: () {
                        // not current month select
                        if (isLastMonth) {
                          _pageController.previousPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOutCubic,
                          );
                        } else if (isNextMonth) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOutCubic,
                          );
                        }
                        // date select mode
                        if (widget.dateSelected != null) {
                          _selectedDate = date;
                          widget.dateSelected!(date);
                        }

                        if (widget.dateRangeSelected != null) {
                          if (_dateRangeStart == null) {
                            _dateRangeStart = date;
                          } else if (_dateRangeEnd == null) {
                            _dateRangeEnd = date;
                          } else {
                            _dateRangeStart = date;
                            _dateRangeEnd = null;
                          }
                          if (_dateRangeStart != null &&
                              _dateRangeEnd != null) {
                            if (_dateRangeStart!.isAfter(_dateRangeEnd!)) {
                              var cache = _dateRangeStart!;
                              _dateRangeStart = _dateRangeEnd;
                              _dateRangeEnd = cache;
                            }
                            widget.dateRangeSelected!(DateTimeRange(
                              start: _dateRangeStart!,
                              end: _dateRangeEnd!,
                            ));
                          }
                        }

                        setState(() {});
                      },
                      shape: border,
                      color: selectedColor,
                      child: Center(
                        child: Text(
                          date.day.toString(),
                          style: TextStyle(color: color),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
      itemCount: itemCount,
    );
  }
}
