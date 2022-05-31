import 'package:flutter/material.dart';
import 'package:goose_ui/src/widgets/button/button_shape.dart';

import '../../enums/enums.dart';
import '../ink_pulse/ink_pulse.dart';
import 'button_theme.dart';
import 'button_type.dart';

export 'button_type.dart';
export 'icon_button.dart';
export 'button_theme.dart';

class AButton extends StatefulWidget {
  const AButton({
    Key? key,
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
  }) : super(key: key);

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

  @override
  State<AButton> createState() => _AButtonState();
}

class _AButtonState extends State<AButton> {
  bool _hover = false;

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

  Color get _backgroundColor {
    if (widget.backgroundColor != null) return widget.backgroundColor!;

    switch (widget.buttonType) {
      case AButtonType.primary:
        return _theme.primaryColor ?? Colors.blue;
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
      case AButtonType.dashed:
      case AButtonType.text:
      case AButtonType.original:
        return Colors.black;
      case AButtonType.link:
        return _theme.primaryColor ?? Colors.blue;
    }
  }

  BorderSide get _side {
    Color color = _theme.primaryColor ?? Colors.blue;
    if (!_hover) {
      color = _theme.normalColor ?? Colors.grey;
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
    return widget.pulseColor ?? _theme.pulseColor ?? Colors.blue;
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
      onHover: (state) {
        setState(() {
          _hover = state;
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