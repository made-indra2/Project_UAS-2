import 'package:flutter/material.dart';
import 'package:project_uas/InputUser.dart';
import 'StartLauncher.dart';
import 'HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartLauncher(),
      routes: <String, WidgetBuilder>{
        '/HomeScreen' : (BuildContext context) => HomeScreen(),
      },
    );
  }
}
