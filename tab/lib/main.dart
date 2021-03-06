import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tab',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'tab'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final choices = ['AMERICA', 'ASIA', 'EUROPE', 'AFRICA', 'OCEANIA'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: choices.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            bottom: TabBar(
              tabs: choices.map((String choice) {
                return Tab(text: choice);
              }).toList(),
              isScrollable: true,
            ),
          ),
          body: TabBarView(
            children: choices.map((String choice) {
              return Center(
                child: Text(
                  choice,
                  style: TextStyle(fontSize: 31),
                ),
              );
            }).toList(),
          ),
        ));
  }
}
