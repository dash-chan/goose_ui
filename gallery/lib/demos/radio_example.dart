import 'package:flutter/material.dart';
import 'package:gallery/codeviewer/code_segments.dart';
import 'package:gallery/widgets/code_wrapper.dart';
import 'package:gallery/widgets/page_wrapper.dart';
import 'package:goose_ui/goose_ui.dart';

class RadioExample extends StatelessWidget {
  const RadioExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      children: [
        CodeWrapper(
          title: 'Default',
          // BEGIN radioGroup
          child: GRadioGroup<bool>(
            value: false,
            items: const [true, false],
            onChanged: (value) {
              // ignore: avoid_print
              print(value);
            },
          ),
          // END
          codeBlock: CodeSegments.radioGroup(context),
        )
      ],
    );
  }
}
