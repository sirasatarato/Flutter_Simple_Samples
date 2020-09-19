import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Images',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'images'),
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
        body: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(5.0),
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 10.0,
          children: <Widget>[
            Image.asset(
              'img/images.png',
              fit: BoxFit.contain,
            ),
            Image.asset(
              'img/images (1).png',
              fit: BoxFit.fill,
            ),
            Image.asset(
              'img/images (2).png',
              fit: BoxFit.cover,
            ),
            Image.asset(
              'img/images (3).png',
              fit: BoxFit.fitWidth,
            ),
            Image.asset(
              'img/images (4).png',
              fit: BoxFit.fitHeight,
            ),
            Image.asset(
              'img/images.png',
              fit: BoxFit.none,
            ),
          ],
        ));
  }
}
