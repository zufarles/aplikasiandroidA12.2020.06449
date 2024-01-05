import 'package:arlogi/Api/configAPI.dart';
import 'package:arlogi/Screens/Admin/Crud/EditBarangScreen.dart';
import 'package:arlogi/Screens/Admin/HomeAdminScreens.dart';
import 'package:arlogi/Utils/constants.dart';
import 'package:arlogi/size_config.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class DataBarangAdminComponents extends StatefulWidget {
  @override
  _DataBarangAdminComponentsState createState() => _DataBarangAdminComponentsState();
}

class _DataBarangAdminComponentsState extends State<DataBarangAdminComponents> {
  Response? response;
  Dio dio = Dio();
  List<dynamic>? dataBarang;
  

  @override
  void initState() {
    super.initState();
    getDataBarang();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(20)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (dataBarang != null)
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: dataBarang!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return cardDataBarang(dataBarang![index]);
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget cardDataBarang(data) {
    return Card(
      elevation: 10.0,
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 253, 253, 253),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(width: 1.0, color: Colors.white24),
              ),
            ),
            child: Image.network('$baseUrl/${data['gambar']}'),
          ),
          title: Text(
            '${data['nama']}',
            style: TextStyle(color: mTitleColor, fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    EditBarangScreens.routeName,
                    arguments: data,
                  );
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.edit,
                      color: kColorYellow,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Edit",
                      style: TextStyle(
                        color: mTitleColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.ERROR,
                    animType: AnimType.RIGHSLIDE,
                    title: 'Peringatan',
                    desc: 'Yakin Ingin Menghapus ${data['nama']} ?.....',
                    btnCancelOnPress: () {},
                    btnOkOnPress: () {
                      hapusDataBarang(data['_id']);
                    },
                  ).show();
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.delete,
                      color: kColorRedSlow,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Hapus",
                      style: TextStyle(
                        color: mTitleColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: mTitleColor,
            size: 30.0,
          ),
        ),
      ),
    );
  }

  void getDataBarang() async {
    utilsApps.showDialog(context);
    try {
      response = await dio.get(getAllBarang);
      bool status = response!.data['sukses'];
      String msg = response!.data['msg'];
      if (status) {
        setState(() {
          dataBarang = response!.data['data'];
        });
      } else {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          animType: AnimType.RIGHSLIDE,
          title: 'Peringatan',
          desc: '$msg',
          btnOkOnPress: () {
            utilsApps.hideDialog(context);
          },
        ).show();
      }
    } catch (e) {
      print(e);
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.RIGHSLIDE,
        title: 'Peringatan',
        desc: 'Terjadi kesalahan pada server kami',
        btnOkOnPress: () {
          utilsApps.hideDialog(context);
        },
      ).show();
    }
  }

  void hapusDataBarang(id) async {
    utilsApps.showDialog(context);
    try {
      response = await dio.delete('$hapusBarang/$id');
      bool status = response!.data['sukses'];
      String msg = response!.data['msg'];
      if (status) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.SUCCES,
          animType: AnimType.RIGHSLIDE,
          title: 'Peringatan',
          desc: '$msg',
          btnOkOnPress: () {
            Navigator.pushNamed(context, HomeAdminScreens.routeName);
          },
        ).show();
      } else {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          animType: AnimType.RIGHSLIDE,
          title: 'Peringatan',
          desc: '$msg',
          btnOkOnPress: () {
            utilsApps.hideDialog(context);
          },
        ).show();
      }
    } catch (e) {
      print(e);
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.RIGHSLIDE,
        title: 'Peringatan',
        desc: 'Terjadi kesalahan pada server kami',
        btnOkOnPress: () {
          utilsApps.hideDialog(context);
        },
      ).show();
    }
  }
}
