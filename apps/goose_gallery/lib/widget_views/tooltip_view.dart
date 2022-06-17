import 'package:flutter/material.dart';
import 'package:goose_gallery/gen/code_segments.dart';
import 'package:goose_gallery/widgets/playbox.dart';
import 'package:goose_gallery/widgets/widget_view.dart';
import 'package:goose_ui/goose_ui.dart';

class TooltipView extends StatelessWidget {
  const TooltipView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WidgetView(
      title: 'Tooltip 文字提示',
      desc: '简单的文字提示气泡框。',
      children: [
        PlayBox.single(
          title: '基本',
          codes: CodeSegments.tooltipSimple(context),
          desc: '最简单的用法',
          // BEGIN tooltipSimple#1
          child: const AToolTip(
            labelText: 'prompt text',
            child: Text('Tooltip will show on mouse enter.'),
          ),
          // END
        ),
        PlayBox(
          title: '位置',
          codes: CodeSegments.tooltipPosition(context),
          desc: '位置有 12 个方向。',
          children: [
            // BEGIN tooltipPosition#1
            for (var alignment in AAlignment.values)
              AToolTip(
                alignment: alignment,
                labelText: alignment.name,
                child: AButton(
                  onPressed: () {},
                  child: Text(alignment.name),
                ),
              ),
            // END
          ],
        ),
        PlayBox(
          title: '多彩文字提示',
          codes: CodeSegments.tooltipColors(context),
          desc: '我们添加了多种预设色彩的文字提示样式，用作不同场景使用。',
          children: [
            // BEGIN tooltipColors#1
            for (var color in AntColors.items)
              AToolTip(
                labelText: 'prompt text',
                color: color,
                child: AButton(
                  onPressed: () {},
                  child: Text(color.value.toRadixString(16)),
                ),
              ),
            // END
          ],
        ),
      ],
    );
  }
}
