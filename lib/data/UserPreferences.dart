import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences{
  static late SharedPreferences _preferences;

  static const _language = 'language';

  static const _theme = 'theme';

  static const _radioStation = 'radio';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setLanguage(String language) async =>
      await _preferences.setString(_language, language);

  static String getLanguage() =>
      _preferences.getString(_language).toString();

  static Future setRadioStation(int stationIndex) async =>
      await _preferences.setString(_radioStation, stationIndex.toString());

  static int getRadioStation() => int.parse((_preferences.getString(_radioStation)??"0").toString());

  static Future saveThemePreference(ThemeMode _themeMode) async {
    String name;
    if(_themeMode == ThemeMode.light)
      name='light';
    else
      name = 'dark';
    _preferences.setString(_theme, name);
  }

  static ThemeMode getThemePreference(){
    String theme =_preferences.getString(_theme).toString();

    if(theme=='light')
      return ThemeMode.light;
    else
      return ThemeMode.dark;
  }

}