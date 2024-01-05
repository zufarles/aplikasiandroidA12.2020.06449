
import 'package:arlogi/Api/configAPI.dart';
import 'package:arlogi/Components/default_button_custome_color.dart';
import 'package:arlogi/Screens/User/HomeUserScreens.dart';
import 'package:arlogi/Screens/User/Transaksi/TransaksiScreens.dart';
import 'package:arlogi/Utils/constants.dart';
import 'package:arlogi/size_config.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';


class TransaksiForm extends StatefulWidget {
  @override
  State<TransaksiForm> createState() => _TransaksiFormState();
}

class _TransaksiFormState extends State<TransaksiForm> {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  var totalBayar = 0.0;
  var jumlahBeli = 0.0;
  var hargaBarang = TransaksiScreens.dataBarang['harga'];
  late int lamaSewa = 0;

  Response? response;
  var dio = Dio();
  @override
  Widget build(BuildContext context) {
    print(TransaksiScreens.dataBarang);
    return Form(
        child: Column(
      children: [
        Image.network(
          "$baseUrl/${TransaksiScreens.dataBarang['gambar']}",
          width: 250,
          height: 250,
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nama Barang",
                style: mTitleStyle,
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${TransaksiScreens.dataBarang['nama']}",
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10, top: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Merek",
                style: mTitleStyle,
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${TransaksiScreens.dataBarang['merek']}",
              )
            ],
          ),
        ),
                Padding(
          padding: EdgeInsets.only(left: 10, top: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Stock",
                style: mTitleStyle,
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${TransaksiScreens.dataBarang['stock']}",
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10, top: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Harga",
                style: mTitleStyle,
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${TransaksiScreens.dataBarang['harga']}",
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10, top: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Deskripsi",
                style: mTitleStyle,
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${TransaksiScreens.dataBarang['deskripsi']}",
              )
            ],
          ),
        ),
Padding(
  padding: EdgeInsets.only(left: 10, top: 3),
  child: Row(
    children: [
      ElevatedButton(
        onPressed: () async {
          DateTime? pickedStartDate = await showDatePicker(
            context: context,
            initialDate: startDate,
            firstDate: DateTime.now(),
            lastDate: DateTime(2101),
          );

          if (pickedStartDate != null && pickedStartDate != startDate) {
            setState(() {
              startDate = pickedStartDate;
              lamaSewa = endDate.difference(startDate).inDays;
            });
          }
        },
        child: Text("Hari Pengambilan"),
      ),
      SizedBox(width: 10),
      ElevatedButton(
        onPressed: () async {
          DateTime? pickedEndDate = await showDatePicker(
            context: context,
            initialDate: endDate,
            firstDate: DateTime.now(),
            lastDate: DateTime(2101),
          );

          if (pickedEndDate != null && pickedEndDate != endDate) {
            setState(() {
              endDate = pickedEndDate;
              lamaSewa = endDate.difference(startDate).inDays;
            });
          }
        },
        child: Text("Hari Pengembalian"),
      ),
    ],
  ),
),
Padding(
  padding: EdgeInsets.only(left: 10, top: 3),
  child: Row(
    children: [
      Text(
        "Lama Sewa: $lamaSewa hari",
      ),
    ],
  ),
),


        Padding(
          padding: EdgeInsets.only(left: 10, top: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Jumlah Sewa",
                style: mTitleStyle,
              )
            ],
          ),
        ),
        Padding(
            padding: EdgeInsets.only(left: 10, top: 3),
            child: SpinBox(
              min: 0,
              max: 100,
              value: 0,
              onChanged: (value) {
                setState(() {
                  jumlahBeli = value;
                  totalBayar = jumlahBeli * hargaBarang * endDate.difference(startDate).inDays;
                  lamaSewa = endDate.difference(startDate).inDays;
                });
              },
            )),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10, top: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total Harga",
                    style: mTitleStyle,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$totalBayar",
                    style: mTitleStyle,
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        DefaultButtonCustomeColor(
          color: kPrimaryColor,
          text: "Sewa",
          press: () {
            if (totalBayar <= 0 || jumlahBeli <= 0) {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.INFO,
                animType: AnimType.RIGHSLIDE,
                title: 'Peringatan',
                desc: 'Jumlah pembelian harus lebih dari 1',
                btnOkOnPress: () {},
              ).show();
            } else {
              AwesomeDialog(
                      context: context,
                      dialogType: DialogType.INFO,
                      animType: AnimType.RIGHSLIDE,
                      title: 'Peringatan',
                      desc:
                          'Yakin ingin melakukan sewa barang outdoor ${TransaksiScreens.dataBarang['nama']} ?......',
                      btnOkOnPress: () {
                        prosesTransaksi(
                            TransaksiScreens.dataBarang['_id'],
                            HomeUserScreen.dataUserLogin['_id'],
                            jumlahBeli,
                            hargaBarang,
                            lamaSewa,
                            totalBayar,
                            TransaksiScreens.dataBarang['stock'],
                            
                            );
                      },
                      btnCancelOnPress: () {})
                  .show();
            }
          },
        ),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
      ],
    ));
  }


  void prosesTransaksi(idBarang, idUser, jumlah, harga, lamaSewa, total, stock) async {
      print('lamaSewa: $lamaSewa');
    utilsApps.showDialog(context);
    bool status;
    var msg;
    if (jumlah > stock) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.INFO,
      animType: AnimType.RIGHSLIDE,
      title: 'Peringatan',
      desc: 'Jumlah sewa melebihi stok barang',
      btnOkOnPress: () {
        utilsApps.hideDialog(context);
      },
    ).show();
    return;
  }
    try {
      response = await dio.post(createTransaksi, data: {
        'idBarang': idBarang,
        'idUser': idUser,
        'jumlah': jumlah,
        'lamaSewa': lamaSewa,
        'harga': harga,
        'total': total,
 
      });

      status = response!.data['sukses'];
      msg = response!.data['msg'];
      if (status) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.SUCCES,
          animType: AnimType.RIGHSLIDE,
          title: 'Peringatan',
          desc: 'Berhasil Transaksi',
          btnOkOnPress: () {
            utilsApps.hideDialog(context);
            Navigator.pushNamed(context, HomeUserScreen.routeName,
                arguments: HomeUserScreen.dataUserLogin);
          },
        ).show();
      } else {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          animType: AnimType.RIGHSLIDE,
          title: 'Peringatan',
          desc: 'Gagal Transaksi => $msg',
          btnOkOnPress: () {
            utilsApps.hideDialog(context);
          },
        ).show();
      }
    } catch (e) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.RIGHSLIDE,
        title: 'Peringatan',
        desc: 'Terjadi Kesalahan Pada Server',
        btnOkOnPress: () {
          utilsApps.hideDialog(context);
        },
      ).show();
    }
  }
}
