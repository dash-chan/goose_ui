import 'package:flutter/material.dart';

class GRawCheckbox extends StatelessWidget {
  final bool? value;
  final ValueChanged<bool?>? onChange;
  final bool tristate;
  final Widget? child;
  const GRawCheckbox(
      {Key? key,
      required this.value,
      required this.onChange,
      this.tristate = false,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _child = Checkbox(
      value: value,
      onChanged: onChange,
      tristate: tristate,
    );
    if (child != null) {
      _child = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _child,
          const SizedBox(width: 8),
          child!,
        ],
      );
    }
    return _child;
  }
}
