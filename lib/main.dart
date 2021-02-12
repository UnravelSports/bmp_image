import 'dart:typed_data';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:bitmap/bitmap.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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

class _MyHomePageState extends State<MyHomePage> {
  Random r = Random();
  // https://pub.dev/packages/bitmap
  Uint8List getImage() {
    Uint8List bytes =
        Uint8List.fromList(List<int>.generate(10000, (i) => r.nextInt(255)));
    Bitmap bitmap = Bitmap.fromHeadless(50, 50, bytes); // Not async

    Uint8List headedBitmap = bitmap.buildHeaded();
    return headedBitmap;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Bitmap'),
      ),
      body: Center(
        child: Image.memory(getImage()),
      ),
    );
  }
}
