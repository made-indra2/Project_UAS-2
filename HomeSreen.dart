import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:project_uas/Scan%20QRCode.dart';
import 'Home.dart';
import 'Settings.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _bottomNavCurrentIndex = 0;
  List <Widget> _container = [
    Home(),
    ScanQRCode(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _container[_bottomNavCurrentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        color: Colors.white,
        backgroundColor: Color.fromRGBO(121, 0, 255, 0.7),
        buttonBackgroundColor: Colors.white,
        items: <Widget> [
          Icon(Icons.description),
          Icon(Icons.scanner),
          Icon(Icons.settings),
        ],
        animationDuration: Duration(
            milliseconds: 300
        ),
        animationCurve: Curves.bounceOut,
        onTap: (index){
          setState(() {
            _bottomNavCurrentIndex = index;
          });
        },
      ),
    );
  }
}
