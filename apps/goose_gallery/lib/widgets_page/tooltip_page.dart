import 'package:flutter/material.dart';
import 'package:goose_ui/goose_ui.dart';

class TooltipPage extends StatelessWidget {
  const TooltipPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          for (var alignment in AAlignment.values)
            Padding(
              padding: EdgeInsets.all(24),
              child: Center(
                child:
                    AToolTip(alignment: alignment, child: Text(alignment.name)),
              ),
            ),
          AToolTip(alignment: AAlignment.leftBottom, child: Text('current')),
        ],
      ),
    );
  }
}
