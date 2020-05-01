import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:sleeptracker/appUtils/listItem.dart';
import 'package:sleeptracker/appUtils/myDivider.dart';
import 'package:sleeptracker/editPagePackage/babyImageEditPage.dart';

import 'dateAndTimeEditPage.dart';

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
  EditPageBodyState createState() => EditPageBodyState();
}

class EditPageBodyState extends State<EditPageBody> {
  bool ifMinuteIsChoosen;
  bool ifHourIsChoosen;
  NumberPicker integerNumberPicker;
  int sleepDurationHours;
  int sleepDurationMinutes;
  int fontColorSleepDuration = 200;
  String dropdownValueSleepType;
  int fontColorSleepType = 200;
  NumberPicker numberPicker;

  @override
  Widget build(BuildContext context) {
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
                  babyImage(),
                  myDivider(),
                  dateAndTime(),
                  myDivider(),
                  //sleepType
                  Expanded(
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
                            value: dropdownValueSleepType,
                            icon: Icon(null),
                            underline: Container(
                              height: 0,
                            ),
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.blueGrey[fontColorSleepType],
                                fontFamily: 'Comfortaa'),
                            onChanged: (String newValue) {
                              setState(() {
                                setSleepType(newValue);
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
                  myDivider(),
                  //sleepDuration
                  Expanded(
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
                                createDurationMessage(),
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color:
                                        Colors.blueGrey[fontColorSleepDuration],
                                    fontFamily: 'Comfortaa'),
                              ),
                              onTap: () {
                                showDialogHours();
                                setState(() {
                                  setSleepDuration();
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  myDivider(),
                  //button
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 50.0,
                      child: ButtonTheme(
                        child: ButtonBar(
                          alignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: RaisedButton(
                                onPressed: () {
                                  setButtonOnClickListener();
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
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
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
      },
    );
  }

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

  void setButtonOnClickListener() {
    String timeString;
    DateTime timeMinusSleepDuration;

    if(sleepDurationHours != null && sleepDurationMinutes != null){
      timeMinusSleepDuration = DateTime.now().subtract(
          new Duration(hours: sleepDurationHours, minutes: sleepDurationMinutes));

      timeString = DateFormat('HH:mm').format(timeMinusSleepDuration);
    }

    if (fontColorSleepType != 200 && fontColorSleepDuration != 200) {
      final sleeppingPatternsData = SleepPatternsListItem(
          timeString, dropdownValueSleepType, createDurationMessage());
      Navigator.pop(context, sleeppingPatternsData);
    } else {
      Scaffold.of(context).showSnackBar(snackBar);
    }
  }

  void showDialogHours() async {
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
          sleepDurationHours = value;
        });
        showDialogMinutes();
        numberPicker.animateInt(value);
      }
    });
  }

  void showDialogMinutes() async {
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
          sleepDurationMinutes = value;
          setSleepDuration();
        });
        numberPicker.animateInt(value);
      }
    });
  }

  String createDurationMessage() {
    if (sleepDurationHours != null && sleepDurationMinutes != null) {
      return sleepDurationHours.toString() +
          'h ' +
          sleepDurationMinutes.toString() +
          'min';
    } else {
      return '8h 0min';
    }
  }

  void setSleepDuration() {
    if ((ifHourIsChoosen == false && ifMinuteIsChoosen == false) ||
        sleepDurationHours == null) {
      fontColorSleepDuration = 200;
    } else {
      fontColorSleepDuration = 800;
    }
  }

  void setSleepType(String newValue) {
    fontColorSleepType = 800;
    dropdownValueSleepType = newValue;
  }
}
