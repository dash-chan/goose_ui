import 'package:flutter/material.dart';
import 'package:goose_ui/goose_ui.dart';

class DropdownPage extends StatelessWidget {
  const DropdownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dropdown Demo'),
      ),
      body: const Center(
        child: ADropdown(
          child: Text('123'),
        ),
      ),
    );
  }
}
