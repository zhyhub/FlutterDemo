import 'package:flutter/material.dart';

/// 首页订单列表
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 5);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          '首页',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        bottom: new TabBar(
          tabs: <Widget>[
            new Tab(
              child: Text("新建中"),
            ),
            new Tab(
              child: Text("待报价"),
            ),
            new Tab(
              child: Text("待确认"),
            ),
            new Tab(
              child: Text("待收货"),
            ),
            new Tab(
              child: Text("完成"),
            ),
          ],
          controller: _tabController,
          labelColor: Colors.black,
          indicatorColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          new Center(
              child: new Text(
            '新建中',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )),
          new Center(
              child: new Text(
            '待报价',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )),
          new Center(
              child: new Text(
            '待确认',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )),
          new Center(
              child: new Text(
            '待收货',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )),
          new Center(
              child: new Text(
            '完成',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )),
        ],
      ),
    );
  }
}
