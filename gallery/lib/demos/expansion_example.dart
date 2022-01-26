import 'package:flutter/material.dart';
import 'package:gallery/codeviewer/code_segments.dart';
import 'package:gallery/widgets/code_wrapper.dart';
import 'package:gallery/widgets/page_wrapper.dart';
import 'package:goose_ui/goose_ui.dart';

class ExpansionExample extends StatefulWidget {
  const ExpansionExample({Key? key}) : super(key: key);

  @override
  State<ExpansionExample> createState() => _ExpansionExampleState();
}

class _ExpansionExampleState extends State<ExpansionExample> {
  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      children: [
        CodeWrapper(
          title: 'default',
          // BEGIN expansion
          child: GExpansion(
            child: Container(height: 100, color: Colors.lightBlue),
            tile: const ListTile(title: Text('Title')),
          ),
          // END
          codeBlock: CodeSegments.expansion(context),
        ),
      ],
    );
  }
}
