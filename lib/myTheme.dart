import 'package:flutter/material.dart';

class myTheme{
static Color primaryLightColor = Color(0xFF5D9CEC);
static Color whiteColor=Colors.white;
static Color blackColor=Color(0xFF363636);
static Color bgLightColor=Color(0xFFDFECDB);
static Color greenColor=Color(0xFF61E757);
static Color blackdarkbg=Color(0xFF060E1E);
static Color greyColor=Color(0xFFA9A9A9);
static Color darkbottom=Color(0xFF141922);
static ThemeData lightTheme=ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: primaryLightColor,
    elevation: 0,
  ),
  scaffoldBackgroundColor: bgLightColor,
  primaryTextTheme: TextTheme(
    subtitle1: TextStyle(
      fontSize: 22,
      color: whiteColor,
      fontWeight: FontWeight.bold
    ),
    headline1: TextStyle(
        color: blackColor,
        fontWeight: FontWeight.bold,
      fontSize: 18
    ),
    subtitle2: TextStyle(
      color: greyColor,
      fontSize: 20
    ),
    bodyText2: TextStyle(
      color: Colors.green,
      fontSize: 20
    ),
    headline4: TextStyle(
      color: myTheme.primaryLightColor,
      fontSize: 18
    )

  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 0,
    selectedItemColor: primaryLightColor,
    unselectedItemColor: Colors.black,
      backgroundColor: Colors.transparent
  )

);
static ThemeData darktheme=ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: primaryLightColor,
    elevation: 0,
  ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0,
        selectedItemColor: primaryLightColor,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.transparent
    ),
  scaffoldBackgroundColor: blackdarkbg,
  primaryTextTheme: TextTheme(
      subtitle1: TextStyle(
          fontSize: 22,
          color: blackColor,
          fontWeight: FontWeight.bold
      ),
      headline1: TextStyle(
          color: whiteColor,
          fontWeight: FontWeight.bold,
          fontSize: 18
      ),
      subtitle2: TextStyle(
          color: greyColor,
          fontSize: 20
      ),
      bodyText2: TextStyle(
          color: Colors.green,
          fontSize: 20
      ),
      headline4: TextStyle(
          color: myTheme.primaryLightColor,
          fontSize: 18
      )

  ),

);

}