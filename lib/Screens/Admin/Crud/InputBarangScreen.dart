import 'package:arlogi/Components/Admin/Crud/InputBarang/InputBarangComponent.dart';
import 'package:arlogi/Utils/constants.dart';
import 'package:flutter/material.dart';


class InputBarangScreens extends StatelessWidget {
  static var routeName = '/input_barang_screens';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "ARLOGI RENT CAMP",
          style: TextStyle(color: mTitleColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: InputBarangComponent(),
    );
  }
}
