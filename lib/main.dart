import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/EditScreen.dart';
import 'package:todo/HomeScreen.dart';
import 'package:todo/SettingsScreen.dart';
import 'package:todo/myTheme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo/providers/AppConfigProvider.dart';
import 'package:todo/providers/ListProvider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseFirestore.instance.disableNetwork();
  runApp(MultiProvider(
    providers: [ ChangeNotifierProvider(
      create: (context)=>ListProvider()),
  ChangeNotifierProvider(
  create: (context)=>AppconfigProvider()),
  ],
   child: myApp(),

  ));
}
class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var langprovider=Provider.of<AppconfigProvider>(context);
    return MaterialApp(
      title: 'Todo',
      routes: {HomeScreen.routename:(context)=>HomeScreen(),
          EditScreen.routename:(context)=>EditScreen(),
        SettingsScreen.routename:(context)=>SettingsScreen()
      },
      localizationsDelegates:AppLocalizations.localizationsDelegates,
      supportedLocales:AppLocalizations.supportedLocales,
      theme: myTheme.lightTheme,
      initialRoute: HomeScreen.routename,
      themeMode: langprovider.appmode,
      darkTheme: myTheme.darktheme,

      locale: Locale(langprovider.applang),
    );
  }
}
