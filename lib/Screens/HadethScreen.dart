import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:islamic_app/data/Hadeth.dart';
import 'package:islamic_app/supScreens/HadethDetailsScreen.dart';


class HadethScreen extends StatefulWidget {
  @override
  _HadethScreenState createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  AllHadeth allHadeth = new AllHadeth();
  _HadethScreenState() {
    loadHadethFile(allHadeth, _setState);
  }
  void _setState(Function function) {
    setState(() {
      function();
    });
    // print(hadethList.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  'إسلامي',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Image(image: AssetImage('assets/images/hadeth_logo.png')),
              Container(
                // margin: EdgeInsets.only(top: 5),
                height: 50,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: HexColor('#B7935F'), width: 2),
                    bottom: BorderSide(color: HexColor('#B7935F'), width: 2),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'الأحاديث',
                        style: TextStyle(fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: allHadeth.hadethList.length,
                itemBuilder: (context, int index) {
                  return _buttonToSora(
                      allHadeth.hadethList[index].title, index, context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buttonToSora(String hadethName, int index, BuildContext context) {
  return Container(
      height: 50,
      child: MaterialButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return HadeethDetailsScreen(index);
          }));
        },
        child: Text(
          'الحديث رقم ${index+1}',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ));
}
