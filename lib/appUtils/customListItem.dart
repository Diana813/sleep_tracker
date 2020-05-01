import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    this.leading,
    this.title,
    this.subtitle,
  });

  final String leading;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                height: 60.0,
                width: 60.0,
                color: Colors.grey[100],
                child: Center(
                  child: Text(
                    leading,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "Comfortaa",
                        fontSize: 18.0,
                        color: Colors.blueGrey[800]),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                height: 60.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _customListColumnPart(
                      title: title,
                      subtitle: subtitle,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.blueGrey[100]),
            ),
          ),
        ),
      ],
    );
  }
}

class _customListColumnPart extends StatelessWidget {
  const _customListColumnPart({
    Key key,
    this.title,
    this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
              fontFamily: "Comfortaa",
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.blue[900]),
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
        Text(
          subtitle,
          style: TextStyle(
              fontSize: 18.0,
              fontFamily: "Comfortaa",
              color: Colors.blueGrey[300]),
        ),
      ],
    );
  }
}
