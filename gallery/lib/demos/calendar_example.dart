import 'package:flutter/material.dart';
import 'package:gallery/widgets/code_wrapper.dart';
import 'package:gallery/widgets/page_wrapper.dart';
import 'package:goose_ui/goose_ui.dart';

class CalendarExample extends StatefulWidget {
  const CalendarExample({Key? key}) : super(key: key);

  @override
  State<CalendarExample> createState() => _CalendarExampleState();
}

class _CalendarExampleState extends State<CalendarExample> {
  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      children: [
        CodeWrapper(
          title: 'default',
          children: [
            GRawCalendar(
              showToday: true,
              year: 2022,
              month: 1,
              offset: -1,
            ),
          ],
          codeBlock: TextSpan(),
        ),
        CodeWrapper(
          title: 'default',
          children: [
            SizedBox(
              height: 500,
              child: GCalendar.date(
                firstDate: DateTime(2020, 1),
                lastDate: DateTime(2025, 1),
                dateSelected: (value) {
                  print(value);
                },
              ),
            ),
          ],
          codeBlock: TextSpan(),
        ),
        CodeWrapper(
          title: 'default',
          children: [
            SizedBox(
              height: 500,
              child: GCalendar.range(
                firstDate: DateTime(2020, 1),
                lastDate: DateTime(2025, 1),
                dateRangeSelected: (range) {
                  print(range);
                },
              ),
            ),
          ],
          codeBlock: TextSpan(),
        ),
      ],
    );
  }
}
