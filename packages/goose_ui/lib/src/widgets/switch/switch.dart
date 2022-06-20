import 'package:flutter/material.dart';
import 'package:goose_ui/goose_ui.dart';

class ASwitch extends StatefulWidget {
  const ASwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.checkedItem,
    this.uncheckedItem,
    this.loading = false,
    this.size,
  });

  final bool value;
  final ValueChanged<bool>? onChanged;
  // TODO
  final Widget? checkedItem;
  // TODO
  final Widget? uncheckedItem;
  // TODO
  final bool loading;
  // TODO
  final ASize? size;

  @override
  State<ASwitch> createState() => _ASwitchState();
}

class _ASwitchState extends State<ASwitch> {
  bool _isTap = false;
  ShapeBorder get _shapeBorder => const StadiumBorder();

  Widget get _thumb {
    return Material(
      shape: _shapeBorder,
      color: Colors.white,
    );
  }

  double get _thumbWidth {
    return _isTap ? 22 : 18;
  }

  double get _alignLeft {
    return widget.value
        ? _isTap
            ? 18
            : 22
        : 0;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: InkPulse.splashFactory,
      splashColor: AntColors.daybreakBlue,
      customBorder: _shapeBorder,
      onTap: widget.onChanged == null
          ? null
          : () {
              widget.onChanged?.call(!widget.value);
            },
      onTapDown: (detail) {
        setState(() {
          _isTap = true;
        });
      },
      onTapUp: (detail) {
        setState(() {
          _isTap = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _isTap = false;
        });
      },
      child: SizedBox(
        width: 44,
        height: 22,
        child: Material(
          shape: _shapeBorder,
          color: widget.value ? Colors.blue : Colors.grey,
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                AnimatedPositioned(
                  left: _alignLeft,
                  top: 0,
                  bottom: 0,
                  width: _thumbWidth,
                  curve: Curves.easeInOutCubic,
                  duration: const Duration(milliseconds: 300),
                  child: _thumb,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
