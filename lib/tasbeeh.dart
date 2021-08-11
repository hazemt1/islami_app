import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tasbeeh extends StatefulWidget {

  static const routeName = 'Tasbeeh';

  @override
  _TasbeehState createState() => _TasbeehState();
}

class _TasbeehState extends State<Tasbeeh> {

  int tasbeehCount = 0;

  int prayerPosition = 0;

  List<String> prayers = [
    'سُبْحَانَ اللَّهِِ',
    'الحمدلله',
    'الله اكبر',
    'لا اله الا الله'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tasbeeh Page',
      home: Container(
        margin: EdgeInsets.zero,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg3.png'),
              fit: BoxFit.fill
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            Text('اسلامي', style: TextStyle(
              fontSize: 35,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none,
            ),),

            Stack(
                children: [
                  Container(
                    alignment: AlignmentDirectional.topCenter,
                    child: Image.asset('assets/images/head of seb7a.png'),),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 67, 0, 0),
                    alignment: AlignmentDirectional.center,
                    child: TextButton(
                        onPressed: clicked,
                        child: Image.asset(
                            'assets/images/body of seb7a.png')
                    ),
                  ),
                ]
            ),
            SizedBox(height: 20,),
            Text('عدد التسبيحات', style: TextStyle(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              height: .5,
              decoration: TextDecoration.none,
            ),),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(30),
                  color: Colors.amberAccent.withOpacity(.5)
              ),
              child: Text(tasbeehCount.toString(), style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),),
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(25),
                  color: Colors.black12.withOpacity(.5)
              ),
              child: Text(prayers[prayerPosition], style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),),
            )
          ],
        ),
      ),
    );
  }

  void clicked() {
    setState(() {
      tasbeehCount++;
      if (prayerPosition == prayers.length - 1) {
        tasbeehCount = 0;
        prayerPosition = 0;
      }
      if (tasbeehCount == 33) {
        tasbeehCount = 0;
        prayerPosition += 1;
        if (prayerPosition == prayers.length)
          prayerPosition = 0;
      }
    });
  }
}
