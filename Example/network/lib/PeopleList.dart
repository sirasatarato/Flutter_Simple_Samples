import 'package:flutter/material.dart';
import 'package:network/Person.dart';
import 'package:http/http.dart';

class PeopleList extends StatefulWidget {
  @override
  _PeopleListState createState() => _PeopleListState();
}

class _PeopleListState extends State<PeopleList> {
  final pipedreamRestUrl = 'https://en11y40bhgbhb3q.m.pipedream.net';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('People'),
      ),
      body: scaffolBody,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/peopleUpsert');
        },
      ),
    );
  }

  Widget get scaffolBody {
    return FutureBuilder<dynamic>(
      future: fetchPeople(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Text('Oh no! Error! ${snapshot.error}');
        }
        if (!snapshot.hasData) {
          return const Text('No people found');
        }
        final List<Person> people = Person.fromJsonArray(snapshot.data.body);
        final List<Widget> personTiles = people.map<Widget>((Person person) =>
            personWidget(person)).toList();

        return GridView.extent(
          maxCrossAxisExtent: 300,
          children: personTiles,
        );
      },
    );
  }

  Widget personWidget(Person person) {

  }

  Future<dynamic> fetchPeople() {
    final String url = '$pipedreamRestUrl/people/?pipedream_response=1';
    return get(url);
  }

  void deletePerson(Person person) {
    final String url = '$pipedreamRestUrl/people/${person.id}?pipedream_response=1';
    delete(url).then((Response res) {
      setState(() {
        print('Status code: ${res.statusCode}');
      });
    });
  }
}
