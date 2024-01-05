import 'package:arlogi/Components/Admin/Crud/InputBarang/InputBarangForm.dart';
import 'package:arlogi/Utils/constants.dart';
import 'package:arlogi/size_config.dart';
import 'package:flutter/material.dart';


class InputBarangComponent extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _InputBarangComponent createState() => _InputBarangComponent();
}

class _InputBarangComponent extends State<InputBarangComponent> {
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
                          "Input Data Barang Outdoor !",
                          style: mTitleStyle,
                        )
                      ],
                    )),
                const SizedBox(
                  height: 20,
                ),
                FormInputBarang()
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
