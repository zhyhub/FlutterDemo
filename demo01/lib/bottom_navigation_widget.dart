import 'package:demo01/pages/airplay_screen.dart';
import 'package:demo01/pages/home_screen.dart';
import 'package:demo01/pages/hotel_screen.dart';
import 'package:demo01/pages/menu_screen.dart';
import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatefulWidget {
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final _bottomColor = Colors.blue;
  int _currentIndex = 0;
  List<Widget> _list = List();

  @override
  void initState() {
    _list
      ..add(HomeScreen())
      ..add(HotelScreen())
      ..add(AirplayScreen())
      ..add(MenuScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: _bottomColor),
            title: Text("Home", style: TextStyle(color: _bottomColor)),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.hotel, color: _bottomColor),
              title: Text(
                "Hotel",
                style: TextStyle(color: _bottomColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.airplay, color: _bottomColor),
              title: Text(
                "Airplay",
                style: TextStyle(color: _bottomColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu, color: _bottomColor),
              title: Text(
                "Menu",
                style: TextStyle(color: _bottomColor),
              ))
        ],
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: _list[_currentIndex],
    );
  }
}
