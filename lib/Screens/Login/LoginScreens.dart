
import 'package:arlogi/Components/Login/LoginComponent.dart';
import 'package:arlogi/size_config.dart';
import 'package:flutter/material.dart';

class LoginScreens extends StatelessWidget {
  static String routName = "/sign_in";



  @override
  Widget build(BuildContext context) {
    
    SizeConfig().init(context);

    return Scaffold(
      body: LoginComponent(),
    );

  }
}