import 'package:flutter/material.dart';
import 'package:goose_ui/src/widgets/radio/g_raw_radio.dart';

class GRadioGroup<T> extends StatefulWidget {
  final double spacing;
  final double runSpacing;
  final T? value;
  final List<T> items;
  final ValueChanged<T?>? onChanged;

  final Widget Function(T item)? builder;

  const GRadioGroup({
    Key? key,
    this.spacing = 0.0,
    this.runSpacing = 0.0,
    required this.value,
    required this.items,
    required this.onChanged,
    this.builder,
  }) : super(key: key);

  @override
  State<GRadioGroup> createState() => _GRadioGroupState();
}

class _GRadioGroupState extends State<GRadioGroup> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: widget.spacing,
      runSpacing: widget.runSpacing,
      children: widget.items.map((e) {
        return GRawRadio(
          value: e,
          groupValue: widget.value,
          onChanged: widget.onChanged,
          child: widget.builder == null ? null : widget.builder!(e),
        );
      }).toList(),
    );
  }
}
