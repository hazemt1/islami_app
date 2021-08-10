import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'TEMP.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    // Here the widgets should be open when the icons are clicked
    PlaceholderWidget(Colors.white),
    PlaceholderWidget(Colors.deepOrange),
    PlaceholderWidget(Colors.green),
    PlaceholderWidget(Colors.blue)
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Rectangle.png'),
                fit: BoxFit.cover),
          ),
          child: BottomNavigationBar(
            onTap: onTabTapped,
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                  icon: new Image.asset("assets/images/radio.png"),
                  title: new Container(height: 0.0)),
              BottomNavigationBarItem(
                  icon: new Image.asset("assets/images/sebha.png"),
                  title: new Container(height: 0.0)),
              BottomNavigationBarItem(
                  icon: new Image.asset(
                      "assets/images/quran-quran-svgrepo-com.png"),
                  title: new Container(height: 0.0)),
              BottomNavigationBarItem(
                  icon: new Image.asset("assets/images/quran.png"),
                  title: new Container(height: 0.0)),
            ],
          ),
        ),
      ),
    );
  }
}
