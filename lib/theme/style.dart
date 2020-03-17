import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: Colors.indigoAccent,
    accentColor: Colors.white,
    fontFamily: 'Ubuntu',
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.white),
      subtitle1: TextStyle(
          fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.black87),
      subtitle2: TextStyle(
          fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.white),
    ),
  );
}
