import 'package:flutter/material.dart';
import 'package:goose_ui/goose_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ATheme(
      data: AThemeData(
        primaryAntColor: AntColors.geekBlue,
        buttonTheme: const AButtonThemeData(
          autoInsertSpaceInButton: true,
          pulseColor: Colors.pink,
        ),
      ),
      child: MaterialApp(
        title: 'Goose UI',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Goose UI'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(children: [
        for (var type in AButtonType.values)
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              for (var rounded in [true, false])
                AButton(
                  onPressed: () {},
                  buttonType: type,
                  rounded: rounded,
                  child: Text(type.name),
                ),
              AButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.search),
                rounded: true,
                buttonType: type,
              ),
              AButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.search),
                content: const Text('search'),
                rounded: true,
                buttonType: type,
              ),
              AButton(
                onPressed: () {},
                buttonType: type,
                size: ASize.medium,
                child: const Text('空格'),
              ),
            ],
          ),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            for (var type in AButtonType.values)
              AButton(
                onPressed: () {},
                danger: true,
                buttonType: type,
                child: Text('danger ${type.name}'),
              ),
          ],
        ),
      ]),
    );
  }
}
