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
    isDark= provider.isDarkModeEnabled();
    if(UserPreferences.getLanguage()=='en')
      subtitle='English';
    else
      subtitle='العربية';
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.settings)),
      body: buildSettingsList(),
    );
  }

  Widget buildSettingsList() {
    return SettingsList(
      sections: [
        SettingsSection(
          titlePadding: EdgeInsets.all(20),
          title: ' ',
          tiles: [
            SettingsTile(
              title: AppLocalizations.of(context)!.language,
              subtitle: subtitle,
              leading: Icon(Icons.language),
              onPressed: (BuildContext context) {
                setState(() {
                  if(UserPreferences.getLanguage()=='en') {
                    subtitle = "Arabic";
                    provider.changeLanguage('ar');
                  }
                  else{
                    subtitle="English";
                    provider.changeLanguage('en');
                  }
                });
              },
            ),
            SettingsTile.switchTile(
              title: AppLocalizations.of(context)!.themeDark,
              leading: Icon(Icons.phone_android),
              switchValue: isDark,
              onToggle: (value) {
                setState(() {
                  isDark = value;
                  provider.toggleTheme();
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
