import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RadioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                AppLocalizations.of(context)!.title,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              flex: 4,
              child: Image(
                  image: AssetImage("assets/images/radio_icon.png")),
            ),
            Text(
              AppLocalizations.of(context)!.radioQuran,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'ELMessiri',
                fontSize: 23,
              ),
              textAlign: TextAlign.center,
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                InkWell(
                  onTap: (){},
                    child: Image(image: AssetImage("assets/images/metro-next.png"))),
                InkWell(
                  onTap: (){},
                    child: Image(image: AssetImage("assets/images/awesome-play.png"))),
                InkWell(
                  onTap: (){},
                    child: Container(child: Image(image: AssetImage("assets/images/metro_right.png")))),
              ]),
            ),

          ]),
    );
  }
}