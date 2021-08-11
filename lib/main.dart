import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Screens/MyHomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(
        currentIndex: 3,
      ),
      theme: ThemeData(
        primaryColor: Color(0xFFB7935F),
        accentColor: Color(0xFF242424),
      ),
    );
  }
}
