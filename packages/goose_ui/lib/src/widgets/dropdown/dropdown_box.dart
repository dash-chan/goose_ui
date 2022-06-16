import 'package:flutter/material.dart';
import 'package:goose_ui/goose_ui.dart';
import 'package:goose_ui/src/widgets/dropdown/dropdown_painter.dart';

class DropdownBox extends StatelessWidget {
  const DropdownBox({
    super.key,
    required this.anchor,
    required this.showArrow,
    this.constraints,
    required this.child,
  });

  final ADropdownAnchor anchor;
  final bool showArrow;
  final BoxConstraints? constraints;
  final Widget child;

  EdgeInsets get _padding {
    if (!showArrow) return EdgeInsets.zero;
    switch (anchor) {
      case ADropdownAnchor.topLeft:
      case ADropdownAnchor.topCenter:
      case ADropdownAnchor.topRight:
        return const EdgeInsets.only(bottom: 12);
      case ADropdownAnchor.bottomLeft:
      case ADropdownAnchor.bottomCenter:
      case ADropdownAnchor.bottomRight:
        return const EdgeInsets.only(top: 12);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
          constraints ?? const BoxConstraints(maxWidth: 256, maxHeight: 256),
      child: Padding(
        padding: _padding,
        child: CustomPaint(
          painter: ADropdownPainter(
            anchor: anchor,
            showArrow: showArrow,
            shadowColor: Colors.black26,
            //TODO
            backgroundColor: Colors.white,
          ),
          child: child,
        ),
      ),
    );
  }
}
