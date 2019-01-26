import 'package:flutter/material.dart';

class ImagesUtils extends StatefulWidget {
  final Object image;

  const ImagesUtils({Key key, this.image})
      : assert(image != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ImagesUtilsState();
  }
}

class _ImagesUtilsState extends State<ImagesUtils> {
  final Object image;

  _ImagesUtilsState({Key key, this.image});



  @override
  Widget build(BuildContext context) {
    return null;
  }
}
