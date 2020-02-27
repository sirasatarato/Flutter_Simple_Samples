import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          makeRow(left: "X", middle: "O", right: "X"),
          makeRow(left: "O", middle: "X", right: "O"),
          makeRow(left: "X", middle: "O", right: "X")
        ],
      )
    );
  }

  Widget makeRow({String left, String middle, String right}) {
    return Row(
      children: <Widget>[
        makeText(left, width: 100, height: 100),
        makeText(middle, width: 100, height: 100),
        makeText(right, width: 100, height: 100),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );

  }

  Widget makeText(String title, {double width, double height}) {
    return Container(
      child: Center(child: Text(title, style: TextStyle(fontSize: 23.0),),),
      width: width,
      height: height,
      decoration: BoxDecoration(color: Colors.red[300]),
      margin: EdgeInsets.all(10.0),
    );
  }
}
