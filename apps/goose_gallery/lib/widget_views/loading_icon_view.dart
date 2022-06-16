import 'package:flutter/material.dart';
import 'package:goose_gallery/gen/code_segments.dart';
import 'package:goose_gallery/widgets/playbox.dart';
import 'package:goose_gallery/widgets/widget_view.dart';
import 'package:goose_ui/goose_ui.dart';

class LoadingIconView extends StatelessWidget {
  const LoadingIconView({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetView(
      title: 'Loading Icon',
      desc: '',
      children: [
        PlayBox.single(
          title: '基础',
          codes: CodeSegments.loadingIconBasic(context),
          desc: '',
          // BEGIN loadingIconBasic
          child: const ALoadingIcon(),
          // END
        ),
        PlayBox(
          title: '颜色',
          codes: CodeSegments.loadingIconColor(context),
          desc: '',
          children: [
            // BEGIN loadingIconColor
            for (final color in AntColors.items) ALoadingIcon(color: color),
            // END
          ],
        ),
        PlayBox(
          title: '大小',
          codes: CodeSegments.loadingIconSize(context),
          desc: '',
          children: [
            // BEGIN loadingIconSize
            for (final size in <double>[12, 14, 16]) ALoadingIcon(size: size),
            // END
          ],
        ),
        PlayBox(
          title: '粗细',
          codes: CodeSegments.loadingIconWidth(context),
          desc: '',
          children: [
            // BEGIN loadingIconWidth
            for (final width in <double>[2, 4, 6]) ALoadingIcon(width: width),
            // END
          ],
        ),
        PlayBox.single(
          title: '进度',
          codes: CodeSegments.loadingIconProgress(context),
          desc: '',
          child: const CustomLoadingIcon(),
        ),
      ],
    );
  }
}

class CustomLoadingIcon extends StatefulWidget {
  const CustomLoadingIcon({Key? key}) : super(key: key);

  @override
  State<CustomLoadingIcon> createState() => _CustomLoadingIconState();
}

class _CustomLoadingIconState extends State<CustomLoadingIcon>
    with TickerProviderStateMixin {
  // BEGIN loadingIconProgress#1
  late AnimationController _animation;

  _changeState() {
    if (_animation.value == 1) _animation.reverse();
    if (_animation.value == 0) _animation.forward();
  }

  @override
  void initState() {
    super.initState();
    _animation = AnimationController(
      duration: const Duration(milliseconds: 2000),
      reverseDuration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    _animation.forward();
    _animation.addListener(_changeState);
  }

  @override
  void dispose() {
    _animation.removeListener(_changeState);
    _animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return ALoadingIcon(
          sweep: _animation.value,
        );
      },
    );
  }

  // END

}
