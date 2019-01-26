import 'package:flutter/material.dart';

class WrapDemo extends StatefulWidget {
  _WrapDemoState createState() => _WrapDemoState();
}

class _WrapDemoState extends State<WrapDemo> {
  List<Widget> _list;

  @override
  void initState() {
    super.initState();
    _list = List<Widget>()..add(buildAddButtom());
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Wrap流式布局"),
      ),
      body: Center(
        child: Opacity(
          opacity: 0.8,
          child: Container(
            width: _width,
            height: _height / 2,
            color: Colors.grey,
            child: Wrap(
              children: _list,
              spacing: 26,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAddButtom() {
    return GestureDetector(
      onTap: () {
        if (_list.length < 9) {
          setState(() {
            _list.insert(_list.length - 1, buildPhoto());
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          width: 80,
          height: 80,
          color: Colors.black54,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget buildPhoto() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        width: 80,
        height: 80,
        color: Colors.amber,
        child: Center(
          child: Text("照片"),
        ),
      ),
    );
  }
}
