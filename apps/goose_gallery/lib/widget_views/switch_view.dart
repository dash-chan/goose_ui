import 'package:flutter/material.dart';
import 'package:goose_gallery/gen/code_segments.dart';
import 'package:goose_gallery/widgets/playbox.dart';
import 'package:goose_gallery/widgets/widget_view.dart';
import 'package:goose_ui/goose_ui.dart';

class SwitchView extends StatelessWidget {
  const SwitchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WidgetView(
      title: 'Switch 开关',
      desc: '',
      children: [
        PlayBox(
          title: '基本',
          codes: CodeSegments.switchBase(context),
          desc: '最简单的用法。',
          children: const [
            DefaultSwitch(),
          ],
        ),
        PlayBox.single(
          title: '不可用',
          codes: CodeSegments.switchDisabled(context),
          desc: 'Switch 失效状态。',
          // BEGIN switchDisabled
          child: const ASwitch(
            value: true,
            onChanged: null,
          ),
          // END
        ),
        PlayBox(
          title: '文字和图标',
          codes: CodeSegments.switchText(context),
          desc: '带有文字和图标。',
          children: [
            // BEGIN switchText
            ASwitch(
              value: true,
              checkedItem: const Text('开'),
              uncheckedItem: const Text('关'),
              onChanged: (_) {},
            ),
            ASwitch(
              value: true,
              checkedItem: const Text('1'),
              uncheckedItem: const Text('0'),
              onChanged: (_) {},
            ),
            // END
          ],
        ),
        PlayBox(
          title: '两种大小',
          codes: CodeSegments.switchSize(context),
          desc: 'size: ASize.small 表示小号开关',
          children: [
            // BEGIN switchSize
            ASwitch(
              value: true,
              size: ASize.medium,
              onChanged: (_) {},
            ),
            ASwitch(
              value: true,
              size: ASize.small,
              onChanged: (_) {},
            ),
            // END
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
  // BEGIN switchBase
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

  // END
}
