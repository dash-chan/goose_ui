import 'dart:ui';

import 'package:flutter/material.dart';

showGPopup({
  required BuildContext context,
  bool useRootNavigator = false,
  bool dismissble = true,
}) {
  final NavigatorState navigator =
      Navigator.of(context, rootNavigator: useRootNavigator);

  navigator.push(GPopupRoute(dismissable: dismissble));
}

class GPopupRoute extends PopupRoute {
  final bool dismissable;
  GPopupRoute({
    ImageFilter? filter,
    this.dismissable = true,
  }) : super(filter: filter);
  @override
  Color? get barrierColor => Colors.transparent;

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => 'TODO';

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return IgnorePointer(
      child: ConstrainedBox(
        constraints: BoxConstraints.tight(const Size(100, 100)),
        child: CustomSingleChildLayout(
          delegate: _PopLayout(),
          child: Container(
            height: 100,
            width: 100,
            color: Colors.red,
          ),
        ),
      ),
    );
  }

  @override
  Duration get transitionDuration => const Duration(milliseconds: 600);
}

class _PopLayout extends SingleChildLayoutDelegate {
  @override
  bool shouldRelayout(_PopLayout oldDelegate) {
    return false;
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return Offset.zero;
  }

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return BoxConstraints.loose(constraints.biggest);
  }
}
