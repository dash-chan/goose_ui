import 'package:flutter/material.dart';
import 'package:goose_ui/src/widgets/badge/ribbon_widget.dart';

enum RibbonPlacement {
  start,
  end,
}

class ARibbonBadge extends StatelessWidget {
  const ARibbonBadge({
    super.key,
    required this.child,
    this.placement = RibbonPlacement.end,
  });

  final Widget child;
  final RibbonPlacement placement;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned(
          top: 0,
          right: 0,
          child: RibbonWidget(
            color: Colors.green,
            darkColor: Colors.green[700]!,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text('test'),
            ),
          ),
        ),
      ],
    );
  }
}
