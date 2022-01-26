import 'package:flutter/material.dart';
import 'package:gallery/codeviewer/code_segments.dart';
import 'package:gallery/widgets/code_wrapper.dart';
import 'package:goose_ui/goose_ui.dart';

class LoadingExample extends StatefulWidget {
  const LoadingExample({Key? key}) : super(key: key);

  @override
  State<LoadingExample> createState() => _LoadingExampleState();
}

class _LoadingExampleState extends State<LoadingExample> {
  // BEGIN loading#1
  bool _loading = true;
  // END
  @override
  Widget build(BuildContext context) {
    return GScaffold(
      content: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          CodeWrapper(
            title: 'default',
            children: [
              // BEGIN loading#2
              GLoading(
                child: const Placeholder(fallbackHeight: 100),
                loading: _loading,
              ),
              GRawButton(
                onPressed: () => setState(() => _loading = !_loading),
                child: const Text('change'),
              ),
              // END
            ],
            codeBlock: CodeSegments.loading(context),
          ),
        ],
      ),
    );
  }
}
