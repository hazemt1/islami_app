import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Rectangle.png'),
                fit: BoxFit.cover),
          ),
          child: BottomNavigationBar(
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
