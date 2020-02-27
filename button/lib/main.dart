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
  var c = Colors.black;
  var t = 'How R U?';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: RaisedButton(
          child: Text(t),
          onPressed: (){
            setState(() {
              c = (c == Colors.black) ? Colors.red : Colors.black;
              t = (t == 'How R U?') ? "i'm very happy with you": 'How R U?';
            });
          },
          textColor: Colors.white,
          color: c,
        ),
      )
    );
  }
}
