import 'package:flutter/material.dart';
import 'package:gallery/codeviewer/code_segments.dart';
import 'package:gallery/widgets/code_wrapper.dart';
import 'package:gallery/widgets/page_wrapper.dart';
import 'package:goose_ui/goose_ui.dart';

class SwitchExample extends StatefulWidget {
  const SwitchExample({Key? key}) : super(key: key);

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      children: [
        CodeWrapper(
          title: 'default',
          children: [
            // BEGIN switch1
            GSwitch(value: false, onChanged: (_) {}),
            GSwitch(value: true, onChanged: (_) {}),
            // END
          ],
          codeBlock: CodeSegments.switch1(context),
        ),
      ],
    );
  }
}
