import 'package:flutter/material.dart';
import 'package:islami_app/Screens/MyHomePage.dart';

import '../data/Hadeth.dart';

class HadeethDetailsScreen extends StatefulWidget {
  static final String ROUTE_NAME = 'Hadeeth_details';
  int pos;
  HadeethDetailsScreen(this.pos);

  @override
  _HadeethDetailsScreenState createState() => _HadeethDetailsScreenState(pos);
}

class _HadeethDetailsScreenState extends State<HadeethDetailsScreen> {
  int pos;
  AllHadeth hadeth=new AllHadeth();
  _HadeethDetailsScreenState([this.pos = 0]) {
    loadHadethFile(hadeth,_setState);
  }
  void _setState(Function function){
    setState(() {
      function();
    });
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

                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return MyHomePage(currentIndex: 2,);
                          }));


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
              Expanded(
                child: Container(
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
                                  hadeth.hadethList.length == 0 ? '' :
                                  hadeth.hadethList[pos].title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
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
                ),
              )
            ],
          )),
    );
  }

  Widget getMainView() {
    return Container(
        child: hadeth.hadethList.length == 0
            ? Center(child: CircularProgressIndicator())
            : Container(
          margin: EdgeInsets.only(top: 20, left: 5, right: 5),
          decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: Text(
            hadeth.hadethList[pos].content,
            textDirection: TextDirection.rtl,
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.start,
          ),
        ));
  }
}

