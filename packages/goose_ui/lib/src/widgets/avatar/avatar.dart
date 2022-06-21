import 'package:flutter/material.dart';
import 'package:goose_ui/goose_ui.dart';
import 'package:goose_ui/src/enums/avatar_type.dart';
import 'package:goose_ui/src/extensions/auto_size_text.dart';

export 'avatar_group.dart';

class AAvatar extends StatefulWidget {
  final String? alt;

  ///字符距离左右两侧边界单位像素
  final double? gap;
  final IconData? icon;

  ///是否圆形
  final bool? circleShape;

  ///头像大小
  final ASize? size;

  ///图片地址或widget
  final dynamic src;

  ///仅对字符和icon有效
  final Color? backgroundColor;

  ///仅对字符和icon有效
  final Color? color;
  final VoidCallback? onError;

  ///显示角标
  final bool? badge;

  ///角标数字 null为无数字
  final int? badgedNum;

  @override
  AAvatarState createState() => AAvatarState();

  const AAvatar({
    super.key,
    this.alt,
    this.gap = 4.0,
    this.icon,
    this.circleShape = true,
    this.size = ASize.medium,
    this.src,
    this.backgroundColor = Colors.black26,
    this.color = Colors.white70,
    this.onError,
    this.badge = false,
    this.badgedNum,
  })  : assert(alt != null || icon != null || src != null),
        assert(src == null || src is String || src is Widget);
}

class AAvatarState extends State<AAvatar> {
  final _defaultFontSize = 24;
  final _maxLines = 1;

  TextStyle get _avatarStyle =>
      TextStyle(color: widget.color, fontSize: _defaultFontSize * scaleWidth);

  double get scaleWidth => MediaQuery.of(context).size.width / 1080;

  double get avatarSize => widget.size!.size * scaleWidth;

  double get badgeSize => (widget.badgedNum == null ? 8 : 20) * scaleWidth;

  Widget get badge => Container(
        width: badgeSize,
        height: badgeSize,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(badgeSize / 2),
        ),
        child: widget.badgedNum == null
            ? const SizedBox.shrink()
            : Text(
                '${widget.badgedNum}',
                style: const TextStyle(color: Colors.white70, fontSize: 12),
              ),
      );

  AvatarType get type {
    if (widget.src != null) {
      return AvatarType.image;
    } else if (widget.icon != null) {
      return AvatarType.icon;
    } else {
      return AvatarType.character;
    }
  }

  Widget get errorLoadingWidget => Text(
        widget.alt ?? 'U',
        maxLines: _maxLines,
        style: _avatarStyle,
      ).auto;

  Widget get _child {
    switch (type) {
      case AvatarType.character:
        return Text(
          widget.alt ?? 'U',
          maxLines: _maxLines,
          style: _avatarStyle,
        ).auto;
      case AvatarType.icon:
        return Icon(
          widget.icon,
          size: avatarSize - widget.gap!,
          color: widget.color,
        );
      case AvatarType.image:
        return (widget.src is String)
            ? Image.network(
                widget.src,
                fit: BoxFit.cover,
                errorBuilder: (context, widget, event) {
                  return errorLoadingWidget;
                },
              )
            : widget.src;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: avatarSize,
          height: avatarSize,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          padding: type == AvatarType.character
              ? EdgeInsets.symmetric(horizontal: widget.gap!)
              : EdgeInsets.zero,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: widget.circleShape!
                ? BorderRadius.circular(avatarSize / 2)
                : BorderRadius.zero,
          ),
          child: _child,
        ),
        if (widget.badge!)
          Positioned(
              top: -badgeSize / 2.5, right: -badgeSize / 2.5, child: badge),
      ],
    );
  }
}
