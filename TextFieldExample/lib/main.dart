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
  String userName = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Builder(
        builder: (context) => Center(
          child: Column(
            children: <Widget>[
              makeRowContainer('아이디', true),
              makeRowContainer('비밀번호', false),
              Container(
                child: RaisedButton(
                    child: Text('로그인', style: TextStyle(fontSize: 21)),
                    onPressed: () {
                      if (userName == 'dart' && password == 'flutter') {
                        setState(() {
                          userName = '';
                          password = '';
                        });
                      } else
                        Scaffold.of(context)
                          ..removeCurrentSnackBar()
                          ..showSnackBar(
                              SnackBar(content: Text('일치하지 않습니다!!')));
                    }),
                margin: EdgeInsets.only(top: 12),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
    );
  }

  Widget makeRowContainer(String title, bool isUserName) {
    return Container(
      child: Row(
        children: <Widget>[
          makeText(title),
          makeTextField(isUserName),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
      padding: EdgeInsets.only(left: 60, right: 60, top: 8, bottom: 8),
    );
  }

  Widget makeText(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 21,
      ),
    );
  }

  Widget makeTextField(bool isUserName) {
    return Container(
      child: TextField(
        controller: TextEditingController(),
        style: TextStyle(fontSize: 21, color: Colors.black),
        textAlign: TextAlign.center,
        onChanged: (String str) {
          if (isUserName)
            userName = str;
          else
            password = str;
        },
      ),
      width: 200,
      padding: EdgeInsets.only(left: 16),
    );
  }
}
