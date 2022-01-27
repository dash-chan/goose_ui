import 'package:flutter/material.dart';
import 'package:gallery/widgets/page_wrapper.dart';
import 'package:goose_ui/goose_ui.dart';

class SelectExample extends StatefulWidget {
  const SelectExample({Key? key}) : super(key: key);

  @override
  State<SelectExample> createState() => _SelectExampleState();
}

class _SelectExampleState extends State<SelectExample> {
  final _selectItems = List.generate(20, (index) => 'item$index');
  String? _selected;
  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      children: [
        Center(
          child: GSelectButton<String>(
            value: _selected,
            items: _selectItems,
            onChanged: (value) {
              _selected = value;
              setState(() {});
            },
          ),
        ),
        Center(
          child: GSelectButton<String>(
            value: _selected,
            items: _selectItems,
            onChanged: (value) {
              _selected = value;
              setState(() {});
            },
          ),
        ),
        // a box for test
        const SizedBox(height: 2000),
      ],
    );
  }
}
