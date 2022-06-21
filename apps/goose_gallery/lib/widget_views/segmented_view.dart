import 'package:flutter/material.dart';
import 'package:goose_gallery/widgets/playbox.dart';
import 'package:goose_gallery/widgets/widget_view.dart';
import 'package:goose_ui/goose_ui.dart';

class SegmentedView extends StatelessWidget {
  const SegmentedView({super.key});

  @override
  Widget build(BuildContext context) {
    return const WidgetView(
      title: 'Segmented分段控制器',
      desc: 'desc',
      children: [
        PlayBox(
          title: 'default',
          codes: TextSpan(),
          desc: 'desc',
          children: [
            DefaultASegmentedWidget(),
          ],
        ),
      ],
    );
  }
}

class DefaultASegmentedWidget extends StatefulWidget {
  const DefaultASegmentedWidget({Key? key}) : super(key: key);

  @override
  State<DefaultASegmentedWidget> createState() =>
      _DefaultASegmentedWidgetState();
}

class _DefaultASegmentedWidgetState extends State<DefaultASegmentedWidget> {
  int? _value;
  @override
  Widget build(BuildContext context) {
    return ASegmented<int>(
      groupValue: _value,
      onChanged: (state) {
        setState(() {
          _value = state;
        });
      },
      children: const {
        1: Text('First'),
        2: Text('Second'),
        3: Text('Third'),
      },
    );
  }
}
