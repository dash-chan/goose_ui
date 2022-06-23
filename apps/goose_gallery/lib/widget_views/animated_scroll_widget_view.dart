import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:goose_gallery/widgets/playbox.dart';
import 'package:goose_gallery/widgets/widget_view.dart';
import 'package:goose_ui/goose_ui.dart';

class AnimatedScrollWidgetView extends StatelessWidget {
  const AnimatedScrollWidgetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WidgetView(
      title: ' title',
      desc: 'desc',
      children: [
        PlayBox(
          title: 'title',
          codes: TextSpan(),
          desc: 'desc',
          children: [
            _TestWidget(),
          ],
        ),
      ],
    );
  }
}

class _TestWidget extends StatefulWidget {
  const _TestWidget({Key? key}) : super(key: key);

  @override
  State<_TestWidget> createState() => __TestWidgetState();
}

class __TestWidgetState extends State<_TestWidget> {
  int _index = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedScrollNumber(count: _index),
        AButton(
          onPressed: () {
            setState(() {
              _index++;
            });
          },
          child: const Icon(Icons.add),
        ),
        AButton(
          onPressed: () {
            setState(() {
              _index--;
            });
          },
          child: const Icon(Icons.remove),
        ),
        AButton(
          onPressed: () {
            setState(() {
              _index = Random().nextInt(100);
            });
          },
          child: const Icon(Icons.gamepad_outlined),
        ),
      ],
    );
  }
}
