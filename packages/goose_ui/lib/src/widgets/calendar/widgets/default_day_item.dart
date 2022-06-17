import 'package:ant_color/ant_color.dart';
import 'package:flutter/material.dart';

class DefaultDayItem extends StatefulWidget {
  const DefaultDayItem({
    Key? key,
    required this.date,
    required this.isSelected,
    required this.isToday,
    required this.isLastMonth,
    required this.isNextMonth,
    required this.isThisMonth,
    required this.fullScreen,
    required this.child,
    this.onSelected,
  }) : super(key: key);

  final DateTime date;

  final bool isSelected;

  final bool isToday;

  final bool isLastMonth;

  final bool isNextMonth;

  final bool isThisMonth;

  final bool fullScreen;

  final ValueChanged<DateTime>? onSelected;

  final Widget? child;

  @override
  State<DefaultDayItem> createState() => DefaultDayItemState();
}

class DefaultDayItemState extends State<DefaultDayItem> {
  bool _isHover = false;

  TextStyle _style(BuildContext context) {
    return widget.isThisMonth
        ? TextStyle(
            fontSize: widget.fullScreen ? 14 : 12,
          )
        : TextStyle(
            fontSize: widget.fullScreen ? 14 : 12,
            color: AntColors.neutral.shade500,
          );
  }

  Color? get _backgroundColor {
    if (widget.isSelected) return AntColors.daybreakBlue.shade100;
    if (_isHover) return AntColors.neutral.shade300;
    return null;
  }

  BoxBorder? get _border {
    if (widget.isToday) {
      return Border.all(color: AntColors.daybreakBlue, width: 1);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    late Widget result;
    if (!widget.fullScreen) {
      result = Container(
        width: 36,
        height: 24,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          border: _border,
          color: _backgroundColor,
        ),
        child: Center(
            child: Text(
          '${widget.date.day}',
          style: _style(context),
        )),
      );
    } else {
      result = GestureDetector(
        onTap: () => widget.onSelected?.call(widget.date),
        child: Container(
          height: 116,
          color: _backgroundColor,
          child: Column(
            children: [
              Container(
                height: 2,
                color: widget.isToday
                    ? AntColors.daybreakBlue
                    : AntColors.neutral.shade400,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '${widget.date.day}',
                    style: _style(context),
                  ),
                ),
              ),
              Expanded(child: widget.child ?? const SizedBox.shrink()),
            ],
          ),
        ),
      );
    }
    result = GestureDetector(
      onTap: () => widget.onSelected?.call(widget.date),
      child: result,
    );

    result = MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() {
          _isHover = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHover = false;
        });
      },
      child: result,
    );

    if (widget.fullScreen) {
      result = Expanded(child: result);
    }

    return result;
  }
}
