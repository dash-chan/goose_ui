import 'package:flutter/material.dart';
import 'package:goose_gallery/widgets/widget_view.dart';
import 'package:goose_ui/goose_ui.dart';

import '../gen/code_segments.dart';
import '../widgets/playbox.dart';

class ACardView extends StatefulWidget {
  const ACardView({Key? key}) : super(key: key);

  @override
  ACardViewState createState() => ACardViewState();
}

class ACardViewState extends State<ACardView> {
  var avatarCharacters = ['U', 'Bob', 'Lucy', 'Frank', 'Steven'];
  var avatarColors = [
    Colors.amber,
    Colors.cyan,
    Colors.green,
    Colors.blue,
    Colors.deepPurpleAccent,
  ];

  var gaps = [8, 12, 16];

  var index = 0;
  var gapIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WidgetView(
        title: '卡片',
        desc: '通用卡片容器。可承载文字、列表、图片、段落，常用于后台概览页面。',
        fullWidth: true,
        children: [
          PlayBox(
            title: '基础卡片',
            codes: CodeSegments.ACardBase(context),
            desc: '包含标题、内容、操作区域。',
            // BEGIN ACardBase
            children: [
              Container(
                width: 800,
                color: Colors.white,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(32),
                child: Column(
                  children: const [
                    ACard(
                      title: Text('Default size card'),
                      children: [
                        Text('Card Content'),
                        SizedBox(height: 20),
                        Text('Card Content'),
                        SizedBox(height: 20),
                        Text('Card Content'),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ACard(
                      small: true,
                      title: Text('Small size card'),
                      children: [
                        Text('Card Content'),
                        SizedBox(height: 12),
                        Text('Card Content'),
                        SizedBox(height: 12),
                        Text('Card Content'),
                      ],
                    )
                  ],
                ),
              ),
            ],
            // END
          ),
          PlayBox(
            title: '无边框',
            codes: CodeSegments.ACardNoBorder(context),
            desc: '在灰色背景上使用无边框的卡片。',
            // BEGIN ACardNoBorder
            children: [
              Container(
                width: 800,
                color: Colors.black26,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(32),
                child: const ACard(
                  bordered: false,
                  title: Text('Default size card'),
                  children: [
                    Text('Card Content'),
                    SizedBox(height: 20),
                    Text('Card Content'),
                    SizedBox(height: 20),
                    Text('Card Content'),
                  ],
                ),
              ),
            ],
            // END
          ),
          PlayBox(
            title: '简洁卡片',
            codes: CodeSegments.ACardSimple(context),
            desc: '只包含内容区域',
            // BEGIN ACardSimple
            children: [
              Container(
                width: 800,
                color: Colors.white,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(32),
                child: const ACard(
                  children: [
                    Text('Card Content'),
                    SizedBox(height: 20),
                    Text('Card Content'),
                    SizedBox(height: 20),
                    Text('Card Content'),
                  ],
                ),
              ),
            ],
            // END
          ),
          PlayBox(
            title: '嵌套卡片',
            codes: CodeSegments.ACardInner(context),
            desc: '可以放在普通卡片内部，展示多层级结构的信息。',
            // BEGIN ACardInner
            children: [
              Container(
                width: 800,
                color: Colors.white,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(32),
                child: const ACard(
                  width: double.infinity,
                  title: Text('Card title'),
                  children: [
                    ACard(
                      width: double.infinity,
                      small: true,
                      title: Text('Inner Card title'),
                      titleBackColor: Colors.black26,
                      children: [
                        Text('Inner Card content'),
                      ],
                    ),
                    SizedBox(height: 20),
                    ACard(
                      width: double.infinity,
                      small: true,
                      title: Text('Inner Card title'),
                      titleBackColor: Colors.black26,
                      children: [
                        Text('Inner Card content'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
            // END
          ),
        ]);
  }
}
