import 'package:flutter/material.dart';
import 'package:goose_ui/src/extensions/list_extension.dart';

class AGridLayout extends StatelessWidget {
  const AGridLayout({
    super.key,
    required this.count,
    this.spacing = 0,
    this.crossAxisSpacing = 0,
    required this.children,
  });

  final List<Widget> children;
  final int count;
  final double spacing;
  final double crossAxisSpacing;

  int get line => (children.length / count).ceil();
  int get restBoxes => children.length % count;

  List<List<Widget>> get items {
    var result = <List<Widget>>[];
    for (var i = 0; i < line - 1; i++) {
      var childList = <Widget>[];
      for (var j = 0; j < count; j++) {
        childList.add(children[i * count + j]);
      }
      if (spacing != 0) {
        childList = childList.joined(SizedBox(width: spacing));
      }
      result.add(childList);
    }
    final childrenList =
        children.getRange((line - 1) * count, children.length).toList();
    result.add(childrenList);

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (var item in items) Row(children: item),
      ],
    );
  }
}
