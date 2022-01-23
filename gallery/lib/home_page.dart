import 'package:flutter/material.dart';
import 'package:goose_ui/goose_ui.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GCheckboxController<String> _checkboxController = GCheckboxController({
    '1': false,
    '2': null,
    '3': true,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            GRawButton(
              onPressed: () {},
              child: const Text('default'),
              icon: const Icon(Icons.ac_unit),
            ),
            const GRawButton(
              color: Colors.blue,
              onPressed: null,
              child: Text('null onPressed'),
              icon: Icon(Icons.ac_unit),
            ),
            GRawButton(
              color: Colors.blue,
              onPressed: () {},
              child: const Text('null onPressed'),
              icon: const Icon(Icons.ac_unit),
              shape: const RoundedRectangleBorder(),
            ),
            GRawButton(
              color: Colors.blue,
              onPressed: () {},
              child: const Text('null onPressed'),
              icon: const Icon(Icons.ac_unit),
              elevation: 4,
            ),
            GRawButton(
              onPressed: () {},
              child: const Text('null onPressed'),
              icon: const Icon(Icons.ac_unit),
              shape: const StadiumBorder(
                side: BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
            GRawCheckbox(
              value: null,
              onChange: (_) {},
              tristate: true,
            ),
            GRawCheckbox(
              value: null,
              onChange: (_) {},
              tristate: true,
              child: const Text('test checkbox'),
            ),
            GCheckboxGroup(
              controller: _checkboxController,
              onChange: (item) {
                print(item);
              },
              tristate: true,
              builder: (BuildContext context, String value) {
                return Text('checkbox:' + value);
              },
            ),
            GRawButton(
              onPressed: () {
                _checkboxController.clear();
              },
              child: const Text('clear'),
            ),
            GRawButton(
              onPressed: () {
                _checkboxController.selectAll();
              },
              child: const Text('select All'),
            ),
          ],
        ),
      ),
    );
  }
}
