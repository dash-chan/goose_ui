import 'package:flutter/material.dart';
import 'package:gallery/codeviewer/code_segments.dart';
import 'package:gallery/widgets/code_wrapper.dart';
import 'package:gallery/widgets/page_wrapper.dart';
import 'package:goose_ui/goose_ui.dart';

class RadioExample extends StatefulWidget {
  const RadioExample({Key? key}) : super(key: key);

  @override
  State<RadioExample> createState() => _RadioExampleState();
}

class _RadioExampleState extends State<RadioExample> {
  // BEGIN radioGroup#1
  int? _groupState;
  // END
  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      children: [
        CodeWrapper(
          title: 'Default',
          // BEGIN radioGroup#2
          child: GRadioGroup<int>(
            value: _groupState,
            items: List.generate(12, (index) => index),
            builder: (index) => Text('item$index'),
            onChanged: (value) {
              setState(() => _groupState = value);
            },
          ),
          // END
          codeBlock: CodeSegments.radioGroup(context),
        )
      ],
    );
  }
}
