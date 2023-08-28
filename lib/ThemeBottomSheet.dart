import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/AppConfigProvider.dart';
class ThemeBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var prov=Provider.of<AppconfigProvider>(context);
    return  Column(
      children: [
        !prov.isdarkmode()?
        SelectedWidget(AppLocalizations.of(context)!.light, context):
        InkWell(
            onTap: (){prov.onThemeChange(ThemeMode.light);}
            ,child: UnSelectedWidget(AppLocalizations.of(context)!.light, context))
        ,
        SizedBox(height: 12,),
        !prov.isdarkmode()?
        InkWell(
            onTap: (){prov.onThemeChange(ThemeMode.dark);}
            ,child: UnSelectedWidget(AppLocalizations.of(context)!.dark, context)):
        SelectedWidget(AppLocalizations.of(context)!.dark, context),
      ],
    );
  }
  Widget SelectedWidget(String Lang,BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('$Lang',style: Theme.of(context).primaryTextTheme.headline4,),
        Icon(Icons.check,size: 20,color: Theme.of(context).primaryColor,)
      ],
    );
  }
  Widget UnSelectedWidget(String Lang,BuildContext context){
    return Row(
      children: [
        Text('$Lang',style: Theme.of(context).primaryTextTheme.headline1,),
      ],
    );
  }
  }

