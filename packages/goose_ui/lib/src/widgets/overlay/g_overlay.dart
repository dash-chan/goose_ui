import 'package:flutter/material.dart';

class GOverlay {
  OverlayEntry? _entry;
  GOverlay();

  void Function() show({
    required BuildContext context,
    required Widget child,
    required RelativeRect rect,
    bool linked = false,
    LayerLink? link,
    bool showWhenUnlinked = true,
    double maxHeight = 600,
  }) {
    assert(() {
      if (!linked && link == null) return true;
      if (linked && link != null) return true;
      return false;
    }());
    if (_entry != null) return hide;
    Widget result = child;
    if (linked) {
      result = CompositedTransformFollower(
        link: link!,
        child: child,
        targetAnchor: Alignment.bottomLeft,
        followerAnchor: Alignment.topLeft,
        showWhenUnlinked: showWhenUnlinked,
      );
    }

    result = CustomSingleChildLayout(
      delegate: _OverlayLayout(rect: rect),
      child: result,
    );

    _entry = OverlayEntry(builder: (context) => result);
    Overlay.of(context)?.insert(_entry!);
    return hide;
  }

  hide() {
    _entry?.remove();
    _entry = null;
  }
}

class _OverlayLayout extends SingleChildLayoutDelegate {
  final RelativeRect rect;
  _OverlayLayout({required this.rect});
  @override
  bool shouldRelayout(covariant SingleChildLayoutDelegate oldDelegate) {
    return true;
  }

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return BoxConstraints.loose(constraints.biggest);
  }
}
