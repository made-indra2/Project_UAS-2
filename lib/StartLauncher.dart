import 'dart:async';
import 'TrialPage.dart';
import 'package:flutter/material.dart';

class StartLauncher extends StatefulWidget {
  @override
  _StartLauncherState createState() => _StartLauncherState();
}

class _StartLauncherState extends State<StartLauncher> {
  @override
  void initState() {
    super.initState();
    startLauncing();
  }

  @override
  void dispose() {
    super.dispose();
  }

  startLauncing() async{
    var duration = const Duration(seconds: 5);
    return Timer(duration, (){
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (buildcontext)=> TrialPage()));
      return TrialPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/Logo.png'),
          ],
        ),
      ),
    );
  }
}
