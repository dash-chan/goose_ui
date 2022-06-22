import 'package:flutter/material.dart';
import 'package:goose_gallery/gen/code_segments.dart';
import 'package:goose_gallery/widgets/playbox.dart';
import 'package:goose_gallery/widgets/widget_view.dart';
import 'package:goose_ui/goose_ui.dart';

class BadgeView extends StatelessWidget {
  const BadgeView({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetView(
      title: 'Badge',
      desc: '',
      children: [
        PlayBox(
          title: 'Ribbon Badge',
          codes: CodeSegments.ribbonBadge(context),
          desc: 'desc',
          children: [
            // BEGIN ribbonBadge
            ARibbonBadge(
              placement: ARibbonPlacement.start,
              text: const Text('Hippies'),
              child: Container(
                height: 40,
                width: 100,
                decoration: BoxDecoration(border: Border.all()),
              ),
            ),
            ARibbonBadge(
              text: const Text('Hippies'),
              child: Container(
                height: 40,
                width: 100,
                decoration: BoxDecoration(border: Border.all()),
              ),
            ),
            ARibbonBadge(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              text: const Text('Hippies'),
              child: Container(
                height: 40,
                width: 100,
                decoration: BoxDecoration(border: Border.all()),
              ),
            ),
            // END
          ],
        ),
        PlayBox(
          title: 'title',
          codes: TextSpan(),
          desc: 'desc',
          children: [
            ABadge(
              child: Material(
                color: AntColors.cyan,
                child: Text('data'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
