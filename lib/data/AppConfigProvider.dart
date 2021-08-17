import 'package:flutter/material.dart';
import 'package:islami_app/data/UserPreferences.dart';

class AppConfigProvider extends ChangeNotifier {

  String currentLocale = "ar";

  void changeLanguage(String lang){
    if(currentLocale == lang)
      return;
    currentLocale =lang;
    UserPreferences.setLanguage(currentLocale);
    notifyListeners();
  }
}
