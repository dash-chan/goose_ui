import 'package:flutter/material.dart';
import 'package:goose_gallery/widgets/widget_view.dart';
import 'package:goose_ui/goose_ui.dart';

import '../gen/code_segments.dart';
import '../widgets/playbox.dart';

class ButtonView extends StatelessWidget {
  const ButtonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WidgetView(
      title: 'Button 按钮',
      desc: '按钮用于开始一个即时操作。',
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
        const ButtonSizeBox(),
        PlayBox(
          title: '危险按钮',
          codes: CodeSegments.buttonDanger(context),
          desc: '',
          children: [
            // BEGIN buttonDanger#1
            for (var type in AButtonType.values)
              AButton(
                onPressed: () {},
                buttonType: type,
                danger: true,
                child: Text(type.name),
              ),
            // END
          ],
        ),
      ],
    );
  }
}

class ButtonSizeBox extends StatefulWidget {
  const ButtonSizeBox({Key? key}) : super(key: key);

  @override
  State<ButtonSizeBox> createState() => _ButtonSizeBoxState();
}

class _ButtonSizeBoxState extends State<ButtonSizeBox> {
  // BEGIN buttonSize#1
  ASize _size = ASize.medium;
  // END
  @override
  Widget build(BuildContext context) {
    return PlayBox(
      title: '按钮尺寸',
      codes: CodeSegments.buttonSize(context),
      desc:
          '按钮有大、中、小三种尺寸。通过设置 size 为 large small 分别把按钮设为大、小尺寸。若不设置 size，则尺寸为中。',
      children: [
        // BEGIN buttonSize#2
        for (var size in ASize.values)
          AButton(
            onPressed: () {
              setState(() {
                _size = size;
              });
            },
            child: Text(size.name),
          ),
        const SizedBox(width: double.infinity),
        for (var type in AButtonType.values)
          AButton(
            onPressed: () {},
            buttonType: type,
            size: _size,
            child: Text(type.name),
          ),
        // END
      ],
    );
  }
}
