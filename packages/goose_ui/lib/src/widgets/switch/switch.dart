import 'package:flutter/material.dart';
import 'package:goose_ui/goose_ui.dart';

import 'switch_theme.dart';

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
  final bool loading;
  // TODO
  final ASize? size;

  @override
  State<ASwitch> createState() => _ASwitchState();
}

class _ASwitchState extends State<ASwitch> {
  bool _isTap = false;
  ShapeBorder get _shapeBorder => const StadiumBorder();

  Color get _thumbColor => ASwitchTheme.of(context).computedThumbColor;
  Color get _trackColor => ASwitchTheme.of(context).computedTrackColor;
  Color get _activeTrackColor =>
      ASwitchTheme.of(context).computedActiveTrackColor;
  Widget get _thumb {
    Widget? loadingWidget;
    if (widget.loading) {
      loadingWidget = ALoadingIcon(color: _activeTrackColor);
    }
    return Material(
      shape: _shapeBorder,
      color: _thumbColor,
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: loadingWidget,
      ),
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

  bool get _disabled {
    return widget.onChanged == null || widget.loading;
  }

  Widget? get _checkedItem {
    if (widget.checkedItem == null) return null;
    return DefaultTextStyle(
      style: const TextStyle(color: Colors.white),
      child: widget.checkedItem!,
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget result = SizedBox(
      width: 44,
      height: 22,
      child: Material(
        shape: _shapeBorder,
        color: widget.value ? _activeTrackColor : _trackColor,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              if (widget.checkedItem != null)
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  left: widget.value ? 0 : 32,
                  child: AnimatedOpacity(
                    opacity: widget.value ? 1 : 0,
                    duration: const Duration(milliseconds: 300),
                    child: _checkedItem!,
                  ),
                ),
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
    );

    if (!_disabled) {
      result = InkWell(
        splashFactory: InkPulse.splashFactory,
        splashColor: _activeTrackColor,
        customBorder: _shapeBorder,
        onTap: () {
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
        child: result,
      );
    }

    if (_disabled) {
      result = AnimatedOpacity(
        opacity: 0.6,
        duration: const Duration(milliseconds: 300),
        child: result,
      );
    }

    result = MouseRegion(
      cursor:
          _disabled ? SystemMouseCursors.forbidden : SystemMouseCursors.click,
      child: result,
    );

    return result;
  }
}
