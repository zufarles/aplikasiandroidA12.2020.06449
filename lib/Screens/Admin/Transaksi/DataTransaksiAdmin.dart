import 'package:arlogi/Components/Admin/DataTransaksi/DataTransaksiAdminComponents.dart';
import 'package:arlogi/Utils/constants.dart';
import 'package:arlogi/size_config.dart';
import 'package:flutter/material.dart';


class DataTransaksiAdminScreens extends StatelessWidget {
  static var routeName = '/data_transaksi_admin_screens';
  
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color.fromARGB(255, 163, 174, 221),
        title: Text(
          "Data Transaksi",
          style: TextStyle(color: mTitleColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: DataTransaksiAdminComponents(),
    );
  }
}
