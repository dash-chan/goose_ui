import 'package:flutter/material.dart';
import 'package:goose_gallery/widgets/playbox.dart';
import 'package:goose_gallery/widgets/widget_view.dart';
import 'package:goose_ui/goose_ui.dart';

class CalendarView extends StatelessWidget {
  const CalendarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WidgetView(
      title: 'Calendar',
      desc: '',
      fullWidth: true,
      children: [
        PlayBox.single(
          title: 'Month View Full',
          codes: const TextSpan(),
          desc: '',
          child: const SizedBox(
            width: double.infinity,
            child: DefaultCalendarWidget(),
          ),
        ),
        PlayBox.single(
          title: 'Month View',
          codes: const TextSpan(),
          desc: '',
          child: CalendarMonthView.value(
            year: 2022,
            month: 6,
            offset: -1,
            fullScreen: false,
            selectedDate: DateTime.now(),
          ),
        ),
        PlayBox.single(
          title: 'Year View',
          codes: const TextSpan(),
          desc: '',
          child: const CalendarYearView(
            year: 2022,
            fullScreen: false,
          ),
        ),
      ],
    );
  }
}

class DefaultCalendarWidget extends StatefulWidget {
  const DefaultCalendarWidget({Key? key}) : super(key: key);

  @override
  State<DefaultCalendarWidget> createState() => _DefaultCalendarWidgetState();
}

class _DefaultCalendarWidgetState extends State<DefaultCalendarWidget> {
  var _selected = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return CalendarMonthView.value(
      year: 2022,
      month: 6,
      selectedDate: _selected,
      onSelected: (date) {
        setState(() {
          _selected = date;
        });
      },
    );
  }
}
