import 'package:flutter/material.dart';
import 'package:goose_ui/src/widgets/app_bar/g_app_bar.dart';
import 'package:goose_ui/src/widgets/common/animated_sizedbox.dart';
import 'package:goose_ui/src/widgets/drawer/g_drawer.dart';
import 'package:goose_ui/src/widgets/system_bar/g_system_bar.dart';

class GScaffold extends StatefulWidget {
  /// normally use [GAppBar]
  final Widget? appBar;

  /// normally use [GSystemBar]
  final Widget? systemBar;

  /// content [Widget]
  final Widget content;

  /// normally use [GDrawer]
  final Widget? drawer;

  /// background color of scaffold
  final Color? backgroundColor;

  /// background [Widget] of scaffold
  final Widget? background;

  final GDrawerState drawerState;
  const GScaffold({
    Key? key,
    this.appBar,
    this.systemBar,
    required this.content,
    this.drawer,
    this.backgroundColor,
    this.background,
    this.drawerState = GDrawerState.open,
  }) : super(key: key);

  @override
  _GScaffoldState createState() => _GScaffoldState();
}

class _GScaffoldState extends State<GScaffold> {
  // Widget _genDrawer() {}

  @override
  Widget build(BuildContext context) {
    Widget _child = widget.content;
    if (widget.drawer != null) {
      _child = Row(
        children: [
          if (widget.drawerState != GDrawerState.close)
            AnimatedSizedBox(
              child: widget.drawer!,
              size: widget.drawerState == GDrawerState.open
                  ? const Size.fromWidth(256)
                  : const Size.fromWidth(64),
            ),
          Expanded(child: _child),
        ],
      );
    }
    if (widget.appBar != null || widget.systemBar != null) {
      List<Widget> _columnChildren = [];
      if (widget.appBar != null) {
        _columnChildren.add(SizedBox(height: 64, child: widget.appBar!));
      }
      _columnChildren.add(Expanded(child: _child));
      if (widget.systemBar != null) {
        _columnChildren.add(SizedBox(height: 24, child: widget.systemBar!));
      }
      _child = Column(children: _columnChildren);
    }
    return Material(
      color: widget.backgroundColor,
      child: Stack(
        children: [
          if (widget.background != null)
            Positioned.fill(child: widget.background!),
          _child,
        ],
      ),
    );
  }
}
