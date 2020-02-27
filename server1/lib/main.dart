import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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

class User {
  final int userId;
  final String name;
  final String email;
  final String phone;
  final Map<String, dynamic> company;

  User({this.userId, this.name, this.email, this.phone, this.company});

  factory User.fromJson(Map<String, dynamic> userMap) {
    return User(
      userId: userMap['id'],
      name: userMap['name'],
      email: userMap['email'],
      phone: userMap['phone'],
      company: userMap['company'],
    );
  }
}

Future<User> fetchUser() async {
  final res = await http.get('https://jsonplaceholder.typicode.com/users/1');

  if(res.statusCode == 200){
    final userMap = json.decode(res.body);
    return User.fromJson(userMap);
  }

  throw Exception('데이터 수신 실패!');
}

class _MyHomePageState extends State<MyHomePage> {
  final style = TextStyle(fontSize: 21, height: 2.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          FutureBuilder(
            future: fetchUser(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final userId = snapshot.data.userId.toString();
                final name = snapshot.data.name;
                final email = snapshot.data.email;
                final phone = snapshot.data.phone;
                final company = snapshot.data.company;

                return Column(
                  children: <Widget>[
                    Center(child: Text(userId, style: style)),
                    Center(child: Text(name, style: style)),
                    Center(child: Text(email, style: style)),
                    Center(child: Text(phone, style: style)),
                    Center(child: Text(company['name'], style: style)),
                    Center(child: Text(company['catchPhrase'], style: style)),
                    Center(child: Text(company['bs'], style: style)),
                  ],
                );
              }
              else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return CircularProgressIndicator();
            },
          ),
        ],
      ),
    );
  }
}
