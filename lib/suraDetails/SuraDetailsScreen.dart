import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SuraDetailsScreen extends StatefulWidget {
  static final String ROUTE_NAME = 'sura_details';
  String soraName;
  int pos;
  SuraDetailsScreen(this.soraName, this.pos);

  @override
  _SuraDetailsScreenState createState() => _SuraDetailsScreenState(pos);
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  _SuraDetailsScreenState(int pos) {
    readSuraContent('assets/content/${pos}.txt');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/default_bg.png'),
                  fit: BoxFit.fill)),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    child: MaterialButton(
                      onPressed: () {
                        /*
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return QuranScreen();
                          }));

                         */
                      },
                      child: Icon(Icons.arrow_back_outlined),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 50.0),
                      child: Text(
                        'إسلامي',
                        style: TextStyle(fontSize: 30, color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
              Container(
                height: 590,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white.withOpacity(0.7)),
                margin: EdgeInsets.only(top: 50, left: 20, right: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: 220,
                        margin: EdgeInsets.all(20),
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 30),
                              child: Text(
                                'سورة ' + widget.soraName,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            Container(
                              width: 40,
                              child: MaterialButton(onPressed: (){
                                /*
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return QuranScreen();
                          }));

                         */
                              },
                                child: Icon(CupertinoIcons.arrowtriangle_right_circle_fill,color: Colors.black,),
                              ),
                            )
                            //Icon(Icons)
                          ],
                        ),
                        decoration: BoxDecoration(
                            border: Border(
                          bottom:
                              BorderSide(color: Color(0xFFB7935F), width: 1),
                        )),
                      ),
                      getMainView(),
                    ],
                  ),
                ),
              )
            ],
          )),
    );

  }

  Widget getMainView() {
    return Container(
        child: Sora.length == 0
            ? Center(child: CircularProgressIndicator())
            : Container(
                margin: EdgeInsets.only(top: 20,left: 5,right: 5),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8)),
                child: Text(
                  Sora,
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.end,
                ),
              ));
  }

  String Sora = '';
  void readSuraContent(String fileName) async {
    // Future => async programming
    String fileContent = await rootBundle.loadString(fileName);
    List<String> lines = fileContent.split('\n');
    setState(() {
      for (int i = 0; i < lines.length; i++) {
        Sora += lines[i] + '(${i + 1})';
      }
    });
    print(lines.length);
  }
}
