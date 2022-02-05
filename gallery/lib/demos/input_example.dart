import 'package:flutter/material.dart';
import 'package:gallery/widgets/code_wrapper.dart';
import 'package:gallery/widgets/page_wrapper.dart';
import 'package:goose_ui/goose_ui.dart';

class InputExample extends StatefulWidget {
  const InputExample({Key? key}) : super(key: key);

  @override
  State<InputExample> createState() => _InputExampleState();
}

class _InputExampleState extends State<InputExample> {
  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      children: [
        CodeWrapper(
          title: 'default',
          children: [
            GRawInput(),
          ],
          codeBlock: TextSpan(),
        ),
        CodeWrapper(
          title: 'rounded',
          children: [
            GRawInput(rounded: true),
          ],
          codeBlock: TextSpan(),
        ),
      ],
    );
  }
}
