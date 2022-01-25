import 'package:flutter/material.dart';

class GSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final Widget? child;
  const GSwitch(
      {Key? key, required this.value, required this.onChanged, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _child = Switch(value: value, onChanged: onChanged);
    if (child != null) {
      _child = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _child,
          const SizedBox(width: 4),
          child!,
        ],
      );
    }
    return _child;
  }
}
