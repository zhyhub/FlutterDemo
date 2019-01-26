import 'package:flutter/cupertino.dart';

class RightBackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CupertinoPageScaffold(
        child: Center(
          child: Container(
            width: 100,
            height: 100,
            color: CupertinoColors.activeBlue,
            child: CupertinoButton(
              child: Icon(CupertinoIcons.add),
              onPressed: (){
                Navigator.of(context).push(CupertinoPageRoute(builder: (BuildContext context){
                    return RightBackDemo();
                }));
              },
            ),
          ),
        ),
      ),
    );
  }
}