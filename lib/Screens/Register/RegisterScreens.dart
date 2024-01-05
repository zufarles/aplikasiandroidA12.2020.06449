import 'package:arlogi/Components/Register/RegisterComponent.dart';
import 'package:arlogi/size_config.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  static String routName = "/sign_up";



  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(

      body: RegisterComponent(),

    );

  }
}