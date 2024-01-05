import 'package:arlogi/Api/configAPI.dart';
import 'package:arlogi/Components/custom_surfix_icon.dart';
import 'package:arlogi/Components/default_button_custome_color.dart';
import 'package:arlogi/Screens/Login/LoginScreens.dart';
import 'package:arlogi/Utils/constants.dart';
import 'package:arlogi/size_config.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


class SignUpform extends StatefulWidget {
  @override
  _SignUpform createState() => _SignUpform();
}

class _SignUpform extends State<SignUpform> {
  final formKey = GlobalKey<FormState>();
    String? namalenkap;
    String? username;
    String? email;
    String? password;
    bool? remember = false;

    TextEditingController txtNamaLengkap = TextEditingController(),
    txtUserName = TextEditingController(),
    txtEmail = TextEditingController(),
    txtPassword = TextEditingController();
    

    FocusNode focusNode = new FocusNode();
    Response? response;
    var dio = Dio();


    @override
    void initState(){
      super.initState();
 
    }
    @override
    Widget build(BuildContext context){
      return Form(
        child: Column(
          children: [
            buildNamaLengkap(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildUserName(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildEmail(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildPassword(),
            SizedBox(height: getProportionateScreenHeight(30)),
            DefaultButtonCustomeColor(
              color: kPrimaryColor,
              text: "Buat Akun",
              press: () {
                prosesRegistrasi(txtNamaLengkap.text, txtPassword.text, 
                txtNamaLengkap.text, txtEmail.text);
              },
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, LoginScreens.routName);
              },
              child: Text(
                "Sudah Punya Akun? Masuk Disini",
                style: TextStyle(decoration: TextDecoration.underline),
             ),
           ),
                         const SizedBox(
                height: 30,
              ),
         ],
        ),
    );
  }
  TextFormField buildNamaLengkap(){
    return TextFormField(
      controller: txtNamaLengkap,
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
        labelText: 'Nama Lengkap',
        hintText: 'Masukan Nama Lengkap',
        labelStyle: TextStyle (
          color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(
            svgIcon: "assets/icons/User.svg" ,
            )),
        );
  }
  TextFormField buildUserName(){
    return TextFormField(
      controller: txtUserName,
      style: mTitleStyle,
      decoration: InputDecoration(
        labelText: 'Username',
        hintText: 'Masukan Username',
        labelStyle: TextStyle(
          color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          svgIcon: "assets/icons/account.svg",
          )),   
    );
  }

  TextFormField buildEmail() {
    return TextFormField(
      controller: txtEmail,
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'Masukan Email',
        labelStyle: TextStyle(
          color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(
            svgIcon: "assets/icons/Mail.svg",
            )),
      );
  }
  TextFormField buildPassword(){
      return TextFormField(
      controller: txtPassword,
      keyboardType: TextInputType.text,
      obscureText: true,
      style: mTitleStyle,
      decoration: InputDecoration(
        labelText: 'Passowrd',
        hintText: 'Masukan Password',
        labelStyle: TextStyle(
          color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(
            svgIcon: "assets/icons/Lock.svg",
            )),
      );
  }
   void prosesRegistrasi(userName,password, nama, email) async{
    utilsApps.showDialog(context);
    
    bool status;
    var msg;


  //  });
  try {
           response = await dio.post(urlRegister, data: {
     'username' : userName,
     'password' : password,
     'nama' : nama,
     'email' :email
  }); 

  status = response!.data['sukses'];
  msg = response!.data['msg'];
  if (status){
    utilsApps.hideDialog(context);
    AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.rightSlide,
            title: 'Pemberitahuan',
            desc: 'Berhasil Registrasi',
            btnOkOnPress: () {
              utilsApps.hideDialog(context);
              Navigator.pushNamed(context, LoginScreens.routName);

      },
            ).show();
  }else{
    utilsApps.hideDialog(context);
       AwesomeDialog(
            context: context,
            dialogType: DialogType.warning,
            animType: AnimType.rightSlide,
            title: 'Pemberitahuan',
            desc: 'Gagal Registrasi',
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
