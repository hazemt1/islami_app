import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:islami_app/data/AppConfig.dart';
import 'package:provider/provider.dart';

class Tasbeeh extends StatefulWidget {

  static const routeName = 'Tasbeeh';

  @override
  _TasbeehState createState() => _TasbeehState();
}

class _TasbeehState extends State<Tasbeeh> {

  int tasbeehCount = 0;
  double _myAngle =0;

  int prayerPosition = 0;

  List<String> prayers = [
    'سبحان الله',
    'الحمدلله',
    'الله اكبر',
    'لا اله الا الله'
  ];

  late AppConfig provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfig>(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 10,),
            child: Text(
              'إسلامي',
              style: Theme.of(context).textTheme.headline3
            ),
          ),
          SizedBox(height: 30,),
          Stack(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                  alignment: AlignmentDirectional.topCenter,
                  child: Image.asset('assets/images/head of seb7a.png'),),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 79, 0, 0),
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: (){
                      clicked();
                      },
                    child: Transform.rotate(
                      angle: _myAngle,
                      child: Image.asset('assets/images/body of seb7a.png'),
                    ),
                  ),
                ),
              ]
          ),

          SizedBox(height: 60,),
          Text('عدد التسبيحات', style: Theme.of(context).textTheme.bodyText1),
          SizedBox(height: 30,),
          Container(
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(30),
              color: HexColor(provider.isDarkModeEnabled()?'#141A2E':'#B7935F').withOpacity(0.57),
            ),
            child: Text(tasbeehCount.toString(), style: Theme.of(context).textTheme.bodyText1
            // TextStyle(
            //   fontSize: 25,
            //   color: Colors.black,
            //   fontWeight: FontWeight.bold,
            //   decoration: TextDecoration.none,
            // ),),
          ),
          ),
          SizedBox(height: 10,),

          Container(
            height: 60,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(25),
              color: HexColor(provider.isDarkModeEnabled()?'#FACC1D':'#B7935F'),
            ),
            child: Text(prayers[prayerPosition], style: Theme.of(context).textTheme.bodyText2),
          )
        ],
      ),
    );
  }
  rotate() async {
    for (var i = 0; i < 2; i++)
      await Future.delayed(Duration(milliseconds: 25), () {
        setState(() {
          _myAngle += 0.1;
        });
      });
  }

  void clicked() {
    rotate();
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
