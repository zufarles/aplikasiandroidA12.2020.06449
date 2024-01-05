
import 'package:arlogi/Screens/Login/LoginScreens.dart';
import 'package:arlogi/routes.dart';
import 'package:arlogi/theme.dart';
import 'package:flutter/material.dart';

void main() async{
  runApp(
  MaterialApp(
    title: "ARlOGI",
    theme: theme(),
    initialRoute: LoginScreens.routName,
    debugShowCheckedModeBanner: false,
    routes: routes,
    ));
}