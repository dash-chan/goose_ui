import 'package:flutter/material.dart';

import 'package:goose_ui/goose_ui.dart';

class PageWrapper extends StatelessWidget {
  final List<Widget> children;
  const PageWrapper({
    Key? key,
    required this.children,
  }) : super(key: key);
  int get _length {
    var _l = children.length;
    var base = _l ~/ 2;
    if (_l.isEven) {
      return base;
    } else {
      return base + 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GScaffold(
      content: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          int leftIndex = index * 2;
          int rightIndex = leftIndex + 1;
          Widget left = Expanded(child: children[leftIndex]);
          Widget right = const Spacer();
          if (rightIndex < children.length) {
            right = Expanded(child: children[rightIndex]);
          }
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              left,
              const SizedBox(width: 8),
              right,
            ],
          );
        },
        itemCount: _length,
      ),
    );
  }
}
