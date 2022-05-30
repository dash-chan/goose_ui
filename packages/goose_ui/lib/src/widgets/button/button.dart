import 'package:flutter/material.dart';
import 'package:goose_ui/goose_ui.dart';

class Button extends StatefulWidget {
  const Button({Key? key, this.aSize, this.onPressed}) : super(key: key);

  final ASize? aSize;
  final VoidCallback? onPressed;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool get _disabled => widget.onPressed == null;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: InkRipple.splashFactory,
    );
  }
}
