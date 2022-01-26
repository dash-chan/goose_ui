import 'package:flutter/material.dart';

class GExpansion extends StatefulWidget {
  final bool init;
  final Widget tile;
  final Widget child;
  const GExpansion(
      {Key? key, this.init = true, required this.child, required this.tile})
      : super(key: key);
  @override
  State<GExpansion> createState() => _GExpansionState();
}

class _GExpansionState extends State<GExpansion> {
  late bool _expand;

  @override
  void initState() {
    super.initState();
    _expand = widget.init;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              _expand = !_expand;
              setState(() {});
            },
            child: widget.tile,
          ),
          ClipRect(
            child: AnimatedAlign(
              heightFactor: _expand ? 1 : 0,
              alignment: Alignment.topCenter,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOutCubic,
              child: widget.child,
            ),
          ),
        ],
      ),
    );
  }
}
