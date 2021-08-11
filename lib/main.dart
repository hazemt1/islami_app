import 'package:flutter/material.dart';

import 'MyHomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: MyHomePage(title: 'Flutter Page'),
      theme: ThemeData(
        primaryColor: Color(0xFFB7935F),
        accentColor:  Color(0xFF242424),
      ),
      home: MyHomePage(title: 'Flutter Page'),

    );
  }
}
