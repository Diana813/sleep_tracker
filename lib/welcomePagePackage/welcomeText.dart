import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class welcomeText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      child: Text(
          'Get to know your baby\'s sleep patterns and keep track of how much sleep they are getting here.',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20.0,
              color: Colors.blueGrey[300],
              fontFamily: 'Comfortaa')),
    );
  }
}
