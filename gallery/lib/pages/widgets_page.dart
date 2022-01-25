import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:gallery/codeviewer/code_style.dart';
import 'package:gallery/demos/button_example.dart';
import 'package:gallery/demos/checkbox_example.dart';
import 'package:gallery/demos/radio_example.dart';
import 'package:gallery/demos/scaffold_example.dart';
import 'package:gallery/demos/switch_example.dart';
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
    WidgetItem(
      icon: Icons.check_box_rounded,
      title: 'Checkbox',
      child: const CheckboxExample(),
    ),
    WidgetItem(
      icon: Icons.radio_rounded,
      title: 'Radio',
      child: const RadioExample(),
    ),
    WidgetItem(
      icon: Icons.backpack_rounded,
      title: 'Scaffold',
      child: const ScaffoldExample(),
    ),
    WidgetItem(
      icon: Icons.switch_left,
      title: 'switch',
      child: const SwitchExample(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return CodeStyle(
      stringStyle: TextStyle(color: Colors.orange[900]!),
      numberStyle: const TextStyle(color: Colors.green),
      classStyle: const TextStyle(color: Colors.blue),
      punctuationStyle: const TextStyle(color: Colors.black54),
      baseStyle: TextStyle(color: Colors.blue[900]!),
      keywordStyle: TextStyle(color: Colors.purple[900]!),
      constantStyle: TextStyle(color: Colors.grey[700]!),
      commentStyle: TextStyle(color: Colors.grey[500]!),
      child: GScaffold(
        drawer: GAppMenu(
          onPressed: (item) {
            int index = _menus.indexOf(item as WidgetItem);
            _currentIndex = index;
            setState(() {});
            int a = 12;
            String b = '123';
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
