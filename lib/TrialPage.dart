import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 100),
        child: Center(
          child: Column(
            children: <Widget> [
              Image.asset(
                "assets/TrialLogo.png",
                width: 250,
              ),
              Container(
                child: Center(
                  child: Column(
                    children: <Widget> [
                      Text(
                        "Absen QRCode",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Center(
                  child: Column(
                    children: <Widget> [
                      Text(
                        "Absensi apapun menjadi lebih mudah hanya dengan scan QRCode",
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Center(
                  child: Column(
                    children: <Widget> [
                      Text(
                        "Meningkatkan kejujuran dan kualitas time management",
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 170),
                  child: SizedBox(
                    width: 170,
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          "Get Started",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                          ),
                        ),
                        color: Color.fromRGBO(121, 0, 255, 0.7),
                        onPressed: () {
                          Navigator.pushNamed(context, '/HomeScreen');
                        }
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}


