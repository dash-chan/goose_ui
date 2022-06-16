import 'package:flutter/material.dart';
import 'package:goose_gallery/widgets/playbox.dart';
import 'package:goose_gallery/widgets/widget_view.dart';
import 'package:goose_ui/goose_ui.dart';

class DropdownView extends StatelessWidget {
  const DropdownView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WidgetView(
      title: 'DropDown',
      desc: '',
      children: [
        PlayBox(
          title: 'title',
          codes: const TextSpan(),
          desc: '',
          children: [
            ADropdown(
              dropChild: const Placeholder(),
              sameWidth: false,
              child: AButton.icon(
                icon: const Icon(Icons.add),
                content: const Text('123'),
                onPressed: () {},
              ),
            ),
          ],
        ),
        PlayBox(
          title: '打开方式',
          codes: const TextSpan(),
          desc: '',
          children: [
            for (final trigger in AInteractive.values)
              ADropdown(
                trigger: trigger,
                dropChild: const Placeholder(),
                sameWidth: false,
                child: AButton(
                  onPressed: () {},
                  child: Text(trigger.name),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
