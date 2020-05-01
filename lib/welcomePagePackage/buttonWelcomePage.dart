import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sleeptracker/editPagePackage/editPage.dart';

import '../appUtils/listItem.dart';

class buttonWelcomePage extends StatelessWidget {
  buttonWelcomePage({
    this.listItem,
    this.list,
  });

  SleepPatternsListItem listItem;
  List<SleepPatternsListItem> list;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      child: ButtonBar(
        alignment: MainAxisAlignment.center,
        buttonPadding: const EdgeInsets.symmetric(horizontal: 40.0),
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
                      colors: [Colors.blue[600], Colors.blue[900]],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                    borderRadius: BorderRadius.circular(30.0)),
                child: Container(
                  constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
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
    );
  }

  void waitForReturnValue(BuildContext context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditPageScaffold(),
        ));

    listItem = result;
    if (result != null) {
      list.add(listItem);
    }
  }
}
