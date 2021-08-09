import 'package:flutter/material.dart';

import 'suraDetails/SuraDetailsScreen.dart';
//import 'HomeScreen.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFFB7935F),
        accentColor:  Color(0xFF242424),
      ),
      home: SuraDetailsScreen('الفاتحة',1),

    );
  }

}