import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/LanguageBottomSheet.dart';
import 'package:todo/ThemeBottomSheet.dart';
import 'package:todo/myTheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo/providers/AppConfigProvider.dart';
class SettingsScreen extends StatefulWidget {
  static String routename="sett";

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppconfigProvider>(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.all(12),

              child: Text(AppLocalizations.of(context)!.language,style: Theme.of(context).primaryTextTheme.headline1,textAlign: TextAlign.start,)),
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.only(left:12,right: 12,bottom: 12),
            child: InkWell(
              onTap: (){
                showLanguageBottomSheet();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  provider.applang=='en'?
                  Text(AppLocalizations.of(context)!.english,style: Theme.of(context).primaryTextTheme.headline4,):

                  Text(AppLocalizations.of(context)!.arabic,style: Theme.of(context).primaryTextTheme.headline4,),
                  Icon(Icons.arrow_drop_down,color: Theme.of(context).primaryColor,size: 25,)
                ],
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.all(12),

              child: Text(AppLocalizations.of(context)!.theme,style: Theme.of(context).primaryTextTheme.headline1,textAlign: TextAlign.start,)),
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.only(left:12,right: 12,bottom: 12),
            child: InkWell(
              onTap: (){
                showThemeBottomSheet();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  provider.isdarkmode()?
                  Text(AppLocalizations.of(context)!.dark,style: Theme.of(context).primaryTextTheme.headline4,):
                  Text(AppLocalizations.of(context)!.light,style: Theme.of(context).primaryTextTheme.headline4,),
                  Icon(Icons.arrow_drop_down,color: Theme.of(context).primaryColor,size: 25,)
                ],
              ),
            ),
          )

        ],
      ),


    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(context: context, builder: (context)=>LanguageBottomSheet());
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(context: context, builder: (context)=>ThemeBottomSheet());
  }
}
