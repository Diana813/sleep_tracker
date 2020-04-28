import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';

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
              fit: BoxFit.cover,
            ),
            backgroundColor: Colors.transparent),
        body: WelcomeScreen(),
      ),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  static final dateFormatter = DateFormat('EEEE, dd MMM yyyy');
  String dateString = dateFormatter.format(DateTime.now());
  List<SleepPatternsListItem> items = [];

  SleepPatternsListItem sleepPatternsListItem;

  @override
  Widget build(BuildContext context) {
    items = items.reversed.toList();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                //moon icon
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Colors.amber[200],
                    child: Icon(
                      Icons.brightness_2,
                      color: Colors.white,
                      size: 30.0,
                    ),
                  ),
                ),
                //Welcome text
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                      'Get to know your baby\'s sleep patterns and keep track of how much sleep they are getting here.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.blueGrey[300],
                          fontFamily: 'Comfortaa')),
                ),
                //Button
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10.0),
                  child: ButtonTheme(
                    child: ButtonBar(
                      alignment: MainAxisAlignment.center,
                      buttonPadding:
                          const EdgeInsets.symmetric(horizontal: 40.0),
                      children: <Widget>[
                        Container(
                          child: RaisedButton(
                            onPressed: () {
                              waitForReturnValue(context);
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
                                    maxWidth: 300.0, minHeight: 50.0),
                                alignment: Alignment.center,
                                child: Text(
                                  'Add new sleeping record',
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
              ],
            ),
          ),
          //List container
          Container(
            height: MediaQuery.of(context).size.height * 0.43,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //date text
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(dateString,
                      style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.blueGrey[700],
                          fontWeight: FontWeight.bold)),
                ),
                //List
                Expanded(
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    elevation: 8.0,
                    margin: EdgeInsets.all(10.0),

                    //listView
                    child: new ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (BuildContext cont, int index) {
                        //ListTile
                        return new CustomListItem(
                            leading: items[index].dateAndTime,
                            title: items[index].sleepType,
                            subtitle: items[index].sleepDuration);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void waitForReturnValue(BuildContext context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditPageScaffold(),
        ));

    sleepPatternsListItem = result;
    if (result != null) {
      items.add(sleepPatternsListItem);
    }
  }
}

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
              fit: BoxFit.cover,
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
  String timeString = DateFormat('HH:mm').format(DateTime.now());
  NumberPicker integerNumberPicker;
  int sleepDurationValueHours = 8;
  int sleepDurationValueMinutes = 0;
  bool ifHourIsChoosen;
  bool ifMinuteIsChoosen;
  int fontColorNumberSleepType = 200;
  int fontColorNumberSleepDuration = 200;
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
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //image
            Padding(
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
            Padding(
              child: Divider(
                color: Colors.blueGrey[800],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 70.0),
            ),
            //date and time
            Padding(
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
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
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
            Padding(
              child: Divider(
                color: Colors.blueGrey[800],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 70.0),
            ),
            //sleep type
            Padding(
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
            Padding(
              child: Divider(
                color: Colors.blueGrey[800],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 70.0),
            ),
            //sleep duration
            Padding(
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
                          color: Colors.blueGrey[fontColorNumberSleepDuration],
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
            Padding(
              child: Divider(
                color: Colors.blueGrey[800],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 70.0),
            ),
            //save button
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10.0),
              child: ButtonTheme(
                child: ButtonBar(
                  alignment: MainAxisAlignment.center,
                  buttonPadding: const EdgeInsets.symmetric(
                      vertical: 30.0, horizontal: 40.0),
                  children: <Widget>[
                    Container(
                      child: RaisedButton(
                        onPressed: () {
                          if (fontColorNumberSleepType != 200 &&
                              fontColorNumberSleepDuration != 200) {
                            final sleeppingPatternsData = SleepPatternsListItem(
                                timeString,
                                dropdownValue,
                                sleepDurationValueHours.toString() +
                                    ' hour(s), ' +
                                    sleepDurationValueMinutes.toString() +
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
                                colors: [Colors.blue[600], Colors.blue[900]],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Container(
                            constraints: BoxConstraints(
                                maxWidth: 300.0, minHeight: 50.0),
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
          ],
        ),
      ),
    );
  }
}

class SleepPatternsListItem {
  final String dateAndTime;
  final String sleepType;
  final String sleepDuration;

  SleepPatternsListItem(this.dateAndTime, this.sleepType, this.sleepDuration);
}

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
