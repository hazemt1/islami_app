import 'package:flutter/material.dart';
import 'package:islami_app/data/UserPreferences.dart';

class AppConfigProvider extends ChangeNotifier {

  String currentLocale = "ar";

  ThemeMode themeMode=ThemeMode.light;

  void toggleTheme(){
    if(themeMode == ThemeMode.light)
    {
      themeMode = ThemeMode.dark;
      UserPreferences.saveThemePreference(themeMode);
    }
    else{
      themeMode = ThemeMode.light;
      UserPreferences.saveThemePreference(themeMode);
    }
    notifyListeners();
  }
  bool isDarkModeEnabled(){
    return themeMode == ThemeMode.dark;
  }

  void changeLanguage(String lang){
    if(currentLocale == lang)
      return;
    currentLocale =lang;
    UserPreferences.setLanguage(currentLocale);
    notifyListeners();
  }
}
