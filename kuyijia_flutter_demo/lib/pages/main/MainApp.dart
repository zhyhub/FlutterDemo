import 'package:flutter/material.dart';
import 'package:kuyijia_flutter_demo/widget/BottomNavigationPage.dart';

class MainApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainAppState();
  }
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: new Text("快易佳",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20)),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: Column(
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Image.asset(
                'images/logo/kuyijialogo.jpg',
                fit: BoxFit.contain,
                height: 400,
                width: 300,
              ),
            ),
            RawMaterialButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    new MaterialPageRoute(
                        builder: (context) => new BottomNavigationPage()),
                    (route) => route == null);
              },
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color(0xffffaa48), width: 5),
                  borderRadius: BorderRadius.circular(6.0)),
              padding: EdgeInsets.only(
                  left: 30.0, top: 10.0, right: 30.0, bottom: 10.0),
              fillColor: Color(0xffffaa48),
              child: Text("进入快易佳",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16,
                      debugLabel: "进入快易佳")),
            ),
          ],
        ),
      );
}
