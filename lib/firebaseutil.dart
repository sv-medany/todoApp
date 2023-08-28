import 'package:cloud_firestore/cloud_firestore.dart';

import 'Task.dart';

CollectionReference<Task> getTaskCollection(){
  return FirebaseFirestore.instance.collection('task').withConverter<Task>
    (fromFirestore: (snapshot,options)=>Task.fromJson(snapshot.data()!)
      , toFirestore: (task,options)=>task.toJson());
}
Future<void> addTasktoFireStore(Task task){
  var taskscollection=getTaskCollection();
  var docref=taskscollection.doc();
  task.id=docref.id;
  return docref.set(task);
}
Future<void> deletetask(Task taski){
  var collection=getTaskCollection();
  return     collection.doc(taski.id).delete();
}
Future<void> taskchecked(Task taski){
  var collection=getTaskCollection();
  return     collection.doc(taski.id).update({
    'isdone':true
  });
}