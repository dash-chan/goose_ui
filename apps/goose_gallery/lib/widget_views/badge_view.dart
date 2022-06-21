import 'package:flutter/material.dart';
import 'package:goose_gallery/widgets/playbox.dart';
import 'package:goose_gallery/widgets/widget_view.dart';
import 'package:goose_ui/goose_ui.dart';

class BadgeView extends StatelessWidget {
  const BadgeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WidgetView(
      title: 'Badge',
      desc: '',
      children: [
        PlayBox(
          title: 'Ribbon Badge',
          codes: TextSpan(),
          desc: 'desc',
          children: [
            ARibbonBadge(
                child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                border: Border.all(),
              ),
            )),
          ],
        )
      ],
    );
  }
}
