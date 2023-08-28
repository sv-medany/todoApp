import 'package:flutter/material.dart';
import 'package:todo/firebaseutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'Task.dart';

class TaskBottomSheet extends StatefulWidget {
  @override
  State<TaskBottomSheet> createState() => _TaskBottomSheetState();
}

class _TaskBottomSheetState extends State<TaskBottomSheet> {
  var formkey= GlobalKey<FormState>();
  String title='';
  String description='';
  DateTime selecteddate=DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.addnewtask,style: Theme.of(context).primaryTextTheme.headline1,textAlign: TextAlign.center,),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              onChanged: (text)=>title=text,
              validator: (text){
                if(text!.trim().isEmpty || text==null){
                  return 'error please fill the fields correctly ';
                }
                return null;
              },
              onTap: (){},
              decoration: InputDecoration(
                hintText: 'enter your task',
                hintStyle: Theme.of(context).primaryTextTheme.subtitle2
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              onChanged: (text)=>description=text,
              validator: (text){
                if(text!.trim().isEmpty || text==Null){
                  return 'error please fill the fields correctly ';
                }
                return null;
              },
              onTap: (){},
              maxLines: 4,
              decoration: InputDecoration(
                  hintText: 'enter your task description',
                  hintStyle: Theme.of(context).primaryTextTheme.subtitle2
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(AppLocalizations.of(context)!.selecttime,style: Theme.of(context).primaryTextTheme.headline1,),
          ),
          InkWell(
              onTap: (){chosenDate();},
              child: Text('${selecteddate.month}/${selecteddate.day}/${selecteddate.year}',style: Theme.of(context).primaryTextTheme.subtitle2,textAlign: TextAlign.center,)),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(),
            child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))
            ),
                onPressed: (){
              addTask();
                }, child: Text(AppLocalizations.of(context)!.addnewtask)),
          )
        ],
      ),
    );
  }
   void chosenDate() async{
  var sel= await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime.now().add(Duration(days: 365)));
  if(sel != null) {
    selecteddate=sel ;
    setState(() {
    });
  }

  }

  void addTask() {
    if(formkey.currentState?.validate() == true){
      addTasktoFireStore(Task(
        title:title,
        description:description,
        date:selecteddate.millisecondsSinceEpoch
      )
      ).timeout(
        Duration(milliseconds: 500),
        onTimeout: (){
          print('done');
          Navigator.pop(context);
        }
      );
    }
  }
}
