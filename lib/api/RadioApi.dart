
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:islami_app/model/RadioList.dart';

Future<RadioList> getRadioList(String locale) async{
  String url;
  if(locale=='en'){
    url='https://api.mp3quran.net/radios/radio_english.json';
  }
  else {
    url='https://api.mp3quran.net/radios/radio_arabic.json';
  }
  final response = await http.get(Uri.parse(url));

  if(response.statusCode>=200 && response.statusCode<300)
    return RadioList.fromJsonMap(jsonDecode(response.body));
  else
    throw Exception(response.body);
}