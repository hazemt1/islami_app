import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/AppConfigProvider.dart';
import 'package:provider/provider.dart';

class PlaceholderWidget extends StatelessWidget {
  final Color color;
  late AppConfigProvider provider;
  PlaceholderWidget(this.color);

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    return Container(

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              changeLanguage(context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 28),
              child: Text(
                AppLocalizations.of(context)!.language,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void changeLanguage(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                InkWell(
                  onTap: () {
                    provider.changeLanguage("en");
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      "English",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    provider.changeLanguage("ar");
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      "العربية",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
