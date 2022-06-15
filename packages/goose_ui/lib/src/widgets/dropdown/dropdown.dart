import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';

class ADropdown extends StatefulWidget {
  const ADropdown({super.key, required this.child});

  final Widget child;

  @override
  State<ADropdown> createState() => _ADropdownState();
}

class _ADropdownState extends State<ADropdown> {
  @override
  Widget build(BuildContext context) {
    return PortalTarget(
      visible: false,
      // portalFollower: ,
      child: widget.child,
    );
  }
}
