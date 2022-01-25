import 'package:flutter/material.dart';
import 'package:gallery/codeviewer/code_segments.dart';
import 'package:goose_ui/goose_ui.dart';

class ScaffoldExample extends StatefulWidget {
  const ScaffoldExample({Key? key}) : super(key: key);

  @override
  _ScaffoldExampleState createState() => _ScaffoldExampleState();
}

class _ScaffoldExampleState extends State<ScaffoldExample> {
  Widget gen(Color color, String text) {
    return Container(
      color: color,
      child: Text(text),
      alignment: Alignment.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GScaffold(
      content: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // BEGIN scaffoldDemo#1
          SizedBox(
            height: 500,
            child: GScaffold(
              appBar: gen(Colors.blue[200]!, 'AppBar'),
              drawer: gen(Colors.green[100]!, 'Drawer'),
              content: gen(Colors.grey[200]!, 'Content'),
              systemBar: gen(Colors.amber[100]!, 'SystemBar'),
            ),
          ),
          // END
          Text.rich(CodeSegments.scaffoldDemo(context)),
        ],
      ),
    );
  }
}
