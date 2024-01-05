import 'package:arlogi/Components/Admin/Crud/EditBarang/EditBarangForm.dart';
import 'package:arlogi/Utils/constants.dart';
import 'package:arlogi/size_config.dart';
import 'package:flutter/material.dart';

class EditBarangComponent extends StatefulWidget {
  @override
  _EditBarangComponent createState() => _EditBarangComponent();
}

class _EditBarangComponent extends State<EditBarangComponent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenHeight(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight * 0.04,
                ),
                Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Edit Data Barang !",
                          style: mTitleStyle,
                        )
                      ],
                    )),
                SizedBox(
                  height: 20,
                ),
                FormEditBarang()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
