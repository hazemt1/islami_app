import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/api/RadioApi.dart';
import 'package:islami_app/data/AppConfigProvider.dart';
import 'package:islami_app/data/RadioService.dart';
import 'package:islami_app/model/RadioList.dart';
import 'package:provider/provider.dart';

class RadioScreen extends StatefulWidget {
  @override
  _RadioScreenState createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  late AppConfigProvider provider;

  late Future<RadioList> radioList;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    radioList = getRadioList(provider.currentLocale);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
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
            child: FutureBuilder<RadioList>(
    future: radioList,
    builder: (context, snapShot) {
      if (snapShot.hasData) {
        return RadioService(snapShot.data!.radios);
      } else {
        return Center(
          child: CircularProgressIndicator(color:(provider.isDarkModeEnabled()
              ? Colors.amberAccent
              : Colors.black) ,),
        );
      }
    },),

          ),
        ],
      ),
    );
  }
}
