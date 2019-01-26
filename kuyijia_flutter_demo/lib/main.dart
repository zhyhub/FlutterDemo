import 'package:flutter/material.dart';
import 'package:kuyijia_flutter_demo/pages/main/MainApp.dart';

/// 这里直接用MaterialApp包裹，后面有用到Navigator.push的时候context要求把Scaffold独立出widget出来
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 245, 165, 55),
      ),
      home: MainApp(),
    );
  }
}
