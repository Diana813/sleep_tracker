import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sleeptracker/welcomePagePackage/welcomeScreen.dart';

void main() {
  runApp(SleepTracker());
}

class SleepTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60.0),
              child: Text('Sleep Tracker',
                  style:
                      TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
            ),
            flexibleSpace: Image.asset(
              'images/appbar_background.png',
              fit: BoxFit.fill,
            ),
            backgroundColor: Colors.transparent),
        body: WelcomeScreen(),
      ),
    );
  }
}
