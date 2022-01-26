import 'package:flutter/material.dart';
import 'package:gallery/widgets/page_wrapper.dart';
import 'package:goose_ui/goose_ui.dart';

class OverlayExample extends StatefulWidget {
  const OverlayExample({Key? key}) : super(key: key);

  @override
  State<OverlayExample> createState() => _OverlayExampleState();
}

class _OverlayExampleState extends State<OverlayExample> {
  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      children: [
        GRawButton(
          onPressed: () {
            showGPopup(context: context);
          },
          child: const Text('test'),
        ),
        const SizedBox(),
      ],
    );
  }
}
