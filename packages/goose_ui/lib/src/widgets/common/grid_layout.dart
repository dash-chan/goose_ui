import 'package:flutter/material.dart';
import 'package:goose_ui/src/extensions/list_extension.dart';

class AGridLayout extends StatelessWidget {
  const AGridLayout({
    super.key,
    required this.count,
    this.padding = EdgeInsets.zero,
    this.spacing = 0,
    this.crossAxisSpacing = 0,
    required this.children,
  });

  final List<Widget> children;
  final int count;
  final EdgeInsets padding;
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
    var childrenList =
        children.getRange((line - 1) * count, children.length).toList();
    if (spacing != 0) {
      childrenList = childrenList.joined(SizedBox(width: spacing));
    }
    result.add(childrenList);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    Widget result = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        for (var item in items) Row(children: item),
      ].joined(SizedBox(height: crossAxisSpacing)),
    );
    if (padding != EdgeInsets.zero) {
      result = Padding(padding: padding, child: result);
    }
    return result;
  }
}
