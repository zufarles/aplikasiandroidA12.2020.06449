import 'package:arlogi/Components/Register/RegisterFrom.dart';
import 'package:arlogi/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:arlogi/size_config.dart';



class RegisterComponent extends StatefulWidget{
  @override
  _RegisterComponent createState () => _RegisterComponent();

}

  @override
  class _RegisterComponent extends State<RegisterComponent>{

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
            horizontal: getProportionateScreenHeight(30)),
            child: SingleChildScrollView(
              child: Column(
              children: [

                  
                SizedBox(height: 10),              
                  SimpleShadow(
                    child: Image.asset("assets/images/logo1.png",
                    height: 250,
                    width: 202,
                    ),
                    opacity: 0.5,
                    color: kSecondaryColor,
                    offset: Offset(5,5),
                    sigma: 2,
                    ),
                    Padding(padding: EdgeInsets.only(left: 20),
                    child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("DAFTAR !",
                        style: mTitleStyle,

                        )
                      ],
                    )),
                    SizedBox(
                      height:20,
                      ),
                      SignUpform()

              ],
            ),
          ),
        ),
      ),
      )
    );
  }
}