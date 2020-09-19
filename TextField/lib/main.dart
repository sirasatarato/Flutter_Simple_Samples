import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TextField',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'text field'),
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
  var saveText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(hintText: '써봐'),
                  onChanged: (String str) {
                    setState(() {
                      saveText = str;
                    });
                  },
                ),
                padding: EdgeInsets.only(top: 10, bottom: 10),
                width: 300,
              ),
              Container(
                child: Text(
                  saveText,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 44),
                ),
                padding: EdgeInsets.only(top: 10, bottom: 10),
                width: 300,
              ),
            ],
          ),
        ));
  }
}
