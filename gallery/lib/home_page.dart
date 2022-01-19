import 'package:flutter/material.dart';
import 'package:goose_ui/goose_ui.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          GButton(
            onPressed: () {},
            child: Text('test'),
          ),
        ],
      ),
    );
  }
}
