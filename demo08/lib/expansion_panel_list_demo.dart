import 'package:flutter/material.dart';

class ExpansionPanelListDemo extends StatefulWidget {
  _ExpansionPanelListDemoState createState() => _ExpansionPanelListDemoState();
}

class _ExpansionPanelListDemoState extends State<ExpansionPanelListDemo> {
  List<int> _mList;
  List<ExpansionStateBean> _expansionStateList;

  _ExpansionPanelListDemoState() {
    _mList = List();
    _expansionStateList = List<ExpansionStateBean>();
    for (int i = 0; i < 10; i++) {
      _mList.add(i);
      _expansionStateList.add(ExpansionStateBean(i, false));
    }
  }

  _setCurrent(int index, bool isExpanded) {
    setState(() {
      _expansionStateList.forEach((item) {
        if (item._index == index) {
          item._isOpen = !isExpanded;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("expansion panel list"),
      ),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (index, isExpanded) {
            _setCurrent(index, isExpanded);
          },
          children: _mList.map((index) {
            return ExpansionPanel(
                headerBuilder: (context, isExpanded) {
                  return ListTile(
                    title: Text("This is No.$index"),
                  );
                },
                body: ListTile(
                  title: Text("expansion No.$index"),
                ),
                isExpanded: _expansionStateList[index]._isOpen);
          }).toList(),
        ),
      ),
    );
  }
}

class ExpansionStateBean {
  var _isOpen;
  var _index;

  ExpansionStateBean(this._index,this._isOpen);
}
