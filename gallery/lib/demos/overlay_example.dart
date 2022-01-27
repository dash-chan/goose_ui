import 'package:flutter/material.dart';
import 'package:gallery/widgets/page_wrapper.dart';
import 'package:goose_ui/goose_ui.dart';

class OverlayExample extends StatefulWidget {
  const OverlayExample({Key? key}) : super(key: key);

  @override
  State<OverlayExample> createState() => _OverlayExampleState();
}

class _OverlayExampleState extends State<OverlayExample> {
  final _overlay = GOverlay();
  final LayerLink _link = LayerLink();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      children: [
        GRawButton(
          onPressed: () {
            showGPopup(context: context);
          },
          child: const Text('popup'),
        ),
        Builder(builder: (context) {
          return CompositedTransformTarget(
            link: _link,
            child: GRawButton(
              onPressed: () {
                RenderBox obj = context.findRenderObject()! as RenderBox;
                var rect = RelativeRect.fromRect(
                  Rect.fromPoints(
                    obj.localToGlobal(obj.size.bottomLeft(Offset.zero)),
                    obj.localToGlobal(obj.size.bottomRight(Offset.zero)),
                  ),
                  Offset.zero & Size(100, 200),
                );
                _overlay.show(
                  context: context,
                  rect: rect,
                  showWhenUnlinked: false,
                  link: _link,
                  linked: true,
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.green,
                  ),
                );
              },
              child: const Text('show overlay'),
            ),
          );
        }),
        GRawButton(
          onPressed: () {
            _overlay.hide();
          },
          child: const Text('hide overlay'),
        ),
        const SizedBox(height: 2000),
      ],
    );
  }
}
