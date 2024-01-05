import 'package:arlogi/Screens/Login/LoginScreens.dart';
import 'package:arlogi/Utils/constants.dart';
import 'package:arlogi/size_config.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';


import '../../Components/User/HomeUserComponents.dart';

class HomeUserScreen extends StatelessWidget {
  static String routeName = "/home_user";
  static var dataUserLogin;

  const HomeUserScreen({super.key});
  @override
  Widget build(BuildContext context) {
    
    
    SizeConfig().init(context);
    dataUserLogin = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      
      appBar: AppBar(
        automaticallyImplyLeading: false,
  
        backgroundColor: Color.fromARGB(255, 163, 174, 221),
        title: Text(
          "ARLOGI RENT CAMP",
          style: TextStyle(color: mTitleColor, fontWeight: FontWeight.bold),
        ),
        
        leading: Icon(
          Icons.home,
          color: mTitleColor,
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.person,
              color: mTitleColor,
            ),
          ),
          SizedBox(
            width: 10,
            
          )
          
        ],
        
      ),
      
      body: HomeUserComponent(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AwesomeDialog(
              context: context,
              dialogType: DialogType.INFO,
              animType: AnimType.RIGHSLIDE,
              title: 'Peringatan',
              desc: 'Yakin ingin keluar dari aplikasi ? ....',
              btnCancelOnPress: () {},
              btnCancelText: 'Tidak',
              btnOkText: 'Yakin',
              btnOkOnPress: () {
                Navigator.pushNamed(context, LoginScreens.routName);
              }).show();
        },
        backgroundColor: kColorRedSlow,
        child: Icon(
          Icons.logout,
          color: Colors.white,
        ),
      ),
    );
  }
}
