import 'package:flutter/material.dart';
import 'package:todo/Task.dart';
import 'package:todo/firebaseutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditScreen extends StatefulWidget {
  static String routename="edit";

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  String text = '';

  String description = '';

  DateTime selecteddate = DateTime.now();

  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var task = ModalRoute
        .of(context)
        ?.settings
        .arguments as Task;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.todoapp, style: Theme
            .of(context)
            .primaryTextTheme
            .subtitle1,),
      ),
      body: Container(
        margin: EdgeInsets.all(18),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16)
        ),
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(AppLocalizations.of(context)!.edit, style: Theme
                  .of(context)
                  .primaryTextTheme
                  .headline1, textAlign: TextAlign.center),
              TextFormField(
                validator: (text){
                  if( text==null || text.trim().isEmpty){
                    return 'title can not be empty';
                  }
                  return null;
                },
                initialValue: task.title,
                onChanged: (text_c) {
                  text = text_c;
                },
              ),
              SizedBox(height: 15,),
              TextFormField(
                validator: (text){
                  if( text==null || text.trim().isEmpty){
                    return 'description can not be empty';
                  }
                  return null;
                },
                maxLines: 4,
                initialValue: task.description,
                onChanged: (text_c) {
                  description = text_c;
                },
              ),
              SizedBox(height: 20,),
              Text(AppLocalizations.of(context)!.selecttime,style: Theme.of(context).primaryTextTheme.headline1,),
              SizedBox(height: 15,),
              InkWell(
                  onTap: (){chosenDate();},
                  child: Text('${selecteddate.month}/${selecteddate.day}/${selecteddate.year}',style: Theme.of(context).primaryTextTheme.subtitle2,textAlign: TextAlign.center,)),

              SizedBox(height: 15,),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))
                    ),
                    onPressed: (){
                        if(formkey.currentState?.validate() == true){
                        updateTask(task, text, description) .timeout(Duration(milliseconds: 500),onTimeout: (){
                          print("updated succesfully");
                        }) ;
                        Navigator.pop(context);
                        }
                    }, child: Text(AppLocalizations.of(context)!.savechanges)),
              )
            ],

          ),
        ),
      ),
    );
  }
Future<void> updateTask(Task task, String title, String description){
    var collection=getTaskCollection();
    int date =selecteddate.millisecondsSinceEpoch;
    return collection.doc(task.id).update({
      'title':title,
      'description':description,
      'date':date
    });
}
  void chosenDate() async {
    var sel = await showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (sel != null) {
      selecteddate = sel;
      setState(() {});
    }
  }
}
