import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class dateAndTime extends StatefulWidget {
  @override
  _dateAndTimeState createState() => _dateAndTimeState();
}

class _dateAndTimeState extends State<dateAndTime> {
  String dateString;
  DateFormat dateFormatter;

  @override
  Widget build(BuildContext context) {
    dateFormatter = DateFormat('dd MMMM yyyy, HH:mm');
    dateString = dateFormatter.format(DateTime.now());
    return Expanded(
      flex: 1,
      child: Container(
        height: 50.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListTile(
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.date_range,
                  color: Colors.blue[900],
                  size: 25.0,
                ),
              ],
            ),
            title: Text('Date and time',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[900])),
            subtitle: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 0),
              child: Text(
                dateString,
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.blueGrey[800],
                    fontFamily: 'Comfortaa'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
