import 'package:flutter/material.dart';

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
  final bool? autoInsertSpaceInButton;
  final EdgeInsets? padding;
  final bool rounded;

  @override
  State<AButton> createState() => _AButtonState();
}

class _AButtonState extends State<AButton> {
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
      case AButtonType.link:
      case AButtonType.text:
        return null;
      default:
        if (widget.rounded) {
          return StadiumBorder(
            side: _side ?? BorderSide.none,
          );
        } else {
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: _side ?? BorderSide.none,
          );
        }
    }
  }

  Color get _backgroundColor {
    if (widget.backgroundColor != null) return widget.backgroundColor!;

    switch (widget.buttonType) {
      case AButtonType.primary:
        //TODO Button Theme primary
        return Colors.blue;
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
        return Colors.blue;
    }
  }

  BorderSide? get _side {
    switch (widget.buttonType) {
      case AButtonType.primary:
      case AButtonType.dashed:
      case AButtonType.link:
      case AButtonType.text:
        return null;
      case AButtonType.original:
        return const BorderSide(color: Colors.blue);
    }
  }

  ASize get _buttonSize => widget.size ?? ASize.medium;

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
      splashColor: Colors.blue,
      customBorder: _shape,
      mouseCursor:
          _disabled ? SystemMouseCursors.forbidden : SystemMouseCursors.click,
      child: result,
    );

    return result;
  }
}
