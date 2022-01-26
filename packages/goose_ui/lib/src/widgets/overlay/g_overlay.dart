import 'package:flutter/material.dart';

class GOverlay {
  final BuildContext context;
  final Widget child;
  final bool linked;
  final LayerLink? link;
  final bool showWhenUnlinked;

  late OverlayEntry _entry;

  GOverlay({
    required this.context,
    required this.child,
    this.linked = false,
    this.link,
    this.showWhenUnlinked = true,
  }) {
    assert(() {
      if (!linked && link == null) return true;
      if (linked && link != null) return true;
      return false;
    }());
    Widget result = child;
    if (linked) {
      result = CompositedTransformFollower(
        link: link!,
        child: child,
        showWhenUnlinked: showWhenUnlinked,
      );
    }
    _entry = OverlayEntry(builder: (context) => result);
  }

  show() => Overlay.of(context)?.insert(_entry);

  hide() => _entry.remove();
}
