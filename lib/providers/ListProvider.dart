import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Task.dart';
import '../firebaseutil.dart';

class ListProvider extends ChangeNotifier{
  DateTime selectedDate=DateTime.now();
  List<Task> alltasks=[];
  void getAllTasksFromFireStore  () async {
    QuerySnapshot<Task> collectionreference = await getTaskCollection().get();
    alltasks=collectionreference.docs.map((QueryDocumentSnapshot<Task> q) => q.data()).toList();
    alltasks=alltasks.where((task) {
      DateTime x = DateTime.fromMillisecondsSinceEpoch(task.date);
      if(x.day == selectedDate.day && x.month == selectedDate.month && x.year == selectedDate.year){
        return true;
      }
      else{
        return false;
      }
    }).toList();
    alltasks.sort((task1,task2){
      DateTime x = DateTime.fromMillisecondsSinceEpoch(task1.date);
      DateTime y = DateTime.fromMillisecondsSinceEpoch(task2.date);
      return x.compareTo(y);
    });
    notifyListeners();
  }
  changeDate(DateTime newdate){
    selectedDate=newdate;
    notifyListeners();
  }


}