import 'package:flutter/material.dart';

export 'ribbon_badge.dart';

class ABadge extends StatefulWidget {
  const ABadge({super.key, this.child});

  final Widget? child;

  @override
  State<ABadge> createState() => _ABadgeState();
}

class _ABadgeState extends State<ABadge> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
