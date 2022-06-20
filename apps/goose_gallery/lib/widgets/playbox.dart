import 'package:flutter/material.dart';

class PlayBox extends StatelessWidget {
  const PlayBox({
    Key? key,
    required this.title,
    required this.codes,
    required this.desc,
    required this.children,
  }) : super(key: key);

  PlayBox.single({
    Key? key,
    required this.title,
    required this.codes,
    required this.desc,
    required Widget child,
  })  : children = [child],
        super(key: key);

  final String title;
  final String desc;
  final List<Widget> children;
  final TextSpan codes;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              children: children,
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(desc),
          ),
          CodeDisplayer(span: codes),
        ],
      ),
    );
  }
}

class CodeDisplayer extends StatefulWidget {
  const CodeDisplayer({Key? key, required this.span}) : super(key: key);
  final TextSpan span;

  @override
  State<CodeDisplayer> createState() => _CodeDisplayerState();
}

class _CodeDisplayerState extends State<CodeDisplayer> {
  bool _showCode = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      alignment: Alignment.topCenter,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOutCubic,
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _showCode = !_showCode;
                  });
                },
                icon: _showCode
                    ? const Icon(Icons.code_off)
                    : const Icon(Icons.code),
              ),
            ],
          ),
          if (_showCode) SelectableText.rich(widget.span),
        ],
      ),
    );
  }
}
