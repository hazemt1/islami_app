import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/Screens/QuranScreen.dart';
import 'package:islami_app/Screens/tasbeeh.dart';
import 'HadethScreen.dart';

import '../data/TEMP.dart';
import 'SettingsScreen.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, @required this.currentIndex = 3}) : super(key: key);

  int currentIndex;

  @override
  _MyHomePageState createState() => _MyHomePageState(currentIndex);
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState(this._currentIndex);

  int _currentIndex;

  final List<Widget> _children = [
    // Here the widgets should be open when the icons are clicked
    PlaceholderWidget(Colors.white),
    Tasbeeh(),
    HadethScreen(),
    QuranScreen(),
    SettingsScreen()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/default_bg.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: _children[_currentIndex]),
      bottomNavigationBar: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/Rectangle.png'),
                  fit: BoxFit.fill)),
          child: BottomNavigationBar(
              onTap: onTabTapped,
              currentIndex: _currentIndex,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              elevation: 0,
              items: [
                BottomNavigationBarItem(
                    icon: new Image.asset(
                      "assets/images/radio.png",
                      color: _currentIndex == 0 ? Colors.black : Colors.white,
                      height: 25,
                      width: 28,
                    ),
                    title: Text(
                      _currentIndex == 0 ? 'الراديو' : '',
                      style: TextStyle(color: Colors.black),
                    )),
                BottomNavigationBarItem(
                    icon: new Image.asset(
                      "assets/images/sebha.png",
                      color: _currentIndex == 1 ? Colors.black : Colors.white,
                      height: 25,
                      width: 28,
                    ),
                    title: Text(
                      _currentIndex == 1 ? 'التسبيح' : '',
                      style: TextStyle(color: Colors.black),
                    )),
                BottomNavigationBarItem(
                    icon: new Image.asset(
                      "assets/images/quran-quran-svgrepo-com.png",
                      color: _currentIndex == 2 ? Colors.black : Colors.white,
                      height: 25,
                      width: 28,
                    ),
                    title: Text(
                      _currentIndex == 2 ? 'الأحاديث' : '',
                      style: TextStyle(color: Colors.black),
                    )),
                BottomNavigationBarItem(
                    icon: new Image.asset(
                      "assets/images/moshaf_gold.png",
                      color: _currentIndex == 3 ? Colors.black : Colors.white,
                      height: 25,
                      width: 28,
                    ),
                    title: Text(
                      _currentIndex == 3 ? 'القرآن' : '',
                      style: TextStyle(color: Colors.black),
                    )),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    title: Text(
                      _currentIndex == 4 ? 'Settings' : '',
                      style: TextStyle(color: Colors.black),
                    ))
              ])),
    );
  }
}
