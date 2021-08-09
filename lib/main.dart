import 'package:flutter/material.dart';
import 'package:islami_app/QuranScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuranScreen(),
    );
  }
}
