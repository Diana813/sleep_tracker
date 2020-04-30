import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';

class EditPageScaffold extends StatefulWidget {
  @override
  EditPageScaffold_State createState() => EditPageScaffold_State();
}

class EditPageScaffold_State extends State<EditPageScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Text('Sleeping Tracker',
                  style:
                      TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
            ),
            flexibleSpace: Image.asset(
              'images/appbar_background.png',
              fit: BoxFit.fill,
            ),
            backgroundColor: Colors.transparent),
        body: EditPageBody());
  }
}

class EditPageBody extends StatefulWidget {
  @override
  _EditPageBodyState createState() => _EditPageBodyState();
}

class _EditPageBodyState extends State<EditPageBody> {
  static final dateFormatter = DateFormat('dd MMMM yyyy, HH:mm');
  String dateString = dateFormatter.format(DateTime.now());
  String timeString;
  DateTime timeMinusSleepDuration;
  NumberPicker integerNumberPicker;
  int sleepDurationValueHours = 8;
  int sleepDurationValueMinutes = 0;
  bool ifHourIsChoosen;
  bool ifMinuteIsChoosen;
  int fontColorNumberSleepType = 200;
  int fontColorNumberSleepDuration = 200;
  double containerHeight;
  String dropdownValue;
  final snackBar = SnackBar(
    backgroundColor: Colors.amber[700],
    content: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Fill in all the fields, please.',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15.0,
              color: Colors.blueGrey[800],
              fontFamily: 'Comfortaa'),
        ),
      ],
    ),
  );

  void _showDialogHours() async {
    await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return new NumberPickerDialog.integer(
          title: new Text("Duration hours:"),
          minValue: 0,
          maxValue: 24,
          step: 1,
          initialIntegerValue: 0,
        );
      },
    ).then((num value) {
      if (value != null) {
        setState(() {
          ifHourIsChoosen = true;
          sleepDurationValueHours = value;
        });
        _showDialogMinutes();
        integerNumberPicker.animateInt(value);
      }
    });
  }

  void _showDialogMinutes() async {
    await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return new NumberPickerDialog.integer(
          title: new Text("Duration minutes:"),
          minValue: 0,
          maxValue: 60,
          step: 1,
          initialIntegerValue: 0,
        );
      },
    ).then((num value) {
      if (value != null) {
        setState(() {
          ifMinuteIsChoosen = true;
          sleepDurationValueMinutes = value;
        });
        integerNumberPicker.animateInt(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    containerHeight = 50.0;
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: viewportConstraints.maxHeight * 0.8,
          ),
          child: IntrinsicHeight(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //image
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      elevation: (8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                            'images/the-honest-company-r8Q_2nr9Rbg-unsplash.jpg'),
                      ),
                    ),
                  ),
                ),
                Padding(
                  child: Divider(
                    color: Colors.blueGrey[800],
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 70.0),
                ),
                //date and time
                Expanded(
                  flex: 1,
                  child: Container(
                    height: containerHeight,
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
                ),
                Padding(
                  child: Divider(
                    color: Colors.blueGrey[800],
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 70.0),
                ),
                //sleep type
                Expanded(
                  flex: 1,
                  child: Container(
                    height: containerHeight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: ListTile(
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.brightness_2,
                              color: Colors.blue[900],
                              size: 25.0,
                            ),
                          ],
                        ),
                        title: Text(
                          'Sleep type',
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[900]),
                        ),
                        subtitle: DropdownButton<String>(
                          hint: Text(
                            'Night\'s sleep, nap, etc',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.blueGrey[200],
                                fontFamily: 'Comfortaa'),
                          ),
                          value: dropdownValue,
                          icon: Icon(null),
                          underline: Container(
                            height: 0,
                          ),
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.blueGrey[fontColorNumberSleepType],
                              fontFamily: 'Comfortaa'),
                          onChanged: (String newValue) {
                            setState(() {
                              fontColorNumberSleepType = 800;
                              dropdownValue = newValue;
                            });
                          },
                          items: <String>['Night\'s sleep', 'Nap']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.blueGrey[800],
                                    fontFamily: 'Comfortaa'),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  child: Divider(
                    color: Colors.blueGrey[800],
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 70.0),
                ),
                //sleep duration
                Expanded(
                  flex: 1,
                  child: Container(
                    height: containerHeight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: ListTile(
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.schedule,
                              color: Colors.blue[900],
                              size: 25.0,
                            ),
                          ],
                        ),
                        title: Text(
                          'Sleep duration',
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[900]),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            child: Text(
                              sleepDurationValueHours.toString() +
                                  'h ' +
                                  sleepDurationValueMinutes.toString() +
                                  'min',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors
                                      .blueGrey[fontColorNumberSleepDuration],
                                  fontFamily: 'Comfortaa'),
                            ),
                            onTap: () {
                              _showDialogHours();
                              setState(() {
                                if (ifHourIsChoosen == false &&
                                    ifMinuteIsChoosen == false) {
                                  fontColorNumberSleepDuration = 200;
                                } else {
                                  fontColorNumberSleepDuration = 800;
                                }
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  child: Divider(
                    color: Colors.blueGrey[800],
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 70.0),
                ),
                //save button
                Expanded(
                  flex: 1,
                  child: Container(
                    height: containerHeight,
                    child: ButtonTheme(
                      child: ButtonBar(
                        alignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: RaisedButton(
                              onPressed: () {
                                timeMinusSleepDuration = DateTime.now()
                                    .subtract(new Duration(
                                        hours: sleepDurationValueHours,
                                        minutes: sleepDurationValueMinutes));

                                timeString = DateFormat('HH:mm')
                                    .format(timeMinusSleepDuration);

                                if (fontColorNumberSleepType != 200 &&
                                    fontColorNumberSleepDuration != 200) {
                                  final sleeppingPatternsData =
                                      SleepPatternsListItem(
                                          timeString,
                                          dropdownValue,
                                          sleepDurationValueHours.toString() +
                                              ' hour(s), ' +
                                              sleepDurationValueMinutes
                                                  .toString() +
                                              ' minute(s)');
                                  Navigator.pop(context, sleeppingPatternsData);
                                } else {
                                  Scaffold.of(context).showSnackBar(snackBar);
                                }
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(80.0)),
                              padding: EdgeInsets.all(0.0),
                              child: Ink(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.blue[600],
                                        Colors.blue[900]
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                    borderRadius: BorderRadius.circular(30.0)),
                                child: Container(
                                  constraints: BoxConstraints(
                                      maxWidth: 300.0, maxHeight: 50.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Save',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontFamily: 'Comfortaa'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class SleepPatternsListItem {
  final String dateAndTime;
  final String sleepType;
  final String sleepDuration;

  SleepPatternsListItem(this.dateAndTime, this.sleepType, this.sleepDuration);
}
