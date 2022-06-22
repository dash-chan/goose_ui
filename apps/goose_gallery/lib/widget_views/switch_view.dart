import 'package:flutter/material.dart';
import 'package:goose_gallery/widgets/playbox.dart';
import 'package:goose_gallery/widgets/widget_view.dart';
import 'package:goose_ui/goose_ui.dart';

class SwitchView extends StatelessWidget {
  const SwitchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const WidgetView(
      title: 'Switch 开关',
      desc: '',
      children: [
        PlayBox(
          title: 'default',
          codes: TextSpan(),
          desc: 'desc',
          children: [
            DefaultSwitch(),
          ],
        ),
      ],
    );
  }
}

class DefaultSwitch extends StatefulWidget {
  const DefaultSwitch({Key? key}) : super(key: key);

  @override
  State<DefaultSwitch> createState() => _DefaultSwitchState();
}

class _DefaultSwitchState extends State<DefaultSwitch> {
  bool _state = false;
  @override
  Widget build(BuildContext context) {
    return ASwitch(
      value: _state,
      onChanged: (state) {
        setState(() {
          _state = state;
        });
      },
    );
  }
}
