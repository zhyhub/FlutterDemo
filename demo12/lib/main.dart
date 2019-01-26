import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ToolTipDemo(),
    );
  }
}

class ToolTipDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("tool tips demo"),
      ),
      body: Center(
        child: Tooltip(
          child: Image.network(
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1548493800856&di=88a9aa8ecfcdce486ec1b1f186cc9c48&imgtype=0&src=http%3A%2F%2Fimg.alicdn.com%2Fimgextra%2Fi2%2F892927439%2FTB2ew7tvHVkpuFjSspcXXbSMVXa_%2521%2521892927439.jpg",
          ),
          message: "点击了 图片",
        ),
      ),
    );
  }
}
