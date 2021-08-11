import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:islami_app/QuranScreen.dart';

import 'TEMP.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 3;
  final List<Widget> _children = [
    // Here the widgets should be open when the icons are clicked
    PlaceholderWidget(Colors.white),
    PlaceholderWidget(Colors.deepOrange),
    PlaceholderWidget(Colors.green),
    QuranScreen()
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

            color: HexColor('#B7935F')
          ),
          child: BottomNavigationBar(

            onTap: onTabTapped,
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                  icon: new Image.asset("assets/images/radio.png",color: _currentIndex==0?Colors.black:Colors.white,height: 25,width: 28,),
                  title: Text(_currentIndex==0?'الراديو':'',style: TextStyle(color: Colors.black),)),
              BottomNavigationBarItem(
                  icon: new Image.asset("assets/images/sebha.png",color: _currentIndex==1?Colors.black:Colors.white,height: 25,width: 28,),
                  title: Text(_currentIndex==1?'التسبيح':'',style: TextStyle(color: Colors.black),)),
              BottomNavigationBarItem(
                  icon: new Image.asset(
                      "assets/images/quran-quran-svgrepo-com.png",color: _currentIndex==2?Colors.black:Colors.white,height: 25,width: 28,),
                  title: Text(_currentIndex==2?'الأحاديث':'',style: TextStyle(color: Colors.black),)),
              BottomNavigationBarItem(
                  icon: new Image.asset("assets/images/moshaf_gold.png",color: _currentIndex==3?Colors.black:Colors.white,height: 25,width: 28,),
                  title: Text(_currentIndex==3?'القرآن':'',style: TextStyle(color: Colors.black),)),
            ],
          ),
        ),
      ),
    );
  }
}
