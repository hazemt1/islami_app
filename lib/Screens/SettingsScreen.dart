import 'package:flutter/material.dart';
import 'package:islami_app/data/AppConfigProvider.dart';
import 'package:islami_app/data/UserPreferences.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDark = false;
  String subtitle = '';
  late AppConfigProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    isDark = provider.isDarkModeEnabled();
    if (UserPreferences.getLanguage() == 'en')
      subtitle = 'English';
    else
      subtitle = 'العربية';
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(
                  top: 10,
                ),
                child: Text(AppLocalizations.of(context)!.title,
                    style: Theme.of(context).textTheme.headline3),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            SettingsTile(
              title: AppLocalizations.of(context)!.language,
              titleTextStyle: Theme.of(context).textTheme.bodyText1,
              leading: Icon(
                Icons.language,
                color:
                    provider.isDarkModeEnabled() ? Colors.white : Colors.black,
              ),
              onPressed: (BuildContext context) {
                changeLanguage(context);
              },
            ),
            SettingsTile.switchTile(
              title: AppLocalizations.of(context)!.themeDark,
              titleTextStyle: Theme.of(context).textTheme.bodyText1,
              leading: Icon(
                Icons.phone_android,
                color:
                    provider.isDarkModeEnabled() ? Colors.white : Colors.black,
              ),
              switchActiveColor: Colors.red,
              switchValue: isDark,
              onToggle: (value) {
                setState(() {
                  isDark = value;
                  provider.toggleTheme();
                });
              },
            ),
          ],
        ));
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
                    setState(() {
                      provider.changeLanguage("en");
                      Navigator.pop(context);
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      "English",
                      style: TextStyle(
                        color: (provider.isDarkModeEnabled())
                            ? Colors.white
                            : Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      provider.changeLanguage("ar");
                      Navigator.pop(context);
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      "العربية",
                      style: TextStyle(
                        color: (provider.isDarkModeEnabled())
                            ? Colors.white
                            : Colors.black,
                      ),
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
