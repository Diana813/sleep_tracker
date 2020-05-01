import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class moonIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      child: CircleAvatar(
        radius: 30.0,
        backgroundColor: Colors.amber[200],
        child: Icon(
          Icons.brightness_2,
          color: Colors.white,
          size: 30.0,
        ),
      ),
    );
  }
}
