import 'package:flutter/material.dart';
import 'package:gallery/codeviewer/code_segments.dart';
import 'package:gallery/widgets/code_wrapper.dart';
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
          CodeWrapper(
            title: 'default',
            // BEGIN gCheckbox
            child: Wrap(
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
            // END
            codeBlock: CodeSegments.gCheckbox(context),
          ),
          CodeWrapper(
            title: 'group',
            // BEGIN gCheckbox2

            //will print group map
            child: GCheckboxGroup<String>(
              onChange: (map) {
                // ignore: avoid_print
                print(map);
              },
              builder: (context, item) => Text(item),
              items: const {
                '1': false,
                '2': true,
                '3': null,
              },
              tristate: true,
            ),
            // END
            codeBlock: CodeSegments.gCheckbox2(context),
          ),
        ],
      ),
    );
  }
}
