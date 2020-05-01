import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../appUtils/customListItem.dart';

class dateAndListView extends StatelessWidget {
  dateAndListView({
    this.list,
    this.date,
  });

  List list = [];
  String date;

  @override
  Widget build(BuildContext context) {
    list = list.reversed.toList();
    return Expanded(
      child: Container(
        height: 300.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //date text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(date,
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
                  itemCount: list.length,
                  itemBuilder: (BuildContext cont, int index) {
                    //ListTile
                    return new CustomListItem(
                        leading: list[index].dateAndTime,
                        title: list[index].sleepType,
                        subtitle: list[index].sleepDuration);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
