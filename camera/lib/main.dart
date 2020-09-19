import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camera',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'camera'),
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
  File mPhoto;

  @override
  Widget build(BuildContext context) {
    Widget photo = (mPhoto != null) ? Image.file(mPhoto) : Text('EMPTY');

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Center(child: photo),
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                  child: Text('앨범'),
                  onPressed: () => onPhoto(ImageSource.gallery),
                ),
                RaisedButton(
                  child: Text('카메라'),
                  onPressed: () => onPhoto(ImageSource.camera),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.end,
        ),
      ),
    );
  }

  void onPhoto(ImageSource source) async {
    File f = await ImagePicker.pickImage(source: source);
    setState(() => mPhoto = f);
  }
}
