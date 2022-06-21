import 'package:flutter/material.dart';

class ACard extends StatelessWidget {
  ///宽度
  final double? width;
  ///标题
  final Widget? title;

  ///内容
  final List<Widget> children;

  ///是否有边框
  final bool? bordered;

  ///右上角操作区域回调
  final VoidCallback? extra;
  final Widget? action;

  ///是否为small card
  final bool? small;

  ///标题栏背景色
  final Color? titleBackColor;

  const ACard({
    super.key,
    this.title,
    required this.children,
    this.bordered = true,
    this.extra,
    this.action,
    this.small = false,
    this.titleBackColor = Colors.white, this.width=300,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
          color: Colors.white,
          border: bordered!
              ? Border.all(color: Colors.black26)
              : const Border.fromBorderSide(BorderSide.none)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Container(
              decoration: BoxDecoration(color: titleBackColor),
              padding: EdgeInsets.symmetric(
                  horizontal: small! ? 20 : 32, vertical: small! ? 16 : 28),
              child: Row(
                children: [
                  title!,
                  const Spacer(),
                  action == null ? const SizedBox.shrink() : action!,
                ],
              ),
            ),
          if (title != null)
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.black26,
            ),
          Padding(
            padding: EdgeInsets.all(small! ? 20 : 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            ),
          ),
        ],
      ),
    );
  }
}
