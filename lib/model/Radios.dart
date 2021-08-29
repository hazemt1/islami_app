
class Radios {

  String name;
  String radioUrl;

	Radios.fromJsonMap(Map<String, dynamic> map):
		name = map["name"],
		radioUrl = map["radio_url"];

}
