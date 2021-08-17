import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/data/AppConfigProvider.dart';
import 'package:provider/provider.dart';

class RadioScreen extends StatelessWidget {
  late AppConfigProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text(
            AppLocalizations.of(context)!.title,
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
        Expanded(
          flex: 4,
          child: Image(image: AssetImage("assets/images/radio_icon.png")),
        ),
        Text(
          AppLocalizations.of(context)!.radioQuran,
          style: Theme.of(context).textTheme.bodyText1,
          textAlign: TextAlign.center,
        ),
        Expanded(
          flex: 2,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            InkWell(
              onTap: () {},
              child: Image(
                image: AssetImage("assets/images/metro-next.png"),
                color: (provider.isDarkModeEnabled()
                    ? Colors.amberAccent
                    : Colors.black),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Image(
                image: AssetImage("assets/images/awesome-play.png"),
                color: (provider.isDarkModeEnabled()
                    ? Colors.amberAccent
                    : Colors.black),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                child: Image(
                  image: AssetImage("assets/images/metro_right.png"),
                  color: (provider.isDarkModeEnabled()
                      ? Colors.amberAccent
                      : Colors.black),
                ),
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}
