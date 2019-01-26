import 'package:flutter/material.dart';
import 'dart:ui';

class FrostedGlassDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: Image.network("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1548493800856&di=88a9aa8ecfcdce486ec1b1f186cc9c48&imgtype=0&src=http%3A%2F%2Fimg.alicdn.com%2Fimgextra%2Fi2%2F892927439%2FTB2ew7tvHVkpuFjSspcXXbSMVXa_%2521%2521892927439.jpg"),
          ),
          Center(
            child: ClipRect(
              // clipBehavior: ,
              // clipper: ,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0,sigmaY: 5.0),
                child: Opacity(
                  opacity: 0.5,
                  child: Container(
                    width: 500,
                    height: 700,
                    decoration: BoxDecoration(color: Colors.grey.shade200),
                    child: Center(
                      child: Text("SUSHI",style:Theme.of(context).textTheme.display4),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
