import 'dart:io';

import 'package:arlogi/Api/configAPI.dart';
import 'package:arlogi/Components/default_button_custome_color.dart';
import 'package:arlogi/Screens/Admin/Crud/EditBarangScreen.dart';
import 'package:arlogi/Utils/constants.dart';
import 'package:arlogi/size_config.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';


import '../../../../Screens/Admin/HomeAdminScreens.dart';

class FormEditBarang extends StatefulWidget {
  @override
  _FormEditBarang createState() => _FormEditBarang();
}

class _FormEditBarang extends State<FormEditBarang> {
  TextEditingController txtNamaBarang =
          TextEditingController(text: '${EditBarangScreens.dataBarang['nama']}'),
      txtMerekBarang =
          TextEditingController(text: '${EditBarangScreens.dataBarang['merek']}'),
      txtStockBarang =
          TextEditingController(text: '${EditBarangScreens.dataBarang['stock']}'),
      txtHargaBarang =
          TextEditingController(text: '${EditBarangScreens.dataBarang['harga']}'),
      txtDeskripsiBarang =
          TextEditingController(text: '${EditBarangScreens.dataBarang['deskripsi']}');

  FocusNode focusNode = new FocusNode();
  File? image;
  Response? response;
  var dio = Dio();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // loginProses();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          buildNamaBarang(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildMerekBarang(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildStockBarang(),
          SizedBox(height: getProportionateScreenWidth(30)),
          buildHargaBarang(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildDeskripsiBarang(),
          SizedBox(height: getProportionateScreenHeight(30)),
          image == null
              ? Image.network(
                  '$baseUrl/${EditBarangScreens.dataBarang['gambar']}',
                  fit: BoxFit.cover,
                )
              : Image.file(
                  image!,
                  // width: 250,
                  // height: 250,
                  fit: BoxFit.cover,
                ),
          DefaultButtonCustomeColor(
            color: kColorBlue,
            text: "Pilih Gambar Barang",
            press: () {
              pilihGambar();
            },
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButtonCustomeColor(
            color: kPrimaryColor,
            text: "SUBMIT",
            press: () {
              if (txtNamaBarang.text == '') {
                AwesomeDialog(
                        context: context,
                        dialogType: DialogType.ERROR,
                        animType: AnimType.RIGHSLIDE,
                        title: 'Peringatan',
                        desc: 'Nama Barang tidak boleh kosong',
                        btnOkOnPress: () {})
                    .show();
              } else if (txtMerekBarang.text == '') {
                AwesomeDialog(
                        context: context,
                        dialogType: DialogType.ERROR,
                        animType: AnimType.RIGHSLIDE,
                        title: 'Peringatan',
                        desc: 'Tipe merek tidak boleh kosong',
                        btnOkOnPress: () {})
                    .show();
              }else if (txtStockBarang.text == '') {
                AwesomeDialog(
                        context: context,
                        dialogType: DialogType.ERROR,
                        animType: AnimType.RIGHSLIDE,
                        title: 'Peringatan',
                        desc: 'Tipe Stock tidak boleh kosong',
                        btnOkOnPress: () {})
                    .show();
              } 
              else if (txtHargaBarang.text == '') {
                AwesomeDialog(
                        context: context,
                        dialogType: DialogType.ERROR,
                        animType: AnimType.RIGHSLIDE,
                        title: 'Peringatan',
                        desc: 'Harga barang tidak boleh kosong',
                        btnOkOnPress: () {})
                    .show();
              } else if (txtDeskripsiBarang.text == '') {
                AwesomeDialog(
                        context: context,
                        dialogType: DialogType.ERROR,
                        animType: AnimType.RIGHSLIDE,
                        title: 'Peringatan',
                        desc: 'Deskripsi barang tidak boleh kosong',
                        btnOkOnPress: () {})
                    .show();
              } else {
                editDataBarang(txtNamaBarang.text, txtMerekBarang.text,txtStockBarang.text,
                    txtHargaBarang.text, txtDeskripsiBarang.text, image?.path);
              }
            },
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  TextFormField buildNamaBarang() {
    return TextFormField(
      controller: txtNamaBarang,
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'Nama Barang',
          hintText: 'Masukan Nama Barang',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.add_chart_sharp)),
    );
  }

  TextFormField buildMerekBarang() {
    return TextFormField(
      controller: txtMerekBarang,
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'Merek Barang',
          hintText: 'Masukan Merek Barang',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.add_chart_sharp)),
    );
  }
  TextFormField buildStockBarang() {
    return TextFormField(
      controller: txtStockBarang,
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'Stock Barang',
          hintText: 'Masukan Stock Barang',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.add_chart_sharp)),
    );
  }
  TextFormField buildHargaBarang() {
    return TextFormField(
      controller: txtHargaBarang,
      keyboardType: TextInputType.number,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'Harga Barang',
          hintText: 'Masukan Harga Barang',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.add_chart_sharp)),
    );
  }

  TextFormField buildDeskripsiBarang() {
    return TextFormField(
      controller: txtDeskripsiBarang,
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'Deskripsi Barang',
          hintText: 'Masukan Deskripsi Barang',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.add_chart_sharp)),
    );
  }

 Future pilihGambar() async {
  try {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemp = File(image.path);
    setState(() => this.image = imageTemp);
  } on PlatformException catch (e) {
    print("Gagal mengambil foto : $e");
  }
}

  void editDataBarang(nama, merek,stock, harga, deskripsi, gambar) async {
    utilsApps.showDialog(context);
    bool status;
    var msg;
    try {
      var formData = FormData.fromMap({
        'nama': nama,
        'merek': merek,
        'stock': stock,
        'harga': harga,
        'deskripsi': deskripsi,
        'gambar': image == null ? '' : await MultipartFile.fromFile(gambar)
      });

      response = await dio.put(
          '$editBarang/${EditBarangScreens.dataBarang['_id']}',
          data: formData);
      status = response!.data['sukses'];
      msg = response!.data['msg'];
      if (status) {
        AwesomeDialog(
            context: context,
            dialogType: DialogType.SUCCES,
            animType: AnimType.RIGHSLIDE,
            title: 'Peringatan',
            desc: '$msg',
            btnOkOnPress: () {
              utilsApps.hideDialog(context);
              Navigator.pushNamed(context, HomeAdminScreens.routeName);
            }).show();
      } else {
        AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.RIGHSLIDE,
            title: 'Peringatan',
            desc: '$msg',
            btnOkOnPress: () {
              utilsApps.hideDialog(context);
            }).show();
      }
    } catch (e) {
      print(e);
      AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          animType: AnimType.RIGHSLIDE,
          title: 'Peringatan',
          desc: 'Terjadi Kesalahan Pada Server Kami!!!!!!',
          btnOkOnPress: () {
            utilsApps.hideDialog(context);
          }).show();
    }
  }
}
