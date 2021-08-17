import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami_app/data/AppConfigProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:islami_app/data/MyThemeData.dart';

import 'Screens/MyHomePage.dart';
import 'data/UserPreferences.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return ChangeNotifierProvider(create: (context)=> AppConfigProvider(),
     builder: (context ,widget){
      final provider =Provider.of<AppConfigProvider>(context);
      provider.themeMode = UserPreferences.getThemePreference();
      return MaterialApp(
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        themeMode: provider.themeMode,
        theme: MyThemeData.lightTheme,
        darkTheme: MyThemeData.darkTheme,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
        locale: Locale.fromSubtags(languageCode: UserPreferences.getLanguage()),
        home: MyHomePage(
          currentIndex: 4,
        ),
      );
     },
    );
  }
}
