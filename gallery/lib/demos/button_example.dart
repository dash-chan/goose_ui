import 'package:flutter/material.dart';
import 'package:gallery/codeviewer/code_segments.dart';
import 'package:gallery/widgets/code_wrapper.dart';
import 'package:gallery/widgets/page_wrapper.dart';
import 'package:goose_ui/goose_ui.dart';

class ButtonExample extends StatefulWidget {
  const ButtonExample({Key? key}) : super(key: key);

  @override
  _ButtonExampleState createState() => _ButtonExampleState();
}

class _ButtonExampleState extends State<ButtonExample> {
  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      children: [
        CodeWrapper(
          title: 'Default',
          // BEGIN gButton1
          child: GRawButton(
            onPressed: () {},
            child: const Text('BUTTON'),
          ),
          // END
          codeBlock: CodeSegments.gButton1(context),
        ),
        CodeWrapper(
          title: 'stadium shape button',
          // BEGIN gButton2
          child: GRawButton(
            icon: const Icon(Icons.ac_unit),
            onPressed: () {},
            shape: const StadiumBorder(),
            color: Colors.blue[200],
            child: const Text('BUTTON'),
          ),
          // END
          codeBlock: CodeSegments.gButton2(context),
        ),
        CodeWrapper(
          title: 'button with icon',
          // BEGIN gButton3
          child: GRawButton(
            icon: const Icon(Icons.ac_unit),
            onPressed: () {},
            child: const Text('BUTTON'),
          ),
          // END
          codeBlock: CodeSegments.gButton3(context),
        ),
        CodeWrapper(
          title: ' button with color',
          // BEGIN gButton4
          child: GRawButton(
            icon: const Icon(Icons.ac_unit),
            onPressed: () {},
            color: Colors.blue[200],
            child: const Text('BUTTON'),
          ),
          // END
          codeBlock: CodeSegments.gButton4(context),
        ),
        CodeWrapper(
          title: ' button icon position',
          children: [
            // BEGIN gButton5
            GRawButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {},
              child: const Text('BUTTON'),
              iconPosition: IconPosition.left,
            ),
            GRawButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: () {},
              child: const Text('BUTTON'),
              iconPosition: IconPosition.right,
            ),
            GRawButton(
              icon: const Icon(Icons.arrow_upward),
              onPressed: () {},
              child: const Text('BUTTON'),
              iconPosition: IconPosition.top,
            ),
            GRawButton(
              icon: const Icon(Icons.arrow_downward),
              onPressed: () {},
              child: const Text('BUTTON'),
              iconPosition: IconPosition.bottom,
            ),
            // END
          ],
          codeBlock: CodeSegments.gButton5(context),
        ),
      ],
    );
  }
}
