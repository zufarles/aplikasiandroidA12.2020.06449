

import 'package:arlogi/Api/configAPI.dart';
import 'package:arlogi/Components/custom_surfix_icon.dart';
import 'package:arlogi/Components/default_button_custome_color.dart';
import 'package:arlogi/Screens/Admin/HomeAdminScreens.dart';

import 'package:arlogi/Screens/Register/RegisterScreens.dart';
import 'package:arlogi/Screens/User/HomeUserScreens.dart';
import 'package:arlogi/Utils/constants.dart';
import 'package:arlogi/size_config.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


class Signinform extends StatefulWidget {
  @override
  _SignInForm createState() => _SignInForm();
}
class _SignInForm extends State<Signinform> {

    final _formKey = GlobalKey<FormState>();
    String? username;
    String? password;
    bool? remember = false;

    TextEditingController txtUserName = TextEditingController(),
      txtPassword = TextEditingController();

    FocusNode focusNode = new FocusNode();

    Response? response;
    var dio =  Dio();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();}
    // loginProses();

    @override
    
    Widget build(BuildContext context){
    return Form(
      child: Column(
        
        children: [
          buildUserName(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPassword(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(value: remember,
               onChanged: (value){
                setState(() {
                 remember = value;
               });
               }),
               Text("Tetap masuk"),
               Spacer(),
               GestureDetector(
                onTap: () {},
                child:  Text("Lupa Password", 
                style: TextStyle(decoration: TextDecoration.underline),
                ),
               )
            ],
          ),
                        const SizedBox(
                height: 20,
              ),
          DefaultButtonCustomeColor(
            color: kPrimaryColor,
            text: "MASUK",
            press: (){
              prosesLogin(txtUserName.text, txtPassword.text);
            },
            ),
            SizedBox(
              height: 15,
            ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RegisterScreen.routName);
            },
            child: Text(
             "Belum Punya Akun ? Daftar Disini",
             style:  TextStyle(decoration: TextDecoration.underline),
            ),
          )
        ],
      ),
    );
  }

TextFormField buildUserName() {
  return TextFormField(
    controller: txtUserName,
    keyboardType: TextInputType.text,
    style: mTitleStyle,
    decoration: InputDecoration(
      labelText: 'Username',
      hintText: 'Masukkan username anda',
      labelStyle: TextStyle(color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(color: const Color.fromARGB(255, 7, 6, 6)),
      ),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      suffixIcon: CustomSurffixIcon(
        svgIcon: "assets/icons/User.svg",
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(12))
      )
    ),
  );
}

  TextFormField buildPassword() {
  return TextFormField(

    controller: txtPassword,
    obscureText: true,
    style: mTitleStyle,
    decoration: InputDecoration(
      labelText: 'Password',
      hintText: 'Masukkan kata sandi anda',
      labelStyle: TextStyle(color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: Colors.black),
      ),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      suffixIcon: CustomSurffixIcon(
        svgIcon: "assets/icons/Lock.svg",
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}



  void prosesLogin(userName,password) async{
    utilsApps.showDialog(context);
    
    bool status;
    var msg;
    var dataUser;


  //  });
  try {
           response = await dio.post(urlLogin, data: {
     'username' : userName,
     'password' : password
  }); 

  status = response!.data['sukses'];
  msg = response!.data['msg'];
  if (status){
        AwesomeDialog(
          context: context,
          dialogType: DialogType.SUCCES,
          animType: AnimType.RIGHSLIDE,
          title: 'Peringatan',
          desc: 'Berhasil Login',
          btnOkOnPress: () {
            utilsApps.hideDialog(context);
            dataUser = response!.data['data'];
            if (dataUser['role'] == 1) {
              Navigator.pushNamed(context, HomeUserScreen.routeName,
                  arguments: dataUser);
            } else if (dataUser['role'] == 2) {
              Navigator.pushNamed(context, HomeAdminScreens.routeName);
            } else {
              print("Halaman tidak tersedia");
            }
            // N
      },
            ).show();
  }else{
    utilsApps.hideDialog(context);
       AwesomeDialog(
            context: context,
            dialogType: DialogType.warning,
            animType: AnimType.rightSlide,
            title: 'Pemberitahuan',
            desc: 'Gagal Login',
            btnOkOnPress: () { 
                   utilsApps.hideDialog(context);},
            ).show();
  }

  }catch (e) {;
       AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.rightSlide,
            title: 'Pemberitahuan',
            desc: 'Gagal Server',
            btnOkOnPress: () {
                    utilsApps.hideDialog(context);},
            ).show();
  }
  }

}