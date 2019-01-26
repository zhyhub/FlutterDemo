import 'package:flutter/material.dart';
import 'package:kuyijia_flutter_demo/widget/common_weigets.dart';

/// 我的
class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MinePageState();
  }
}

class MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          '我的',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: new Center(
        child: Column(
          children: <Widget>[
            new Container(
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    'images/icon/icon_bg.png',
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    child: ClipOval(
                      child: Image.asset('images/icon/WechatIMG5.jpeg',
                          width: 60.0, height: 60.0, fit: BoxFit.fitWidth),
                    ),
                    left: 40.0,
                    top: 70.0,
                    bottom: 70.0,
                  ),
                ],
              ),
              height: 200.0,
              margin: EdgeInsets.all(0.0),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: MineTextList(0),
                    padding:
                        EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                    height: 50.0,
                    alignment: Alignment.centerLeft,
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Text(
                          '未认证',
                          style:
                              TextStyle(color: Color(0xffffaa48), fontSize: 14),
                        ),
                        Image.asset(
                          'images/icon/arrow_right.png',
                          height: 15.0,
                          width: 15.0,
                        ),
                      ],
                    ),
                    padding:
                        EdgeInsets.only(top: 10.0, bottom: 10.0, right: 10.0),
                    alignment: Alignment.centerRight,
                    height: 50.0,
                  ),
                  flex: 0,
                ),
              ],
            ),
            MyDivider(),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: MineTextList(1),
                    padding: EdgeInsets.all(10.0),
                    alignment: Alignment.centerLeft,
                    height: 50.0,
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Text(
                          '未认证',
                          style:
                              TextStyle(color: Color(0xffffaa48), fontSize: 14),
                        ),
                        Image.asset(
                          'images/icon/arrow_right.png',
                          height: 15.0,
                          width: 15.0,
                        ),
                      ],
                    ),
                    padding:
                        EdgeInsets.only(top: 10.0, bottom: 10.0, right: 10.0),
                    alignment: Alignment.centerRight,
                    height: 50.0,
                  ),
                  flex: 0,
                )
              ],
            ),
            MyDivider(),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: MineTextList(2),
                    padding: EdgeInsets.all(10.0),
                    alignment: Alignment.centerLeft,
                    height: 50.0,
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: MineImageIcon(),
                  flex: 0,
                )
              ],
            ),
            MyDivider(),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: MineTextList(3),
                    padding: EdgeInsets.all(10.0),
                    alignment: Alignment.centerLeft,
                    height: 50.0,
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: MineImageIcon(),
                  flex: 0,
                )
              ],
            ),
            MyDivider(),
          ],
        ),
      ),
    );
  }
}
