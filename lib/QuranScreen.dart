import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:islami_app/QuranData.dart';
class QuranScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg3.png'),
            fit: BoxFit.fill
          )
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20,bottom: 3),
                  child: Text(
                      'إسلامي',
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
                        'عدد الآيات',
                        textAlign: TextAlign.center,
                      )),
                      _gridTile(Text(
                        'اسم السورة',
                        textAlign: TextAlign.center,
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
          // Navigator.push(context, MaterialPageRoute(builder: (context){
          //   return SuraDetailsScreen(soraName, index+1);
          // }));
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
