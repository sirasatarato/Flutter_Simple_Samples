import 'package:flutter/material.dart';

import 'PeopleList.dart';
import 'PeopleUpsert.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/peopleList',
      routes: <String, WidgetBuilder> {
        '/peopleList': (BuildContext ctx) => PeopleList(),
        '/peopleUpsert': (BuildContext ctx) => PeopleUpsert(),
      },
    );
  }
}