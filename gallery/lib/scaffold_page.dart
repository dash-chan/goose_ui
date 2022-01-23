import 'package:flutter/material.dart';
import 'package:goose_ui/goose_ui.dart';

class ScaffoldExmaplePage extends StatefulWidget {
  const ScaffoldExmaplePage({Key? key}) : super(key: key);

  @override
  _ScaffoldExmaplePageState createState() => _ScaffoldExmaplePageState();
}

class _ScaffoldExmaplePageState extends State<ScaffoldExmaplePage> {
  GDrawerState state = GDrawerState.open;
  @override
  Widget build(BuildContext context) {
    return GScaffold(
      drawerState: state,
      drawer: Container(color: Colors.red),
      appBar: Container(color: Colors.green),
      systemBar: Container(color: Colors.blue),
      content: Center(
        child: TextButton(
          onPressed: () {
            int index = GDrawerState.values.indexOf(state);
            int nextIndex = (index + 1) % 3;
            state = GDrawerState.values[nextIndex];
            setState(() {});
          },
          child: const Text('switch'),
        ),
      ),
    );
  }
}
