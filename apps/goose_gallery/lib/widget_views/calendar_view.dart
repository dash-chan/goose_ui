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
          title: 'title',
          codes: const TextSpan(),
          desc: '',
          child: SizedBox(
            width: double.infinity,
            child: CalendarMonthView.value(
              year: 2022,
              month: 6,
              offset: -1,
            ),
          ),
        ),
      ],
    );
  }
}
