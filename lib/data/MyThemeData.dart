import 'package:flutter/material.dart';

class MyThemeData {
  static final lightTheme = ThemeData(
    textTheme: TextTheme(
      headline3: TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.bold
      ),
        bodyText1: TextStyle(
            color: Colors.black,
            fontSize: 23,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none
        ),
      bodyText2: TextStyle(
        fontSize: 25,
        color: Colors.white,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.none,
      ),
    ),
    iconTheme: IconThemeData(
      color: Colors.black
    ),
    primaryColor: Color(0xFFB7935F),
    accentColor: Color(0xFF242424),
  );
  static final darkTheme = ThemeData(
    textTheme: TextTheme(
      headline3: TextStyle(
        color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold
      ),
      bodyText1: TextStyle(
        color: Colors.white,
          fontSize: 23,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.none
      ),
      bodyText2: TextStyle(
        fontSize: 25,
        color: Colors.black,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.none,
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Colors.white12
    ),
    iconTheme: IconThemeData(
        color: Colors.white
    ),
    primaryColor: Color(0xFF141A2E),
    accentColor: Colors.white,
  );
}