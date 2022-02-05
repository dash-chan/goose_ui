import 'package:flutter/material.dart';
import 'package:gallery/codeviewer/code_segments.dart';
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
          children: const [
            // BEGIN calendar0
            GRawCalendar(
              showToday: true,
              year: 2022,
              month: 1,
              offset: -1,
            ),
            // END
          ],
          codeBlock: CodeSegments.calendar0(context),
        ),
        CodeWrapper(
          title: 'default',
          children: [
            // BEGIN calendar1
            SizedBox(
              height: 500,
              child: GCalendar.date(
                firstDate: DateTime(2020, 1),
                lastDate: DateTime(2025, 1),
                dateSelected: (value) {},
              ),
            ),
            // END
          ],
          codeBlock: CodeSegments.calendar1(context),
        ),
        CodeWrapper(
          title: 'default',
          children: [
            // BEGIN calendar2
            SizedBox(
              height: 500,
              child: GCalendar.range(
                firstDate: DateTime(2020, 1),
                lastDate: DateTime(2025, 1),
                dateRangeSelected: (range) {},
              ),
            ),
            // END
          ],
          codeBlock: CodeSegments.calendar2(context),
        ),
      ],
    );
  }
}
