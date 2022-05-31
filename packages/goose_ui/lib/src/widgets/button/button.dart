import 'package:flutter/material.dart';
import 'package:goose_ui/goose_ui.dart';
import 'package:goose_ui/src/themes/theme.dart';
import 'package:goose_ui/src/widgets/button/button_shape.dart';

import '../../enums/enums.dart';
import '../ink_pulse/ink_pulse.dart';
import 'button_theme.dart';
import 'button_type.dart';

export 'button_type.dart';
export 'button_theme.dart';

class AButton extends StatefulWidget {
  const AButton({
    super.key,
    this.size,
    required this.onPressed,
    required this.child,
    this.buttonType = AButtonType.original,
    this.shape,
    this.backgroundColor,
    this.foregroundColor,
    this.pulseColor,
    this.autoInsertSpaceInButton,
    this.padding,
    this.rounded = false,
    this.danger = false,
  });

  AButton.icon({
    super.key,
    required Widget icon,
    double? spacing,
    Widget? content,
    this.size,
    required this.onPressed,
    this.buttonType = AButtonType.original,
    this.shape,
    this.backgroundColor,
    this.foregroundColor,
    this.pulseColor,
    this.autoInsertSpaceInButton,
    this.padding,
    this.rounded = false,
    this.danger = false,
  }) : child = _IconContent(icon: icon, content: content, spacing: spacing);

  final ASize? size;
  final VoidCallback? onPressed;
  final Widget child;
  final AButtonType buttonType;
  final ShapeBorder? shape;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? pulseColor;
  final bool? autoInsertSpaceInButton;
  final EdgeInsets? padding;
  final bool rounded;
  final bool danger;

  @override
  State<AButton> createState() => _AButtonState();
}

class _AButtonState extends State<AButton> {
  bool _hover = false;
  bool _isTap = false;

  AButtonThemeData get _theme => AButtonTheme.of(context);

  bool get _disabled => widget.onPressed == null;
  InteractiveInkFeatureFactory get _splashFactory {
    if (widget.buttonType == AButtonType.text ||
        widget.buttonType == AButtonType.link) {
      return InkPulse.noSplashFactory;
    } else {
      return InkPulse.splashFactory;
    }
  }

  ShapeBorder? get _shape {
    if (widget.shape != null) return widget.shape!;
    switch (widget.buttonType) {
      case AButtonType.dashed:
        if (widget.rounded) {
          return StadiumDashBorder(side: _side, interval: const [2, 2]);
        } else {
          return RoundedDashBorder(
            side: _side,
            borderRadius: BorderRadius.circular(4),
            interval: const [2, 2],
          );
        }
      case AButtonType.link:
        return null;

      case AButtonType.text:
      default:
        if (widget.rounded) {
          return StadiumBorder(side: _side);
        } else {
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: _side,
          );
        }
    }
  }

  AntColor get _primary {
    if (widget.danger) {
      return ATheme.of(context).errorColor;
    } else {
      return _theme.primaryColor ?? AntColors.daybreakBlue;
    }
  }

  Color get _backgroundColor {
    if (widget.backgroundColor != null) return widget.backgroundColor!;

    switch (widget.buttonType) {
      case AButtonType.primary:
        if (_isTap) return _primary.shade700;
        if (_hover) return _primary.shade400;
        return _primary;
      case AButtonType.dashed:
      case AButtonType.link:
      case AButtonType.text:
      case AButtonType.original:
        return Colors.transparent;
    }
  }

  Color get _foregroundColor {
    if (widget.foregroundColor != null) return widget.foregroundColor!;
    switch (widget.buttonType) {
      case AButtonType.primary:
        return Colors.white;
      case AButtonType.text:
        if (widget.danger) return ATheme.of(context).errorColor;
        return Colors.black;
      case AButtonType.dashed:
      case AButtonType.original:
        if (widget.danger) return ATheme.of(context).errorColor;
        if (_isTap) return _primary.shade700;
        if (_hover) return _primary;
        return Colors.black;
      case AButtonType.link:
        return _primary;
    }
  }

  BorderSide get _side {
    Color color = _primary;
    if (_isTap) {
      color = _primary.shade700;
    }
    if (!_hover) {
      color = _theme.neutralColor ?? Colors.grey;
    }

    switch (widget.buttonType) {
      case AButtonType.primary:
      case AButtonType.link:
      case AButtonType.text:
        return BorderSide.none;
      case AButtonType.dashed:
      case AButtonType.original:
        return BorderSide(color: color, width: 1);
    }
  }

  ASize get _buttonSize => widget.size ?? ASize.medium;

  Color get _pulseColor {
    if (widget.danger) return ATheme.of(context).errorColor;
    return widget.pulseColor ?? _theme.pulseColor ?? Colors.blue;
  }

  Color get _hoverColor {
    if (widget.buttonType == AButtonType.text) {
      return ATheme.of(context).neutralColor.shade300;
    } else {
      return Colors.transparent;
    }
  }

  Color get _highlightColor {
    if (widget.buttonType == AButtonType.text) {
      return ATheme.of(context).neutralColor.shade400;
    } else {
      return Colors.transparent;
    }
  }

  Widget get _child {
    if (!(widget.autoInsertSpaceInButton ?? _theme.autoInsertSpaceInButton)) {
      return widget.child;
    }
    if (widget.child is! Text) {
      return widget.child;
    } else {
      Text innerText = widget.child as Text;
      final text = innerText.data ?? innerText.textSpan?.toPlainText() ?? '';
      if (text.length == 2) {
        return Text(text.characters.join(' '));
      } else {
        return widget.child;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // autoInsertSpaceInButton
    Widget result = _child;

    // center widget
    result = Center(widthFactor: 1, heightFactor: 1, child: result);

    // add padding
    result = Padding(
      padding: widget.padding ??
          EdgeInsets.symmetric(
            horizontal: _buttonSize.buttonHorizontalPadding,
          ),
      child: result,
    );

    // add constraints
    result = ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: _buttonSize.button,
        minWidth: _buttonSize.button,
      ),
      child: result,
    );

    // add shape
    result = Material(
      color: _backgroundColor,
      shape: _shape,
      textStyle: TextStyle(
        color: _foregroundColor,
        fontSize: _buttonSize.buttonSize,
      ),
      child: result,
    );

    // add ink
    result = InkWell(
      splashFactory: _splashFactory,
      onTap: widget.onPressed,
      hoverColor: _hoverColor,
      highlightColor: _highlightColor,
      onHover: (state) {
        setState(() {
          _hover = state;
        });
      },
      onHighlightChanged: (state) {
        setState(() {
          _isTap = state;
        });
      },
      splashColor: _pulseColor,
      customBorder: _shape,
      mouseCursor:
          _disabled ? SystemMouseCursors.forbidden : SystemMouseCursors.click,
      child: result,
    );

    return result;
  }
}

class _IconContent extends StatelessWidget {
  const _IconContent({required this.icon, this.content, required this.spacing});

  final Widget icon;
  final Widget? content;
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    if (content == null) return icon;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        SizedBox(width: spacing ?? AButtonTheme.of(context).iconSpacing),
        content!,
      ],
    );
  }
}
