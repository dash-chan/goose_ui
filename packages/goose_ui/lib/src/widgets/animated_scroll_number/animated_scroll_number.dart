import 'dart:math';

import 'package:flutter/widgets.dart';

const _numbers = <int>[0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

class AnimatedScrollNumber extends StatefulWidget {
  const AnimatedScrollNumber({Key? key, required this.count}) : super(key: key);

  final int count;

  @override
  State<AnimatedScrollNumber> createState() => _AnimatedScrollNumberState();
}

class _AnimatedScrollNumberState extends State<AnimatedScrollNumber> {
  int get _length => widget.count.toString().length;

  List<Key> get _tagKeys =>
      List.generate(_length, (index) => ValueKey(index)).reversed.toList();
  List<int> get _digits =>
      List.generate(_length, (index) => index).reversed.toList();
  late final _children = <Widget>[];

  updateChildren() {
    _children.clear();
    for (var i = 0; i < _length; i++) {
      _children.add(_InnerScrollView(
        key: _tagKeys[i],
        digit: _digits[i],
        count: widget.count,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOutCubic,
      ));
    }
  }

  @override
  void initState() {
    super.initState();
    updateChildren();
  }

  @override
  void didUpdateWidget(AnimatedScrollNumber oldWidget) {
    updateChildren();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: _children);
  }
}

class _InnerScrollView extends StatefulWidget {
  const _InnerScrollView({
    super.key,
    required this.digit,
    required this.count,
    required this.duration,
    required this.curve,
  });

  final int digit;
  final int count;
  final Duration duration;
  final Curve curve;

  @override
  State<_InnerScrollView> createState() => __InnerScrollViewState();
}

class __InnerScrollViewState extends State<_InnerScrollView> {
  late FixedExtentScrollController _controller;

  int get _current {
    return widget.count ~/ pow(10, widget.digit);
  }

  @override
  void initState() {
    super.initState();
    _controller = FixedExtentScrollController(initialItem: _current);
  }

  @override
  void didUpdateWidget(_InnerScrollView oldWidget) {
    if (oldWidget.count != widget.count) {
      _controller.animateToItem(
        _current,
        duration: widget.duration,
        curve: widget.curve,
      );
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 16,
      width: 12,
      child: ListWheelScrollView.useDelegate(
        controller: _controller,
        itemExtent: 16,
        physics: const NeverScrollableScrollPhysics(),
        onSelectedItemChanged: (_) {},
        childDelegate: ListWheelChildLoopingListDelegate(
          children: _numbers.map((e) => Text('$e')).toList(),
        ),
      ),
    );
  }
}

          // children: List.generate(10, (index) => Text('$index')),

