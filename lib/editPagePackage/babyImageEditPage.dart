import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class babyImage extends StatefulWidget {
  @override
  _babyImageState createState() => _babyImageState();
}

class _babyImageState extends State<babyImage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          elevation: (8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
                'images/the-honest-company-r8Q_2nr9Rbg-unsplash.jpg'),
          ),
        ),
      ),
    );
  }
}
