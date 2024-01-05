import 'package:arlogi/Components/User/Barang/BarangComponents.dart';
import 'package:arlogi/Utils/constants.dart';
import 'package:arlogi/size_config.dart';
import 'package:flutter/material.dart';

class DataBarangScreens extends StatelessWidget {
  static var routeName = "/list_barang_user_screens";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color.fromARGB(255, 163, 174, 221),
        title: Text(
          "Daftar Barang  Outdoor",
          style: TextStyle(color: mTitleColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: BarangComponents(),
    );
  }
}
