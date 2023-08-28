import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/SettingsScreen.dart';
import 'package:todo/TaskBottomSheet.dart';
import 'package:todo/TaskListScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo/myTheme.dart';
import 'package:todo/providers/AppConfigProvider.dart';
class HomeScreen extends StatefulWidget {
  static const String routename='home';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {

  int selectedindex=0;
  @override
  Widget build(BuildContext context) {
    var themeprovider=Provider.of<AppconfigProvider>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,size: 24,),
        onPressed: (){showNewTaskBottomSheet();},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(34),
          side: BorderSide(color: Colors.white,width: 4)
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.todoapp,style: Theme.of(context).primaryTextTheme.subtitle1,),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8,
        shape: CircularNotchedRectangle(
        ),


        child: themeprovider.appmode==ThemeMode.light?BottomNavigationBar(
          currentIndex: selectedindex,
          onTap: (index){selectedindex=index;
          setState(() {

          });
          },
          items: [

            BottomNavigationBarItem(icon: Icon(Icons.list),
            label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.settings),
            label: ''
            )
          ],
        ):Theme(
          data: Theme.of(context).copyWith(canvasColor: myTheme.darkbottom),
          child: BottomNavigationBar(
            currentIndex: selectedindex,
            onTap: (index){selectedindex=index;
            setState(() {

            });
            },
            items: [

              BottomNavigationBarItem(icon: Icon(Icons.list),
                  label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.settings),
                  label: ''
              )
            ],
          ),
        )

        ,
      ),
   body: screens[selectedindex],
    );
  }
  List<Widget> screens=[TaskListScreen(),SettingsScreen()];
  void showNewTaskBottomSheet(){
    showModalBottomSheet(context: context, builder: (context)=>TaskBottomSheet());
  }
}
