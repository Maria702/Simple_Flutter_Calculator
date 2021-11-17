import 'dart:async';
import 'package:calculator/calculator.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Calculator())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Center(
            child: Container(
              width: 250,
              height: 250,
              child: CircleAvatar(
                radius: 80,
                backgroundColor: Colors.white,
                child: Image.asset(
                  "assets/bg1.png",
                ),
              ),
            ),
          ),
          Positioned(
            left: 100,
            bottom: 150,
            child: Center(
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "CALCULATOR",
                      style: new TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                        shadows: [
                          Shadow(
                            blurRadius: 10.0,
                            color: Colors.blue,
                            offset: Offset(5.0, 5.0),
                          ),
                          Shadow(
                            color: Colors.red,
                            blurRadius: 10.0,
                            offset: Offset(-5.0, 5.0),
                          ),
                        ],
                        decoration: TextDecoration.none,
                        decorationColor: Colors.black,
                        decorationStyle: TextDecorationStyle.solid,
                        letterSpacing: -1.0,
                        wordSpacing: 5.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
