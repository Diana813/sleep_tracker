import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sleeptracker/appUtils/listItem.dart';
import 'package:sleeptracker/welcomePagePackage/buttonWelcomePage.dart';
import 'package:sleeptracker/welcomePagePackage/dateAndListView.dart';
import 'package:sleeptracker/welcomePagePackage/moonIcon.dart';
import 'package:sleeptracker/welcomePagePackage/welcomeText.dart';

class WelcomeScreen extends StatelessWidget {
  static final dateFormatter = DateFormat('EEEE, dd MMM yyyy');
  String dateString = dateFormatter.format(DateTime.now());
  List<SleepPatternsListItem> items = [];
  SleepPatternsListItem sleepPatternsListItem;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: viewportConstraints.maxHeight,
          ),
          child: IntrinsicHeight(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 300.0,
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          moonIcon(),
                          welcomeText(),
                          buttonWelcomePage(
                            listItem: sleepPatternsListItem,
                            list: items,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //List container
                dateAndListView(
                  list: items,
                  date: dateString,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
