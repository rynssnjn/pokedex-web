import 'package:flutter/material.dart';
import 'package:pokedex_web/utilties/colors.dart';

final pokedexTheme = ThemeData(
  primaryColor: primaryBackgroundColor,
  primaryIconTheme: IconThemeData(
    color: Colors.black,
  ),
  textTheme: TextTheme(
    caption: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Colors.blueGrey,
    ),
    bodyText1: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headline1: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w900,
      color: Colors.black,
    ),
    headline2: TextStyle(
      fontSize: 15,
      color: Colors.black54,
      fontWeight: FontWeight.w600,
    ),
    headline3: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
    ),
    headline4: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w800,
      color: Colors.black,
    ),
  ),
  scaffoldBackgroundColor: primaryBackgroundColor,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: floatingActionButtonColor,
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: Colors.transparent,
  ),
);
