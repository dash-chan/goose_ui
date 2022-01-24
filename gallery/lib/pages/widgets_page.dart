import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:gallery/examples/button_example.dart';
import 'package:goose_ui/goose_ui.dart';

class WidgetsPage extends StatefulWidget {
  const WidgetsPage({Key? key}) : super(key: key);

  @override
  _WidgetsPageState createState() => _WidgetsPageState();
}

class _WidgetsPageState extends State<WidgetsPage> {
  int _currentIndex = 0;
  final _menus = <WidgetItem>[
    WidgetItem(
      icon: Icons.smart_button_rounded,
      title: '按钮',
      child: const ButtonExample(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return GScaffold(
      drawer: GAppMenu(
        onPressed: (item) {
          int index = _menus.indexOf(item as WidgetItem);
          _currentIndex = index;
          setState(() {});
        },
        children: _menus,
      ),
      content: PageTransitionSwitcher(
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
          return SharedAxisTransition(
            child: child,
            animation: primaryAnimation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.vertical,
          );
        },
        child: _menus.map((e) => e.child).toList()[_currentIndex],
      ),
    );
  }
}

class WidgetItem extends GAppMenuItem {
  final Widget child;
  WidgetItem({
    required IconData icon,
    required String title,
    required this.child,
  }) : super(
          icon: icon,
          title: title,
        );
}
