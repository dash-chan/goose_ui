import 'package:flutter/material.dart';

class GRawRadio<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;
  final Widget? child;
  const GRawRadio({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _child = Radio<T>(
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
    );
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
