import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';



class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDark = true;
  String subtitle = "English";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
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
              title: 'Language',
              subtitle: subtitle,
              leading: Icon(Icons.language),
              onPressed: (BuildContext context) {
                setState(() {
                  subtitle == "English"
                      ? subtitle = "Arabic"
                      : subtitle = "English";
                });
              },
            ),
            SettingsTile.switchTile(
              title: 'Dark Theme',
              leading: Icon(Icons.phone_android),
              switchValue: isDark,
              onToggle: (value) {
                setState(() {
                  isDark = value;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
