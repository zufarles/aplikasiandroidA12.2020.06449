import 'package:arlogi/Components/Login/LoginFrom.dart';
import 'package:arlogi/Utils/constants.dart';
import 'package:arlogi/size_config.dart';
import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';

class LoginComponent extends StatefulWidget{
  @override
  _LoginComponent createState () => _LoginComponent();


}
class _LoginComponent extends State<LoginComponent>{
  @override
  
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/login.png'), fit: BoxFit.cover),
      ),

      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenHeight(40)),
            child: SingleChildScrollView(
              
              child: Column(
                children: [
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.04,
                  ),
                    SizedBox(
                    height: SizeConfig.screenHeight * 0.04,
                  ),
                  SimpleShadow(
                    child: Image.asset("assets/images/logo1.png",
                    height: 170,
                    width: 202,
                    ),
                    opacity: 0.5,
                    color: kSecondaryColor,
                    offset: Offset(5,5),
                    sigma: 2,
                    ),
                    
                     Text(
              "LOGIN AKUN",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
                    SizedBox(
                      
                      height:50,
                      ),
                      Signinform()
              ],
             ),
          ),
        ),
      ),
      
      ),
    );
   
 }
}