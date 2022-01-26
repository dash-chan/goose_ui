import 'package:flutter/material.dart';
import 'package:goose_ui/goose_ui.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return GScaffold(
      content: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 120),
        children: [
          Center(
            child: Image.asset('assets/logo.png', height: 84, width: 84),
          ),
          const SizedBox(height: 32),
          const Center(
            child: Text(
              'Goose UI',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 32,
              ),
            ),
          ),
          const Center(
            child: Text(
              'flutter 桌面端组件库',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
