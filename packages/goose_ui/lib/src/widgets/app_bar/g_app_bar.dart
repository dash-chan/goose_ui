import 'package:flutter/material.dart';

class GAppBar extends StatefulWidget {
  final Color? color;
  final Widget? leadingAction;
  final EdgeInsets leadingActionPadding;
  final Widget? leading;
  final EdgeInsets leadingPadding;
  final Widget? title;
  final EdgeInsets titlePadding;
  final List<Widget>? actions;
  final EdgeInsets actionsPadding;
  final double elevation;
  const GAppBar({
    Key? key,
    this.color,
    this.leadingAction,
    this.leadingActionPadding = const EdgeInsets.symmetric(horizontal: 8),
    this.leading,
    this.leadingPadding = const EdgeInsets.symmetric(horizontal: 8),
    this.title,
    this.titlePadding = const EdgeInsets.symmetric(horizontal: 8),
    this.actions,
    this.actionsPadding = const EdgeInsets.symmetric(horizontal: 8),
    this.elevation = 0.0,
  }) : super(key: key);

  @override
  _GAppBarState createState() => _GAppBarState();
}

class _GAppBarState extends State<GAppBar> {
  @override
  Widget build(BuildContext context) {
    List<Widget> _children = [];
    if (widget.leadingAction != null) {
      _children.add(Padding(
        padding: widget.leadingActionPadding,
        child: widget.leadingAction,
      ));
    }
    if (widget.leading != null) {
      _children.add(Padding(
        padding: widget.leadingPadding,
        child: widget.leading,
      ));
    }
    if (widget.title != null) {
      _children.add(Expanded(
        child: Padding(
          padding: widget.titlePadding,
          child: widget.title,
        ),
      ));
    } else {
      _children.add(const Spacer());
    }
    if (widget.actions != null) {
      late Widget actionsWidget;
      if (widget.actions!.length == 1) {
        actionsWidget = widget.actions!.first;
      } else {
        actionsWidget = Row(
          mainAxisSize: MainAxisSize.min,
          children: widget.actions!,
        );
      }
      _children.add(Padding(
        padding: widget.actionsPadding,
        child: actionsWidget,
      ));
    }
    return Material(
      color: widget.color,
      elevation: widget.elevation,
      child: Row(
        children: _children,
      ),
    );
  }
}
