import 'package:flutter/material.dart';
import 'package:goose_ui/goose_ui.dart';

import 'switch_theme.dart';

/// * 需要表示开关状态/两种状态之间的切换时；
/// * 和 `checkbox` 的区别是，切换 `switch` 会直接触发状态改变，而 `checkbox` 一般用于状态标记，需要和提交操作配合。
class ASwitch extends StatefulWidget {
  /// 开关选择器
  const ASwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.checkedItem,
    this.uncheckedItem,
    this.loading = false,
    this.size = ASize.medium,
  });

  /// 开关状态 `true` `false`
  final bool value;

  /// 变化时回调函数
  final ValueChanged<bool>? onChanged;

  /// 选中时的内容
  final Widget? checkedItem;

  /// 非选中时的内容
  final Widget? uncheckedItem;

  /// 加载中的开关
  final bool loading;

  /// 开关大小
  final ASize size;

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

  double get _thumbSize {
    switch (widget.size) {
      case ASize.small:
        return 12;
      case ASize.medium:
        return 18;
      case ASize.large:
        return 18;
    }
  }

  double get _thumbWidth {
    return _isTap ? _thumbSize + 4 : _thumbSize;
  }

  double get _alignLeft {
    return widget.value
        ? _isTap
            ? _thumbSize
            : _thumbSize + 4
        : 0;
  }

  bool get _disabled {
    return widget.onChanged == null || widget.loading;
  }

  Widget? get _checkedItem {
    if (widget.checkedItem == null) return null;
    Widget result = widget.checkedItem!;

    result = DefaultTextStyle(
      style: const TextStyle(
        color: Colors.white,
        fontSize: 12,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7),
        child: result,
      ),
    );

    return result;
  }

  Widget? get _uncheckedItem {
    if (widget.uncheckedItem == null) return null;
    Widget result = widget.uncheckedItem!;
    result = DefaultTextStyle(
      style: const TextStyle(
        color: Colors.white,
        fontSize: 12,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7),
        child: result,
      ),
    );

    return result;
  }

  @override
  Widget build(BuildContext context) {
    Widget result = SizedBox(
      width: (_thumbSize + 4) * 2,
      height: _thumbSize + 4,
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
                  left: widget.value ? 0 : _thumbSize - 4,
                  curve: Curves.easeInOutCubic,
                  child: AnimatedOpacity(
                    opacity: widget.value ? 1 : 0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOutCubic,
                    child: _checkedItem!,
                  ),
                ),
              if (widget.uncheckedItem != null)
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  right: widget.value ? _thumbSize - 4 : 0,
                  curve: Curves.easeInOutCubic,
                  child: AnimatedOpacity(
                    opacity: widget.value ? 0 : 1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOutCubic,
                    child: _uncheckedItem!,
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
