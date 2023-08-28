import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/AppConfigProvider.dart';
class LanguageBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppconfigProvider>(context);
    return Column(
      children: [
        provider.applang=='en'?
        SelectedWidget(AppLocalizations.of(context)!.english, context):
        InkWell(
            onTap: (){provider.onchangeLang("en");}
            ,child: UnSelectedWidget(AppLocalizations.of(context)!.english, context)),
        SizedBox(height: 12,),
        provider.applang=='ar'?

        SelectedWidget(AppLocalizations.of(context)!.arabic, context):
        InkWell(
            onTap: (){provider.onchangeLang("ar");}
            ,child: UnSelectedWidget(AppLocalizations.of(context)!.arabic, context))
        
        
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
