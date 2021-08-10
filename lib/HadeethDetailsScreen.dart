import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HadeethDetailsScreen extends StatefulWidget {
  static final String ROUTE_NAME = 'Hadeeth_details';
  int pos;
  HadeethDetailsScreen(this.pos);

  @override
  _HadeethDetailsScreenState createState() => _HadeethDetailsScreenState(pos);
}

class _HadeethDetailsScreenState extends State<HadeethDetailsScreen> {
  int pos;
  _HadeethDetailsScreenState([this.pos=0]) {
    loadHadethFile();
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
                                hadethList.length==0? '':
                                hadethList[pos].title,
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
              )
            ],
          )),
    );

  }

  Widget getMainView() {
    return Container(
        child: hadethList.length== 0
            ? Center(child: CircularProgressIndicator())
            : Container(
          margin: EdgeInsets.only(top: 20,left: 5,right: 5),
          decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: Text(
            hadethList[pos].content
            ,
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.end,
          ),
        ));
  }
  List<Hadeth> hadethList = [];

  void loadHadethFile()async{
    List<Hadeth> list= [];
    String fileContent = await rootBundle.loadString('assets/content/ahadeth.txt');
    // line splitter -- \n -- \r\n
    List<String> allHadethConent = fileContent.split('#\n');
    print(allHadethConent.length);
    for(int i=0;i<allHadethConent.length;i++){
      String hadethContent = allHadethConent[i];
      List<String> hadethLines = hadethContent.split('\n');
      String title = hadethLines[0];// title
      String content = '';
      for(int j =1;j<hadethLines.length;j++){
        content = content+ ' '+hadethLines[j];
      }
      Hadeth hadeth = Hadeth(title, content);
      list.add(hadeth);
    }

    setState(() {
      hadethList=list;
    });
  }
  }
class Hadeth {
  String title;
  String content;

  Hadeth(this.title, this.content);
}

