import 'package:flutter/material.dart';
import 'package:kuyijia_flutter_demo/pages/home/HomePage.dart';
import 'package:kuyijia_flutter_demo/pages/order/NewOrderPage.dart';
import 'package:kuyijia_flutter_demo/pages/mine/MinePage.dart';

/// app底部导航栏
class BottomNavigationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new BottomNavigationPageState();
  }
}

class BottomNavigationPageState extends State<BottomNavigationPage> {
  int _currentIndex = 0;
  List<Widget> pages = new List();
  var tabImages;
  var appBarTitles = ['首页', '创建订单', '我的'];

  /*
   * 根据选择获得对应的normal或是press的icon
   */
  Image getTabIcon(int curIndex) {
    if (curIndex == _currentIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  /*
   * 获取bottomTab的颜色和文字
   */
  Text getTabTitle(int curIndex) {
    if (curIndex == _currentIndex) {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(
              fontWeight:FontWeight.bold,
              fontSize: 14.0, color: const Color(0xffffaa48)),);
    } else {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(
              fontWeight:FontWeight.bold,fontSize: 14.0, color: const Color(0xff515151)));
    }
  }

  /*
   * 根据image路径获取图片
   */
  Image getTabImage(path) {
    return new Image.asset(path, width: 24.0, height: 24.0);
  }

  @override
  void initState() {
    super.initState();
    tabImages = [
      [
        getTabImage('images/nav/order.png'),
        getTabImage('images/nav/order_selected.png')
      ],
      [
        getTabImage('images/nav/add.png'),
        getTabImage('images/nav/add_selected.png')
      ],
      [
        getTabImage('images/nav/mine.png'),
        getTabImage('images/nav/mine_selected.png')
      ]
    ];
    pages..add(HomePage())..add(NewOrderPage())..add(MinePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: getTabIcon(0), title: getTabTitle(0)),
          BottomNavigationBarItem(icon: getTabIcon(1), title: getTabTitle(1)),
          BottomNavigationBarItem(icon: getTabIcon(2), title: getTabTitle(2)),
        ],
        currentIndex: _currentIndex,
        onTap: (int i) {
          setState(() {
            _currentIndex = i;
          });
        },
      ),
      body: pages[_currentIndex],
    );
  }
}
