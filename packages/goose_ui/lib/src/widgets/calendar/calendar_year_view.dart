import 'package:flutter/material.dart';
import 'package:goose_ui/src/widgets/common/grid_layout.dart';
import 'package:intl/intl.dart';

class CalendarYearView extends StatelessWidget {
  const CalendarYearView({
    super.key,
    required this.year,
    this.fullScreen = true,
  });

  final int year;
  final bool fullScreen;

  List<String> _monthNames(BuildContext context) {
    final formatter =
        DateFormat.MMM(Localizations.localeOf(context).languageCode);
    return List.generate(
        12, (index) => formatter.format(DateTime(year, index + 1)));
  }

  @override
  Widget build(BuildContext context) {
    return AGridLayout(
      count: 3,
      children: _monthNames(context).map((e) => Text(e)).toList(),
    );
  }
}
