import 'package:flutter/material.dart';
import 'package:goose_ui/goose_ui.dart';

class ButtonExample extends StatefulWidget {
  const ButtonExample({Key? key}) : super(key: key);

  @override
  _ButtonExampleState createState() => _ButtonExampleState();
}

class _ButtonExampleState extends State<ButtonExample> {
  @override
  Widget build(BuildContext context) {
    return GScaffold(
      content: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('default button'),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              GRawButton(
                onPressed: () {},
                child: const Text('DEFAULT'),
              ),
            ],
          ),
          const Text('button with icon'),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              GRawButton(
                icon: const Icon(Icons.ac_unit),
                onPressed: () {},
                child: const Text('DEFAULT'),
              ),
            ],
          ),
          const Text('stadium shape button'),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              GRawButton(
                shape: const StadiumBorder(),
                onPressed: () {},
                child: const Text('DEFAULT'),
              ),
            ],
          ),
          const Text('button with color'),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              GRawButton(
                color: Colors.blueAccent,
                onPressed: () {},
                child: const Text('DEFAULT'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
