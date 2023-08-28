import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:provider/provider.dart';
import 'package:todo/Task_item.dart';
import 'package:todo/firebaseutil.dart';
import 'package:todo/providers/AppConfigProvider.dart';
import 'package:todo/providers/ListProvider.dart';

import 'Task.dart';
class TaskListScreen extends StatefulWidget {
  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<ListProvider>(context);
    var langprov = Provider.of<AppconfigProvider>(context);
    provider.getAllTasksFromFireStore();
    return Container(
      child: Column(
        children: [
          CalendarTimeline(
            initialDate: provider.selectedDate,
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) => provider.changeDate(date),
            leftMargin: 20,
            monthColor: Colors.blueGrey,
            dayColor: Colors.teal[200],
            activeDayColor: Colors.white,
            activeBackgroundDayColor: Theme.of(context).primaryColor,
            dotsColor: Colors.transparent,
            selectableDayPredicate: (date) => date.day != 23,
            //locale: 'en_ISO',\
            locale: langprov.applang,
          ),
          Expanded(
            child: ListView.builder(itemBuilder: (context,index)=>TaskItem(taski: provider.alltasks[index],),
              itemCount: provider.alltasks.length,
            ),
          )
        ],
      ),
    );
  }


}
