import 'package:flutter/material.dart';
import 'package:kuyijia_flutter_demo/pages/order/CreateOrderPage.dart';
import 'package:url_launcher/url_launcher.dart';

/// 新建订单
class NewOrderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new NewOrderPageState();
  }
}

class NewOrderPageState extends State<NewOrderPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          '创建订单',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[AppOrderWidget(), PhoneOrderWidget()],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}

class AppOrderWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppOrderWidgetState();
  }
}

class _AppOrderWidgetState extends State<AppOrderWidget> {
  void _routeToNewOrder() {
    print("点击了");
    Navigator.push(context, new MaterialPageRoute(builder: (context) => CreateOrderPage()));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Column(
          children: <Widget>[
            Image.asset(
              'images/icon/NewOrder.png',
              height: 100.0,
              width: 100.0,
            ),
            Text(
              'App下单',
              style: TextStyle(color: Color(0xff20bbc5)),
            ),
          ],
        ),
      ),
      onTap: _routeToNewOrder,
    );
  }
}

class PhoneOrderWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PhoneOrderWidgetState();
  }
}

class _PhoneOrderWidgetState extends State<PhoneOrderWidget> {

  void _makePhoneCall() async {
    String url = "tel:15823427797";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Text('电话下单', style: TextStyle(color: Color(0xffcccccc))),
        margin: EdgeInsets.only(top: 50.0),
      ),
      onTap: _makePhoneCall,
    );
  }
}
