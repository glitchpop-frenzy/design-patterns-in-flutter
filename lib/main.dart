import 'package:flutter/material.dart';

import '01_singleton/singletone_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Design Patterns in Flutter',
      home: Scaffold(
        backgroundColor: Colors.blueGrey[200],
        body: const SafeArea(
          child: SingletonExample(),
        ),
      ),
    );
  }
}
