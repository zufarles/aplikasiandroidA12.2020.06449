import 'package:arlogi/Utils/constants.dart';
import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Muli",
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    
    textTheme: textTheme(), // Ini adalah tempat yang benar untuk mengatur textTheme
    inputDecorationTheme: InputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light, // Pindahkan brightness ke sini jika diperlukan
  );
}

// ...

TextTheme textTheme() {
  return const TextTheme(
    bodyText1: TextStyle(color: kTextColor),
    bodyText2: TextStyle(color: kTextColor),
  );
}
