import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var card1 = Card(
      elevation: 1,
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              "重庆市江北区",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text("sushi"),
            leading: Icon(
              Icons.account_box,
              color: Colors.lightBlue,
            ),
          ),
        ],
      ),
    );
    var card2 = Card(
      elevation: 2,
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              "重庆市江北区石马河",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text("sushisushi"),
            leading: Icon(
              Icons.account_box,
              color: Colors.lightBlue,
            ),
          ),
        ],
      ),
    );
    var card3 = Card(
      elevation: 3,
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              "重庆市江北区石马河国奥村",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text("sushisushisushi"),
            leading: Icon(
              Icons.account_box,
              color: Colors.lightBlue,
            ),
          ),
        ],
      ),
    );
    var card4 = Card(
      elevation: 4,
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              "重庆市江北区石马河国奥村三期",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text("sushisushisushisushi"),
            leading: Icon(
              Icons.account_box,
              color: Colors.lightBlue,
            ),
          ),
        ],
      ),
    );
    return MaterialApp(
      title: "Row Widget Demo",
      home: Scaffold(
          appBar: AppBar(
            title: Text("垂直方向布局"),
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                card1,
                card2,
                card3,
                card4
              ],
            ),
          )),
    );
  }
}
