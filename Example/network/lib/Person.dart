import 'dart:convert';

class Person {
  Person() {
    name = <String, String>{};
  }

  static Person fromJson(String jsonString) {
    final Map<String, dynamic> data = jsonDecode(jsonString);
    return Person()
        ..id = data['id']
        ..name = data['name']
        ..email = data['email']
        ..imageUrl = data['imageUrl'];
  }

  static List<Person> fromJsonArray(String jsonString) {
    final Iterable<dynamic> data = jsonDecode(jsonString);
    return data.map<Person>((dynamic d) => Person()
      ..id = d['id']
      ..name = {'first':d['first'], 'last':d['last']}
      ..email = d['email']
      ..imageUrl = d['imageUrl']).toList();
  }

  int id;
  Map<String, String> name;
  String email;
  String imageUrl;
}