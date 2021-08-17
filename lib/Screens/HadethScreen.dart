import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:islami_app/data/AppConfig.dart';
import 'package:islami_app/data/Hadeth.dart';
import 'package:islami_app/supScreens/HadethDetailsScreen.dart';
import 'package:provider/provider.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
  late AppConfig provider;
  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<AppConfig>(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  AppLocalizations.of(context)!.title,
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              Image(image: AssetImage('assets/images/hadeth_logo.png')),
              Container(
                // margin: EdgeInsets.only(top: 5),
                height: 50,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: HexColor(provider.isDarkModeEnabled()?'#FACC1D':'#B7935F'), width: 2), //#FACC1D
                    bottom: BorderSide(color: HexColor(provider.isDarkModeEnabled()?'#FACC1D':'#B7935F'), width: 2),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        AppLocalizations.of(context)!.hadith,
                        style: Theme.of(context).textTheme.bodyText1,
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
          '${AppLocalizations.of(context)!.hadethNo} ${index+1}',
          style: Theme.of(context).textTheme.bodyText1,
          textAlign: TextAlign.center,
        ),
      ));
}
