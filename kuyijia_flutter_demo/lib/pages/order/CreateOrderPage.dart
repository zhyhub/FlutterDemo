import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kuyijia_flutter_demo/pages/order/AppBody.dart';

class CreateOrderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CreateOrderPageState();
  }
}

class CreateOrderPageState extends State<CreateOrderPage> {
  bool isShow = false;
  List<File> images = List();
  File _image;
  var image;
  bool isAutofocus = false;
  String inputText;

  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TextEditingController();
  }

  void _handleTapDown(TapDownDetails details) {
    Fluttertoast.showToast(
        msg: "录音按下",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white);
  }

  void _handleTapUp(TapUpDetails details) {
    Fluttertoast.showToast(
        msg: "录音放开",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white);
  }

  void _showAllImagesByCamera() async {
    Navigator.pop(context);

    image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      if (image != null) {
        images.add(image);
        isShow = false;
        print('_showAllImages ===== $images');
      }
    });
  }

  void _showAllImagesByGallery() async {
    Navigator.pop(context);

    image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (image != null) {
        images.add(image);
        isShow = false;
        print('_showAllImages ===== $images');
      }
    });
  }

  void _selectedCameraImage() async {
    Navigator.pop(context);

    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      if (image != null) {
        _image = image;
        print('camera_image ===== $_image');
      }
    });
  }

  void _selectedGalleryImage() async {
    Navigator.pop(context);

    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (image != null) {
        _image = image;
        print('gallery_image ===== $_image');
      }
    });
  }

  void _showAllImagesBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return new Container(
            height: 200,
            child: new Row(
              children: <Widget>[
                GestureDetector(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'images/icon/choose_camera.png',
                          height: 80.0,
                          width: 80.0,
                        ),
                        Container(
                          child: Text(
                            '拍照',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          margin: EdgeInsets.only(top: 10.0),
                        )
                      ],
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ),
                  onTap: _showAllImagesByCamera,
                ),
                GestureDetector(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'images/icon/choose_gallery.png',
                          height: 80.0,
                          width: 80.0,
                        ),
                        Container(
                          child: Text(
                            '相册',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          margin: EdgeInsets.only(top: 10.0),
                        )
                      ],
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ),
                  onTap: _showAllImagesByGallery,
                )
              ],
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            ),
            margin: EdgeInsets.only(left: 40.0, right: 40.0),
          );
        });
  }

  void _showModalBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return new Container(
            height: 200,
            child: new Row(
              children: <Widget>[
                GestureDetector(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'images/icon/choose_camera.png',
                          height: 80.0,
                          width: 80.0,
                        ),
                        Container(
                          child: Text(
                            '拍照',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          margin: EdgeInsets.only(top: 10.0),
                        )
                      ],
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ),
                  onTap: _selectedCameraImage,
                ),
                GestureDetector(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'images/icon/choose_gallery.png',
                          height: 80.0,
                          width: 80.0,
                        ),
                        Container(
                          child: Text(
                            '相册',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          margin: EdgeInsets.only(top: 10.0),
                        )
                      ],
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ),
                  onTap: _selectedGalleryImage,
                )
              ],
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            ),
            margin: EdgeInsets.only(left: 40.0, right: 40.0),
          );
        });
  }

  void _deleteImages(int index) {
    setState(() {
      if (images != null && images.length > 0) {
        images.removeAt(index);
        if (images.length == 0) {
          isShow = false;
        }
      }
    });
  }

  void showAlertDialog(BuildContext context, int index) {
    NavigatorState navigator =
        context.rootAncestorStateOfType(const TypeMatcher<NavigatorState>());
    debugPrint("navigator is null?" + (navigator == null).toString());

    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
                title: new Text("确定删除这张图片？"),
                content: new Text("图片删除了不能恢复！"),
                actions: <Widget>[
                  new FlatButton(
                    child: new Text("取消"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  new FlatButton(
                    child: new Text("确定"),
                    onPressed: () {
                      Navigator.of(context).pop();
                      _deleteImages(index);
                    },
                  )
                ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            tooltip: '返回上一级',
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          "新建订单",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Card(
            color: Color(0xfffafafa),
            elevation: 4,
            child: Column(
              children: <Widget>[
                Container(
                  child: Text(
                    '订单基本信息',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  width: double.infinity,
                  padding: EdgeInsets.all(20.0),
                ),
                Divider(),
                Container(
                  child: Text(
                    '订单编号 : 4qwqrq2142ijeijesfa3313',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0),
                ),
                Container(
                  child: Text(
                    '订单创建时间 : 2018-12-10 19:00',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0),
                ),
                Container(
                  child: Text(
                    '收货人电话 : 15823427797',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0),
                ),
                Container(
                  child: Text(
                    '收货人姓名 : 丶',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0),
                ),
                Container(
                  child: Text(
                    '收货人地址 : 重庆市江北区国奥村三期八栋二单元13-1',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                  width: double.infinity,
                  padding: EdgeInsets.only(
                      left: 20.0, top: 10.0, right: 20.0, bottom: 10.0),
                ),
              ],
            ),
            margin: EdgeInsets.all(20.0),
          ),
          Card(
            elevation: 4,
            color: Color(0xfffafafa),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Text(
                              'VIN上传图片',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            padding: EdgeInsets.only(
                                left: 20.0,
                                right: 20.0,
                                top: 20.0,
                                bottom: 10.0),
                          ),
                          Container(
                            child: Text(
                              '(请上传一张含有VIN号的照片，必传！)',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            padding: EdgeInsets.only(
                                left: 20.0, right: 20.0, bottom: 10.0),
                          ),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: GestureDetector(
                        child: Container(
                          child: Image.asset('images/icon/pp.png',
                              width: 30.0, height: 30.0),
                          padding: EdgeInsets.only(right: 20.0),
                        ),
                        onTap: _showModalBottomSheet,
                      ),
                      flex: 0,
                    )
                  ],
                ),
                Divider(),
                Container(
                  child: Offstage(
                    offstage: _image == null ? true : false,
                    child: _image != null ? Image.file(_image) : null,
                  ),
                  padding: EdgeInsets.all(5.0),
                  margin: EdgeInsets.all(10.0),
                )
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            margin: EdgeInsets.all(20.0),
          ),
          Card(
            elevation: 4,
            color: Color(0xfffafafa),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Text(
                              '图片上传',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            padding: EdgeInsets.only(
                                left: 20.0,
                                right: 20.0,
                                top: 20.0,
                                bottom: 10.0),
                          ),
                          Container(
                            child: Text(
                              '(上传详细图片，可多张上传，非必传！)',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            padding: EdgeInsets.only(
                                left: 20.0, right: 20.0, bottom: 10.0),
                          ),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: GestureDetector(
                        child: Container(
                          child: Image.asset('images/icon/pp.png',
                              width: 30.0, height: 30.0),
                          padding: EdgeInsets.only(right: 20.0),
                        ),
                        onTap: _showAllImagesBottomSheet,
                      ),
                      flex: 0,
                    )
                  ],
                ),
                Divider(),
                Container(
                  child: Offstage(
                    offstage: images.length == 0 ? true : false,
//                    child: images.length != 0 ? Image.file(images[0]) : null,
                    child: GridView.custom(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 4.0,
                          crossAxisSpacing: 4.0),
                      childrenDelegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return Stack(
                            children: <Widget>[
                              GestureDetector(
                                child: new Image.file(
                                  images[index],
                                  width: double.infinity,
                                ),
                                onLongPress: () {
                                  setState(() {
                                    isShow = !isShow;
                                  });
                                },
                              ),
                              Positioned(
                                child: Offstage(
                                  offstage: !isShow,
                                  child: GestureDetector(
                                    child: Image.asset(
                                      'images/icon/delete.png',
                                      width: 20.0,
                                      height: 20.0,
                                    ),
                                    onTap: () {
                                      showAlertDialog(context, index);
                                    },
                                  ),
                                ),
                                right: 5.0,
                                top: 5.0,
                              ),
                            ],
                          );
                        },
                        childCount: images.length,
                      ),
                    ),
                  ),
                  padding: EdgeInsets.all(5.0),
                  margin: EdgeInsets.all(10.0),
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            margin: EdgeInsets.all(20.0),
          ),
          Card(
            elevation: 4,
            color: Color(0xfffafafa),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Text(
                              '上传语音',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            padding: EdgeInsets.only(
                                left: 20.0,
                                right: 20.0,
                                top: 20.0,
                                bottom: 10.0),
                          ),
                          Container(
                            child: Text(
                              '(发送语音描述您的详细问题，必传！)',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            padding: EdgeInsets.only(
                                left: 20.0, right: 20.0, bottom: 10.0),
                          ),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: GestureDetector(
                        child: Container(
                          child: Image.asset('images/icon/voice.png',
                              width: 30.0, height: 30.0),
                          padding: EdgeInsets.only(right: 20.0),
                        ),
                        onTapDown: _handleTapDown,
                        onTapUp: _handleTapUp,
                      ),
                      flex: 0,
                    )
                  ],
                ),
                Divider(),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            margin: EdgeInsets.all(20.0),
          ),
          Card(
            elevation: 4,
            color: Color(0xfffafafa),
            child: Column(
              children: <Widget>[
                Container(
                  child: Text(
                    '文字描述',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  padding: EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 20.0, bottom: 10.0),
                ),
                Container(
                  child: Text(
                    '(简单描述下您的需求，非必填。)',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  padding:
                      EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
                ),
                Divider(),
                Container(
                  child: TextField(
                    autofocus: isAutofocus,
                    //是否自动获取焦点
                    cursorColor: Color(0xffffaa48),
                    controller: _controller,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 14, color: Colors.black),
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "请填写描述"),
                    onTap: () {
                      setState(() {
                        isAutofocus = !isAutofocus;
                      });
                    },
                  ),
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            margin: EdgeInsets.all(20.0),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 0,
                  child: RawMaterialButton(
                    onPressed: () {
                      print(' 撤销_controller ' + _controller.text);
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => AppBody()));
                    },
                    child: Text(
                      "撤销",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    highlightColor: Colors.red,
                    fillColor: Colors.red,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4),
                            bottomLeft: Radius.circular(4))),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: RawMaterialButton(
                    onPressed: () {
                      print(' 提交订单_controller ' + _controller.text);
                    },
                    child: Text(
                      "创建订单",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    highlightColor: Color(0xffffaa48),
                    fillColor: Color(0xffffaa48),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(4),
                            bottomRight: Radius.circular(4))),
                  ),
                ),
              ],
            ),
            margin: EdgeInsets.all(20.0),
          )
        ],
      ),
    );
  }
}

class Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: 0.5,
      width: double.infinity,
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
    );
  }
}
