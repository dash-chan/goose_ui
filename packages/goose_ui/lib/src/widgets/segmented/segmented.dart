import 'package:flutter/material.dart';

import 'package:goose_ui/goose_ui.dart';

export 'segmented_theme.dart';

class ASegmented<T> extends StatefulWidget {
  const ASegmented({
    super.key,
    this.filled = false,
    this.thumbColor,
    this.trackColor,
    this.curve = Curves.easeInOutCubic,
    this.padding = const EdgeInsets.all(2),
    this.childPadding = const EdgeInsets.symmetric(horizontal: 11),
    this.size,
    this.groupValue,
    required this.onChanged,
    required this.children,
  });

  final bool filled;
  final Color? thumbColor;
  final Color? trackColor;
  final Curve curve;
  final EdgeInsets padding;
  final EdgeInsets childPadding;
  //TODO set size
  final ASize? size;

  final T? groupValue;
  final ValueChanged<T?> onChanged;
  final Map<T, Widget> children;

  @override
  State<ASegmented> createState() => _ASegmentedState<T>();
}

class _ASegmentedState<T> extends State<ASegmented<T>> {
  late Map<T, GlobalKey> _keys;
  final _widths = <double>[];
  Color get _thumbColor {
    return widget.thumbColor ?? AntColors.neutral.shade100;
  }

  Color get _trackColor {
    return widget.trackColor ?? Colors.black.withOpacity(0.06);
  }

  List<Widget> get _wrapChildren {
    final children = <Widget>[];
    for (var child in widget.children.entries) {
      children.add(ASegmentedItem(
        key: _keys[child.key],
        onPressed: () {
          widget.onChanged(child.key);
        },
        child: child.value,
      ));
    }

    return children;
  }

  bool get _hasThumb => _selectedWidth != 0;

  void initKeys() {
    _keys = widget.children.map(
      (key, value) => MapEntry(key, GlobalKey(debugLabel: key.toString())),
    );
  }

  void initWidths() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (mounted) {
        _widths.clear();
        for (var entry in _keys.entries) {
          _widths.add(entry.value.currentContext?.size?.width ?? 0);
        }
      }
    });
  }

  int? get _selectedIndex {
    if (widget.groupValue == null) return null;
    final index = _keys.keys.toList().indexOf(widget.groupValue as T);
    if (index == -1) return null;
    return index;
  }

  double get _selectedWidth {
    if (_selectedIndex == null) return 0;
    return _widths[_selectedIndex!];
  }

  double get _offsetWidth {
    if (_selectedIndex == null) return 0;
    if (_selectedIndex == 0) return 0;
    if (_widths.length == 1) return 0;
    return _widths.take(_selectedIndex!).reduce((a, b) => a + b);
  }

  @override
  void initState() {
    super.initState();
    initKeys();
    initWidths();
  }

  @override
  void didUpdateWidget(ASegmented<T> oldWidget) {
    initKeys();
    initWidths();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    Widget result = Row(
      mainAxisSize: MainAxisSize.min,
      children: _wrapChildren,
    );

    result = Stack(
      children: [
        if (_hasThumb)
          AnimatedPositioned(
            left: _offsetWidth,
            top: 0,
            bottom: 0,
            width: _selectedWidth,
            //TODO duration from theme
            duration: const Duration(milliseconds: 300),
            curve: widget.curve,
            child: Material(
              color: _thumbColor,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        result,
      ],
    );

    result = Padding(padding: widget.padding, child: result);

    result = Material(
      color: _trackColor,
      borderRadius: BorderRadius.circular(2),
      child: result,
    );

    return _ASegmentedInherited(
      data: _SegmentData(
        filled: widget.filled,
        childPadding: widget.childPadding,
      ),
      child: result,
    );
  }
}

class _SegmentData {
  _SegmentData({required this.filled, required this.childPadding});

  final bool filled;
  final EdgeInsets childPadding;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is _SegmentData &&
        other.filled == filled &&
        other.childPadding == childPadding;
  }

  @override
  int get hashCode => filled.hashCode ^ childPadding.hashCode;
}

class _ASegmentedInherited extends InheritedWidget {
  const _ASegmentedInherited({
    Key? key,
    required Widget child,
    required this.data,
  }) : super(key: key, child: child);

  final _SegmentData data;

  static _SegmentData of(BuildContext context) {
    final inherited =
        context.dependOnInheritedWidgetOfExactType<_ASegmentedInherited>();
    assert(inherited != null, 'must place a ASegmented in the widget tree');
    return inherited!.data;
  }

  @override
  bool updateShouldNotify(_ASegmentedInherited oldWidget) =>
      oldWidget.data != data;
}

class ASegmentedItem<T> extends StatefulWidget {
  const ASegmentedItem({Key? key, required this.child, required this.onPressed})
      : super(key: key);

  final Widget child;
  final VoidCallback onPressed;

  @override
  State<ASegmentedItem<T>> createState() => _ASegmentedItemState<T>();
}

class _ASegmentedItemState<T> extends State<ASegmentedItem<T>> {
  @override
  Widget build(BuildContext context) {
    bool filled = _ASegmentedInherited.of(context).filled;
    EdgeInsets childPadding = _ASegmentedInherited.of(context).childPadding;
    Widget result = widget.child;

    result = GestureDetector(onTap: widget.onPressed, child: result);

    if (childPadding != EdgeInsets.zero) {
      result = Padding(padding: childPadding, child: result);
    }

    if (filled) {
      result = Expanded(child: result);
    }

    return result;
  }
}
