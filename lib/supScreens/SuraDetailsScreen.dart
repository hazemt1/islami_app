import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:islami_app/Screens/MyHomePage.dart';
import 'package:islami_app/data/AppConfigProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


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
  late AppConfigProvider provider;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppConfigProvider>(context);
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage((provider.isDarkModeEnabled())
                      ? 'assets/images/bg.png'
                      : 'assets/images/default_bg.png'),
                  fit: BoxFit.fill)),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return MyHomePage(currentIndex: 3,);
                            }));
                      },
                      child: Icon(Icons.arrow_back_outlined),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 50.0),
                      child: Text(
                        AppLocalizations.of(context)!.title,
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline3,
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
                      color: HexColor(provider.isDarkModeEnabled()?'#141A2E':'#FFFFFF').withOpacity(0.80)),
                  margin: EdgeInsets.only(
                      top: 50, left: 20, right: 20, bottom: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          // padding: EdgeInsets.symmetric(horizontal: 10),
                          margin: EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                // margin: EdgeInsets.only(left: 30),
                                child: Text(
                                  'سورة ' + widget.soraName,
                                  textAlign: TextAlign.center,
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .bodyText1,
                                ),
                              ),

                              Container(
                                // width: 40,
                                child: MaterialButton(
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                          return MyHomePage(currentIndex: 3,);
                                        }));
                                  },
                                  child: Icon(
                                    CupertinoIcons
                                        .arrowtriangle_right_circle_fill,
                                    color: Colors.black,
                                  ),
                                ),
                              )

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
    AppConfigProvider provider = Provider.of<AppConfigProvider>(context);
    return Container(
        child: Sora.length == 0
            ? Center(child: CircularProgressIndicator())
            : Container(
          margin: EdgeInsets.only(top: 20, left: 5, right: 5),
          decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: Text(
            Sora,
            textDirection: TextDirection.rtl,
            style: TextStyle(fontSize: 20,
                color: provider.isDarkModeEnabled()?Colors.white:Colors.black
            ),
            textAlign: TextAlign.start,
          ),
        ));
  }

  String Sora = '';
  void readSuraContent(String fileName) async {
    String fileContent = await rootBundle.loadString(fileName);
    List<String> lines = fileContent.split('\n');
    setState(() {
      for (int i = 0; i < lines.length; i++) {
        Sora += lines[i] + '(${i + 1})';
      }
    });
  }
}
