import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:gallery/l10n/s.dart';
import 'package:gallery/pages/main_page.dart';
import 'package:gallery/pages/widgets_page.dart';
import 'package:goose_ui/goose_ui.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  bool _reverse = false;

  VoidCallback next(int index) => () {
        _reverse = index < _currentIndex;
        _currentIndex = index;
        setState(() {});
      };

  @override
  Widget build(BuildContext context) {
    return GScaffold(
      appBar: GAppBar(
        title: Text(S.of(context).appName),
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
            onPressed: () {
              launch('https://github.com/goose-kit/goose_ui');
            },
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
