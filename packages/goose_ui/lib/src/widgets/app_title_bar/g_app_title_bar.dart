import 'package:flutter/material.dart';
import 'package:goose_ui/goose_ui.dart';

class GAppTitleBar extends StatelessWidget {
  final Alignment alignment;
  final VoidCallback? onClose;
  final VoidCallback? onFullScreen;
  final VoidCallback? onZoomOut;
  const GAppTitleBar({
    Key? key,
    this.alignment = Alignment.centerLeft,
    required this.onClose,
    required this.onFullScreen,
    required this.onZoomOut,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Row(
        children: [
          GRawButton(
            height: 24,
            onPressed: onClose,
            child: const Icon(Icons.close),
          ),
          GRawButton(
            height: 24,
            onPressed: onZoomOut,
            child: const Icon(Icons.remove),
          ),
          GRawButton(
            height: 24,
            onPressed: onFullScreen,
            child: const Icon(Icons.fullscreen),
          ),
        ],
      ),
    );
  }
}
