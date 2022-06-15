import 'package:flutter/material.dart';
import 'package:goose_ui/goose_ui.dart';

class DropdownView extends StatelessWidget {
  const DropdownView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: ADropdown(
          child: Text('123'),
        ),
      ),
    );
  }
}
