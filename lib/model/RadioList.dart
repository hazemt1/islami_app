import 'package:islami_app/model/Radios.dart';

class RadioList {

  List<Radios> radios;

	RadioList.fromJsonMap(Map<String, dynamic> map): 
		radios = List<Radios>.from(map["radios"].map((it) => Radios.fromJsonMap(it)));

	getRadios()=>radios;
	
}
