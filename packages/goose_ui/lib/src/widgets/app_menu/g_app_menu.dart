import 'package:flutter/material.dart';

class GAppMenu extends StatefulWidget {
  final List<GAppMenuItem> children;
  final bool expanded;
  final Color? backgroundColor;
  final void Function(GAppMenuItem item)? onPressed;
  final ShapeBorder? shape;
  const GAppMenu({
    Key? key,
    required this.children,
    this.expanded = true,
    this.backgroundColor,
    this.onPressed,
    this.shape,
  }) : super(key: key);

  @override
  _GAppMenuState createState() => _GAppMenuState();
}

class _GAppMenuState extends State<GAppMenu> {
  GAppMenuItem? _selected;
  @override
  Widget build(BuildContext context) {
    Widget _child = const SizedBox.shrink();
    if (!widget.expanded) {
      _child = ListView(
        children: widget.children.map((e) {
          return IconButton(
            onPressed: () {
              setState(() {
                _selected = e;
              });
              if (widget.onPressed != null) widget.onPressed!(e);
            },
            icon: Icon(e.icon),
            color: _selected == e
                ? Theme.of(context).primaryColor.withOpacity(0.8)
                : null,
          );
        }).toList(),
      );
    } else {
      _child = ListView(
        children: widget.children.map((e) {
          bool same = _selected == e;
          Widget icon = Icon(e.activeIcon ?? e.icon);
          return ListTile(
            leading: same ? icon : Icon(e.icon),
            shape: widget.shape,
            title: Text(
              e.title,
              softWrap: false,
            ),
            onTap: () {
              setState(() {
                _selected = e;
              });
              if (widget.onPressed != null) widget.onPressed!(e);
            },
            tileColor:
                same ? Theme.of(context).primaryColor.withOpacity(0.2) : null,
          );
        }).toList(),
      );
    }

    return Material(
      color: widget.backgroundColor,
      child: _child,
    );
  }
}

class GAppMenuItem {
  final List<GAppMenuItem>? children;
  final IconData icon;
  final IconData? activeIcon;
  final String title;
  final String? path;
  const GAppMenuItem({
    this.children,
    required this.icon,
    this.activeIcon,
    required this.title,
    this.path,
  });

  @override
  int get hashCode => hashValues(title, path, icon);

  @override
  bool operator ==(Object other) {
    return other is GAppMenuItem &&
        other.icon == icon &&
        other.path == path &&
        other.title == title;
  }
}
