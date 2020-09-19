import 'package:flutter/material.dart';

import 'FirstPage.dart';
import 'SecondPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstStatefulPage(),
      routes: {
        '/first': (context) => FirstStatefulPage(),
        '/second': (context) => SecondStatefulPage()
      },
    );
  }
}