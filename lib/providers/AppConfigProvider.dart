import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppconfigProvider extends ChangeNotifier{
  String applang='en';
  ThemeMode appmode=ThemeMode.light;
  onchangeLang(String newlang){
    if(applang==newlang){
      return;
    }
    applang=newlang;
    notifyListeners();
  }
  bool isdarkmode(){
    return appmode==ThemeMode.dark;
  }
  onThemeChange(ThemeMode Theme){
      if(appmode==Theme){
        return;
      }
      appmode=Theme;
      notifyListeners();
  }

}