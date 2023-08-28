import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/EditScreen.dart';
import 'package:todo/firebaseutil.dart';
import 'package:todo/myTheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'Task.dart';

class TaskItem extends StatefulWidget {
  @override
  Task taski;
  TaskItem({required this.taski});

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  Widget build(BuildContext context) {
    return

      InkWell(
        onTap: (){
          Navigator.of(context).pushNamed(EditScreen.routename,
          arguments: widget.taski);
        },
        child: Container(
        margin: EdgeInsets.only(left: 12),
        child: Slidable(

          startActionPane: ActionPane(
            motion: ScrollMotion(),
            extentRatio: 0.25,
            children: [

            SlidableAction(
              onPressed: (context){
                deletetask(widget.taski).timeout(Duration(milliseconds: 500),onTimeout: (){
                  print("success in deletion");
                });
              },
              backgroundColor: Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
              padding: EdgeInsets.all(12),

              borderRadius: BorderRadius.only(topLeft: Radius.circular(12),bottomLeft: Radius.circular(12)),
            ),
          ],
          ),
          child:widget.taski.isdone?
          Container(
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: myTheme.whiteColor
            ),
            padding: EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: myTheme.greenColor,
                  height: 80,
                  width: 4,
                ),
                Container(
                  child: Column(
                    children: [
                      Text('${widget.taski.title}',style: Theme.of(context).primaryTextTheme.bodyText2,),
                      Text('${widget.taski.description}',style: Theme.of(context).primaryTextTheme.bodyText2,),
                    ],
                  ) ,
                ),

                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(AppLocalizations.of(context)!.taskdone,style: Theme.of(context).primaryTextTheme.bodyText2,),
                ),
              ],
            ),
          )
            :
          Container(
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: myTheme.whiteColor
            ),
            padding: EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: Theme.of(context).primaryColor,
                  height: 80,
                  width: 4,
                ),
                Container(
                  child: Column(
                    children: [
                      Text('${widget.taski.title}',style: Theme.of(context).primaryTextTheme.headline1,),
                      Text('${widget.taski.description}',style: Theme.of(context).primaryTextTheme.headline1,),
                    ],
                  ) ,
                ),

                InkWell(
                  onTap: (){
                    taskchecked(widget.taski).timeout(Duration(milliseconds: 500),onTimeout: (){
                      print("task checked");
                    }

                    );
                    setState(() {

                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(Icons.check,color: Colors.white,size: 26,),
                  ),
                ),
              ],
            ),
          ),
        ),
    ),
      );
  }
}