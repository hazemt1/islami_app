import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:islami_app/second.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();

    //timer to navigate to the next page
    Timer(
        Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SecondScreen())));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
        fit: StackFit.expand,
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          Container(
            child: Image.asset('assets\\images\\splash_bg.png', fit: BoxFit.fill),
            height: size.height,
            width: size.width,
          ),
          new Positioned(
              bottom: size.width / 5,
              child: SpinKitRing(
                  color: Color.fromARGB(225, 210, 180, 140),
                  size: size.height / 9))
        ]);
  }
}
