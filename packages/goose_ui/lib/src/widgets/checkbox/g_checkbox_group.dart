import 'package:flutter/material.dart';

import 'package:goose_ui/goose_ui.dart';

class GCheckboxGroup<T> extends StatefulWidget {
  final Map<T, bool?>? items;
  final ValueChanged<Map<T, bool?>>? onChange;
  final bool tristate;
  final GCheckboxController<T>? controller;
  final Widget Function(BuildContext context, T value) builder;
  final double spacing;
  final double runSpacing;
  const GCheckboxGroup({
    Key? key,
    this.items,
    required this.onChange,
    this.tristate = false,
    this.controller,
    required this.builder,
    this.spacing = 8,
    this.runSpacing = 4,
  })  : assert(controller != null || items != null),
        super(key: key);

  @override
  _GCheckboxGroupState<T> createState() => _GCheckboxGroupState<T>();
}

class _GCheckboxGroupState<T> extends State<GCheckboxGroup<T>> {
  late GCheckboxController<T> _controller;
  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? GCheckboxController(widget.items!);
    _controller._selectAll = selectAll;
    _controller._clear = clear;
  }

  selectAll() {
    _controller._map.updateAll((key, value) => true);
    setState(() {});
  }

  clear() {
    _controller._map.updateAll((key, value) => false);
    setState(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: widget.spacing,
      runSpacing: widget.runSpacing,
      children: _controller._map.entries.map((e) {
        return GRawCheckbox(
          value: e.value,
          child: widget.builder(context, e.key),
          onChange: (state) {
            _controller._map.update(e.key, (value) => state);
            if (widget.onChange != null) widget.onChange!(_controller._map);
            setState(() {});
          },
          tristate: widget.tristate,
        );
      }).toList(),
    );
  }
}

class GCheckboxController<T> {
  Map<T, bool?> _map = {};
  VoidCallback? _selectAll;
  VoidCallback? _clear;
  VoidCallback get selectAll => _selectAll!;
  VoidCallback get clear => _clear!;

  GCheckboxController(Map<T, bool?> initial) {
    _map = Map.from(initial);
  }
  dispose() {
    _selectAll = null;
    _clear = null;
  }
}
