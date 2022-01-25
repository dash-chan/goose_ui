import 'package:flutter/material.dart';
import 'package:goose_ui/goose_ui.dart';

class CheckboxExample extends StatefulWidget {
  const CheckboxExample({Key? key}) : super(key: key);

  @override
  _CheckboxExampleState createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  @override
  Widget build(BuildContext context) {
    return GScaffold(
      content: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              GRawCheckbox(
                value: false,
                onChange: (_) {},
              ),
              GRawCheckbox(
                value: true,
                onChange: (_) {},
              ),
              const GRawCheckbox(
                value: null,
                tristate: true,
                onChange: null,
              ),
            ],
          ),
          GCheckboxGroup<String>(
            onChange: (_) {},
            builder: (context, item) => Text(item),
            items: const {
              '1': false,
              '2': true,
              '3': null,
            },
            tristate: true,
          ),
        ],
      ),
    );
  }
}
