import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/Screens/QuranScreen.dart';
import 'package:islami_app/Screens/RadioScreen.dart';
import 'package:islami_app/Screens/tasbeeh.dart';

import 'package:islami_app/data/AppConfigProvider.dart';
import 'package:provider/provider.dart';

import 'HadethScreen.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'SettingsScreen.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, @required this.currentIndex=3}) : super(key: key);

  int currentIndex ;

  @override
  _MyHomePageState createState() => _MyHomePageState(currentIndex);
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState(this._currentIndex);
  int _currentIndex ;
  final List<Widget> _children = [
    // Here the widgets should be open when the icons are clicked
    SettingsScreen(),
    RadioScreen(),
    Tasbeeh(),
    HadethScreen(),
    QuranScreen(),

  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<AppConfigProvider>(context);
    return  Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage((provider.isDarkModeEnabled())?'assets/images/bg.png':'assets/images/default_bg.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: _children[_currentIndex]),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(provider.isDarkModeEnabled()
                    ? 'assets/images/Rectangle 2.png'
                    : 'assets/images/Rectangle.png'),
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
                color: _currentIndex == 0
                    ? (provider.isDarkModeEnabled()
                        ? Colors.amberAccent
                        : Colors.black)
                    : Colors.white,
                height: 25,
                width: 28,
              ),
              title: Text(
                _currentIndex == 0 ? AppLocalizations.of(context)!.radio : '',
                style: TextStyle(
                  color: (provider.isDarkModeEnabled()
                      ? Colors.amberAccent
                      : Colors.black),
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: new Image.asset(
                "assets/images/sebha.png",
                color: _currentIndex == 1
                    ? (provider.isDarkModeEnabled()
                        ? Colors.amberAccent
                        : Colors.black)
                    : Colors.white,
                height: 25,
                width: 28,
              ),
              title: Text(
                _currentIndex == 1 ? AppLocalizations.of(context)!.tasabeh : '',
                style: TextStyle(
                  color: (provider.isDarkModeEnabled()
                      ? Colors.amberAccent
                      : Colors.black),
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: new Image.asset(
                "assets/images/quran-quran-svgrepo-com.png",
                color: _currentIndex == 2
                    ? (provider.isDarkModeEnabled()
                        ? Colors.amberAccent
                        : Colors.black)
                    : Colors.white,
                height: 25,
                width: 28,
              ),
              title: Text(
                _currentIndex == 2 ? AppLocalizations.of(context)!.hadith : '',
                style: TextStyle(
                  color: (provider.isDarkModeEnabled()
                      ? Colors.amberAccent
                      : Colors.black),
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: new Image.asset(
                "assets/images/moshaf_gold.png",
                color: _currentIndex == 3
                    ? (provider.isDarkModeEnabled()
                        ? Colors.amberAccent
                        : Colors.black)
                    : Colors.white,
                height: 25,
                width: 28,
              ),
              title: Text(
                _currentIndex == 3 ? 'القرآن' : '',
                style: TextStyle(
                  color: (provider.isDarkModeEnabled()
                      ? Colors.amberAccent
                      : Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
