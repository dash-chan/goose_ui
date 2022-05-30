import 'package:flutter/material.dart';
import 'package:goose_ui/goose_ui.dart';

class AIconButton extends AButton {
  const AIconButton(
      {super.key,
      required super.onPressed,
      required Widget icon,
      super.size,
      super.rounded})
      : super(
          child: icon,
          padding: EdgeInsets.zero,
        );
}
