import 'package:flutter/material.dart';

class GRawCard extends StatelessWidget {
  final Widget? title;
  final EdgeInsets titlePadding;
  final Widget? top;
  final Widget child;
  final Widget? bottom;
  final ShapeBorder? shape;
  final BorderRadius? borderRadius;
  final double elevation;
  final Clip clip;
  final EdgeInsets margin;

  const GRawCard({
    Key? key,
    this.title,
    this.titlePadding = const EdgeInsets.all(16),
    this.top,
    required this.child,
    this.bottom,
    this.shape,
    this.borderRadius,
    this.elevation = 0.0,
    this.clip = Clip.hardEdge,
    this.margin = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _child = child;
    if (top != null || bottom != null || title != null) {
      _child = Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) Padding(padding: titlePadding, child: title!),
          if (title != null) const Divider(height: 1),
          if (top != null) top!,
          _child,
          if (bottom != null) bottom!,
        ],
      );
    }
    _child = Material(
      shape: shape,
      borderRadius: borderRadius,
      elevation: elevation,
      child: _child,
      clipBehavior: clip,
    );
    if (margin != EdgeInsets.zero) {
      _child = Padding(padding: margin, child: _child);
    }
    return _child;
  }
}
