import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:islami_app/data/QuranData.dart';
import 'package:islami_app/supScreens/SuraDetailsScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';




class QuranScreen extends StatelessWidget {

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
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Image(image: AssetImage('assets/images/quranImage.png')),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    _gridTile(Text(
                      AppLocalizations.of(context)!.noOfVerses,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25
                      ),
                    )),
                    _gridTile(Text(
                      AppLocalizations.of(context)!.surahName,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 25
                      ),
                    )),
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
                          return _buttonToSora(QuranData.sour[index], index, context,QuranData.numberOfAyat[index]);
                        }),
                  ),
                  _gridTile(
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: QuranData.sour.length,
                        itemBuilder: (context, int index) {
                          return _buttonToSora(QuranData.sour[index], index, context);

                        }),
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

Widget _gridTile(Widget widget) {
  return Expanded(
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: HexColor('#B7935F'),
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
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
          ),
          textAlign: TextAlign.center,
        ),
      ));
}
