import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:gallery/pages/main_page.dart';
import 'package:gallery/pages/widgets_page.dart';
import 'package:goose_ui/goose_ui.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  bool _reverse = false;

  VoidCallback next(int index) => () => setState(() {
        _reverse = index < _currentIndex;
        _currentIndex = index;
      });

  @override
  Widget build(BuildContext context) {
    return GScaffold(
      appBar: GAppBar(
        title: const Text('Goose UI'),
        actions: [
          GRawButton(
            onPressed: next(0),
            child: const Text('GooseUI'),
          ),
          GRawButton(
            onPressed: next(1),
            child: const Text('组件'),
          ),
          GRawButton(
            onPressed: () {},
            icon: const Icon(Icons.code_rounded),
            child: const Text('Github'),
          ),
        ],
        elevation: 4,
      ),
      systemBar: Container(color: Colors.blue),
      content: PageTransitionSwitcher(
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
          return SharedAxisTransition(
            child: child,
            animation: primaryAnimation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.horizontal,
          );
        },
        reverse: _reverse,
        child: const [
          MainPage(),
          WidgetsPage(),
        ][_currentIndex],
      ),
    );
  }
}
