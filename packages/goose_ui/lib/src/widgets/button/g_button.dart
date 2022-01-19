import 'package:flutter/material.dart';

class GButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  const GButton({Key? key, required this.onPressed, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: IntrinsicWidth(
        child: child,
      ),
    );
  }
}
