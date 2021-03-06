import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:islami_app/data/AppConfigProvider.dart';
import 'package:islami_app/data/QuranData.dart';
import 'package:islami_app/supScreens/SuraDetailsScreen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';




class QuranScreen extends StatelessWidget {

  late AppConfigProvider provider;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10,),
                child: Text(
                  AppLocalizations.of(context)!.title,
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline3
                ),
              ),
              Image(image: AssetImage('assets/images/quranImage.png')),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    _gridTile(
                        Text(
                          AppLocalizations.of(context)!.noOfVerses,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyText1
                        ),
                        context
                    ),
                    _gridTile(Text(
                      AppLocalizations.of(context)!.surahName,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1
                    ),
                        context
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  _gridTile(
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: QuranData.numberOfAyat.length,
                          itemBuilder: (context, int index) {
                            return _buttonToSora(
                                QuranData.sour[index], index, context,
                                QuranData.numberOfAyat[index]);
                          }),
                      context
                  ),
                  _gridTile(
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: QuranData.sour.length,
                          itemBuilder: (context, int index) {
                            return _buttonToSora(
                                QuranData.sour[index], index, context);
                          }),
                      context
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _gridTile(Widget widget,BuildContext context) {
  AppConfigProvider provider = Provider.of<AppConfigProvider>(context);
  return Expanded(
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: HexColor(provider.isDarkModeEnabled()?'#FACC1D':'#B7935F'),
          width: 1,
        ),
      ),
      child: Center(child: widget),
    ),
  );
}

Widget _buttonToSora(String soraName, int index,BuildContext context,[int numberOfAyat =-1]){
  return Container(
      height: 50,
      child: MaterialButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return SuraDetailsScreen(soraName, index+1);
          }));
        },
        child: Text(
          numberOfAyat==-1 ? soraName : '$numberOfAyat',
          style: Theme.of(context).textTheme.bodyText1,
          textAlign: TextAlign.center,
        ),
      ));
}
