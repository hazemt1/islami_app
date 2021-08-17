import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfig extends ChangeNotifier{

  ThemeMode themeMode=ThemeMode.light;

  void toggleTheme(){
    if(themeMode == ThemeMode.light)
      {
        themeMode = ThemeMode.dark;
        saveName(themeMode);
      }
    else{
      themeMode = ThemeMode.light;
      saveName(themeMode);
    }
    notifyListeners();
  }
  bool isDarkModeEnabled(){
    return themeMode == ThemeMode.dark;
  }

  void saveName(ThemeMode themeMode) {
    saveThemePreference(themeMode).then((value) => themeMode);
  }
}

//Shared Preference Save
saveThemePreference(ThemeMode _themeMode) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String name;
  if(_themeMode == ThemeMode.light)
    name='light';
  else
    name = 'dark';
  preferences.setString('theme', name);
}


