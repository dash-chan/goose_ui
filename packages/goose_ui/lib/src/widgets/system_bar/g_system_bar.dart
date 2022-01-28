import 'package:flutter/material.dart';

class GSystemBar extends StatelessWidget {
  final List<Widget>? prefix;
  final List<Widget>? suffix;

  const GSystemBar({Key? key, this.prefix, this.suffix}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 24),
      child: Row(
        children: [
          if (prefix != null) ...prefix!,
          const Spacer(),
          if (suffix != null) ...suffix!,
        ],
      ),
    );
  }
}
