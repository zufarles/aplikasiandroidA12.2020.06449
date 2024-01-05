import 'package:arlogi/Utils/constants.dart';
import 'package:arlogi/size_config.dart';
import 'package:flutter/material.dart';

import '../../../Components/Admin/Crud/EditBarang/EditBarangComponent.dart';

class EditBarangScreens extends StatelessWidget {
  static var routeName = '/edit_barang_screens';
  static var dataBarang;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    dataBarang = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        title: Text(
          "Edit Data Barang",
          style: TextStyle(color: mTitleColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: EditBarangComponent(),
    );
  }
}
