import 'package:flutter/material.dart';
import 'package:goose_ui/goose_ui.dart';

class SwitchExample extends StatefulWidget {
  const SwitchExample({Key? key}) : super(key: key);

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  @override
  Widget build(BuildContext context) {
    return GScaffold(
      content: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          GSwitch(value: false, onChanged: (_) {}),
          GSwitch(value: true, onChanged: (_) {}),
        ],
      ),
    );
  }
}
