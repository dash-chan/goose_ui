import 'package:flutter/material.dart';
import 'package:goose_gallery/widgets/widget_view.dart';
import 'package:goose_ui/goose_ui.dart';

class LoadingIconView extends StatelessWidget {
  const LoadingIconView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WidgetView(
      title: 'Loading Icon',
      desc: '',
      children: [
        Center(
          child: ALoadingIcon(),
        ),
      ],
    );
  }
}
