import 'package:flutter/material.dart';
import 'package:goose_ui/goose_ui.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

import '../gen/code_segments.dart';
import '../widgets/playbox.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button'),
      ),
      body: WaterfallFlow(
        gridDelegate: const SliverWaterfallFlowDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 500,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
        ),
        padding: const EdgeInsets.all(12),
        children: [
          PlayBox(
            title: '按钮类型',
            desc: '按钮有五种类型：主按钮、次按钮、虚线按钮、文本按钮和链接按钮。主按钮在同一个操作区域最多出现一次。',
            codes: CodeSegments.buttonType(context),
            children: [
              // BEGIN buttonType#1
              for (var type in AButtonType.values)
                AButton(
                  onPressed: () {},
                  buttonType: type,
                  child: Text('${type.name} Button'),
                ),
              // END
            ],
          ),
          PlayBox(
            title: '图标按钮',
            desc: '当需要在 Button 内嵌入 Icon 时，可以设置 icon 属性。',
            codes: CodeSegments.buttonIcon(context),
            children: [
              // BEGIN buttonIcon#1
              AButton.icon(
                onPressed: () {},
                rounded: true,
                icon: const Icon(Icons.search),
                buttonType: AButtonType.primary,
              ),
              AButton.icon(
                onPressed: () {},
                rounded: true,
                icon: const Text('A'),
                buttonType: AButtonType.primary,
              ),
              AButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.search),
                content: const Text('Search'),
                buttonType: AButtonType.primary,
              ),
              AButton.icon(
                onPressed: () {},
                rounded: true,
                icon: const Text('A'),
              ),
              AButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.search),
                content: const Text('Search'),
              ),
              AButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.search),
                content: const Text('Search'),
                buttonType: AButtonType.dashed,
              ),
              AButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.search),
                buttonType: AButtonType.dashed,
              ),
              AButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.search),
                buttonType: AButtonType.dashed,
                rounded: true,
              ),
              // END
            ],
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
