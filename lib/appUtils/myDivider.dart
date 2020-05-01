import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class myDivider extends StatefulWidget {
  @override
  _myDividerState createState() => _myDividerState();
}

class _myDividerState extends State<myDivider> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      child: Divider(
        color: Colors.blueGrey[800],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 70.0),
    );
  }
}
