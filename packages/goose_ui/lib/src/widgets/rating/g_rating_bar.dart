import 'package:flutter/material.dart';

//TODO RatingBar
class _GRatingBar extends StatelessWidget {
  final num value;
  const _GRatingBar({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(),
    );
  }
}

class GIntegerRatingBar extends StatefulWidget {
  final Icon icon;
  final Icon selectedIcon;
  final Color? color;
  final int? value;
  final int star;
  final ValueChanged<int>? onPressed;
  const GIntegerRatingBar({
    Key? key,
    this.icon = const Icon(Icons.star_border_rounded),
    this.selectedIcon = const Icon(Icons.star_rounded),
    required this.value,
    this.color,
    this.star = 5,
    required this.onPressed,
  })  : assert((value ?? 0) <= star),
        super(key: key);

  @override
  State<GIntegerRatingBar> createState() => _GIntegerRatingBarState();
}

class _GIntegerRatingBarState extends State<GIntegerRatingBar> {
  late int _displayValue;

  int _currentValue(double dx) {
    double iconWidth = widget.icon.size ?? 24;
    double fullWidth = iconWidth * widget.star;
    return (dx / fullWidth * widget.star).toInt() + 1;
  }

  @override
  void initState() {
    super.initState();
    _displayValue = widget.value ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onExit: (_) {
        setState(() {
          _displayValue = widget.value ?? 0;
        });
      },
      onHover: (event) {
        var dx = event.localPosition.dx;
        var computeValue = _currentValue(dx);
        if (computeValue != _displayValue) {
          _displayValue = computeValue;
          setState(() {});
        }
      },
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (widget.onPressed != null) widget.onPressed!(_displayValue);
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(widget.star, (index) {
            if (index < _displayValue) {
              return widget.selectedIcon;
            } else {
              return widget.icon;
            }
          }),
        ),
      ),
    );
  }
}
