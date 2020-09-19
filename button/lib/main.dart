import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Button',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'button'),
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
  var black = Colors.black;
  var message = 'How R U?';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: RaisedButton(
            child: Text(message),
            onPressed: () {
              setState(() {
                black = (black == Colors.black) ? Colors.red : Colors.black;
                message = (message == 'How R U?')
                    ? "i'm very happy with you"
                    : 'How R U?';
              });
            },
            textColor: Colors.white,
            color: black,
          ),
        ));
  }
}
