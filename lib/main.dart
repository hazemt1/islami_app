import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/data/AppConfig.dart';
import 'package:islami_app/data/MyThemeData.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'Screens/MyHomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  //Shared Preference
  // getThemePreference() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   var name = preferences.getString('theme');
  //   return name;
  // }
  //
  // String kind='';
  // @override
  // void initState() {
  //   kind = getThemePreference().toString();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return ChangeNotifierProvider(create: (buildContext) => AppConfig(),
    builder: (buildContext,widget){
      final provider = Provider.of<AppConfig>(buildContext);
      // if(kind == 'light')
      //   provider.themeMode=ThemeMode.light;
      // else
      //   provider.themeMode = ThemeMode.dark;

      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(
          currentIndex: 3,
        ),
        themeMode: provider.themeMode,
        theme: MyThemeData.lightTheme,
        darkTheme: MyThemeData.darkTheme,
      );
    }
    );
  }
}
