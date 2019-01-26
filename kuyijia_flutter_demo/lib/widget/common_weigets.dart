import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff999999),
      height: 0.3,
      width: double.infinity,
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
    );
  }
}

class MineTextList extends StatefulWidget {
  final int index;

  const MineTextList(this.index);

  @override
  State<StatefulWidget> createState() {
    return _MineTextListState();
  }
}

class _MineTextListState extends State<MineTextList> {
  var titles = ['电话认证/修改', '公司认证', '关于我们', '联系客服'];

  @override
  Widget build(BuildContext context) {
    return Text(
      titles[widget.index],
      style: TextStyle(color: Colors.black, fontSize: 14),
    );
  }
}

class MineImageIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        'images/icon/arrow_right.png',
        height: 15.0,
        width: 15.0,
      ),
      padding: EdgeInsets.only(right: 10.0),
    );
  }
}
