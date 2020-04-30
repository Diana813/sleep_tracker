import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

import 'editPage.dart';

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

class WelcomeScreen extends StatelessWidget {
  static final dateFormatter = DateFormat('EEEE, dd MMM yyyy');
  String dateString = dateFormatter.format(DateTime.now());
  List<SleepPatternsListItem> items = [];

  SleepPatternsListItem sleepPatternsListItem;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
      items = items.reversed.toList();
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: viewportConstraints.maxHeight,
          ),
          child: IntrinsicHeight(
            child: Column(
              children: <Widget>[
                //Welcome text
                Expanded(
                  child: Container(
                    height: 300.0,
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          //moon icon
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 20.0),
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
                          ),
                          //Button
                          ButtonTheme(
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
                                        borderRadius:
                                            BorderRadius.circular(80.0)),
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
                        ],
                      ),
                    ),
                  ),
                ),
                //List container
                Expanded(
                  child: Container(
                    height: 300.0,
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
                ),
              ],
            ),
          ),
        ),
      );
    });
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
