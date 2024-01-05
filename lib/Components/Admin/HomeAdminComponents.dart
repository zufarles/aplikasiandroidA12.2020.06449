import 'package:arlogi/Api/configAPI.dart';
import 'package:arlogi/Screens/Admin/Barang/DataBarangAdminScreens.dart';
import 'package:arlogi/Screens/Admin/Crud/EditBarangScreen.dart';
import 'package:arlogi/Screens/Admin/HomeAdminScreens.dart';
import 'package:arlogi/Screens/Admin/Transaksi/DataTransaksiAdmin.dart';
import 'package:arlogi/Utils/constants.dart';
import 'package:arlogi/size_config.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';



class HomeAdminComponent extends StatefulWidget {
  @override
  _HomeAdminComponent createState() => _HomeAdminComponent();
}

class _HomeAdminComponent extends State<HomeAdminComponent> {
  Response? response;
  var dio = Dio();
  var dataBarang;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataBarang();
  }

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
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(20)),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Layanan",
                style: mTitleStyle,
              ),
            ),
            menuLayanan(),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Data Barang input",
                style: mTitleStyle,
              ),
            ),
            Container(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: dataBarang == null ? 0 : dataBarang.length,
                itemBuilder: (BuildContext context, int index) {
                  // return cardTransaksi(dataBarang[index]);
                  return cardDataBarang(dataBarang[index]);
                },
              ),
            ),
          ],
        )),
      ),
    )));
  }
  
  Widget menuLayanan() {
    return Container(
      height: 70,
      child: Column(children: [
        Row(children: [
          Expanded(
              child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, DataBarangAdminScreens.routeName);
            },
            child: Container(
              margin: EdgeInsets.only(left: 8, right: 8),
              padding: EdgeInsets.only(left: 16),
              height: 64,
              decoration: BoxDecoration(
                  color: mFillColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: mBorderColor, width: 1)),
              child: Row(
                children: [
                  Image.network(
                      "https://cdn-icons-png.flaticon.com/128/10008/10008802.png"),
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Barang",
                          style: mServiceTitleStyle,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "List Data Barang",
                          style: mServiceSubtitleStyle,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
          Expanded(
              child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, DataTransaksiAdminScreens.routeName);
            },
            child: Container(
              margin: EdgeInsets.only(left: 8, right: 8),
              padding: EdgeInsets.only(left: 16),
              height: 64,
              decoration: BoxDecoration(
                  color: mFillColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: mBorderColor, width: 1)),
              child: Row(
                children: [
                  Image.network(
                      "https://cdn-icons-png.flaticon.com/128/3187/3187040.png"),
                      
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Transaksi",
                          style: mServiceTitleStyle,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "Data Transaksi User",
                          style: mServiceSubtitleStyle,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ))
        ])
      ]),
    );
  }


  Widget cardDataBarang(data) {
    return Card(
      elevation: 10.0,
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromARGB(255, 253, 253, 253)),
        child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: BoxDecoration(
                border: Border(
                    right: BorderSide(width: 1.0, color: Colors.white24))),
            child: Image.network('$baseUrl/${data['gambar']}'),
          ),
          title: Text(
            '${data['nama']}',
            style: TextStyle(color: mTitleColor, fontWeight: FontWeight.bold),
          ),
          subtitle: Row(children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, EditBarangScreens.routeName,
                    arguments: data);
              },
              child: Row(children: [
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
                      color: mTitleColor, fontWeight: FontWeight.bold),
                )
              ]),
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
                      hapusDataBarang('${data['_id']}');
                    }).show();
              },
              child: Row(children: [
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
                      color: mTitleColor, fontWeight: FontWeight.bold),
                )
              ]),
            )
          ]),
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
    bool status;
    var msg;
    try {
      response = await dio.get(getAllBarang);
      status = response!.data['sukses'];
      msg = response!.data['msg'];
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
            }).show();
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
          }).show();
    }
  }

  void hapusDataBarang(id) async {
    utilsApps.showDialog(context);
    bool status;
    var msg;
    try {
      response = await dio.delete('$hapusBarang/$id');
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
              // Navigator.pushAndRemoveUntil(
              //     context, HomeAdminScreens.routeName, (route) => false);
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
          desc: 'Terjadi kesalahan pada server kami',
          btnOkOnPress: () {
            utilsApps.hideDialog(context);
          }).show();
    }
  }
}
