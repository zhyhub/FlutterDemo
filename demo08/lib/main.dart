import 'package:demo08/expansion_panel_list_demo.dart';
// import 'package:demo08/expansion_title_demo.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      // home: ExpansionTileDemo(),
      home: ExpansionPanelListDemo(),
    );
  }
}
