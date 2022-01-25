import 'package:flutter/material.dart';

class GRawCard extends StatelessWidget {
  final Widget? title;
  final Widget? top;
  final Widget child;
  final Widget? bottom;
  final ShapeBorder? shape;
  final BorderRadius? borderRadius;
  final double elevation;

  const GRawCard({
    Key? key,
    this.title,
    this.top,
    required this.child,
    this.bottom,
    this.shape,
    this.borderRadius,
    this.elevation = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _child = child;
    if (top != null || bottom != null || title != null) {
      _child = Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null) title!,
          if (top != null) top!,
          _child,
          if (bottom != null) bottom!,
        ],
      );
    }
    return Material(
      shape: shape,
      borderRadius: borderRadius,
      elevation: elevation,
      child: _child,
    );
  }
}
