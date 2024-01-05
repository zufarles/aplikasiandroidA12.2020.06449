import 'package:arlogi/Screens/User/Transaksi/TransaksiScreens.dart';
import 'package:arlogi/Utils/constants.dart';
import 'package:arlogi/size_config.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../Api/configAPI.dart';

class BarangComponents extends StatefulWidget {
  @override
  State<BarangComponents> createState() => _BarangComponentsState();
}

class _BarangComponentsState extends State<BarangComponents> {
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
        child: SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(20)),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: dataBarang == null ? 0 : dataBarang.length,
                itemBuilder: (BuildContext context, int index) {
                  return cardBarang(dataBarang[index]);
                },
              ),
            ),
          ],
        )),
      ),
    ));
  }

Widget cardBarang(data) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, TransaksiScreens.routeName, arguments: data);
    },
    child: Card(
      elevation: 10.0,
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(width: 1.0, color: Colors.grey),
              ),
            ),
            child: Image.network(
              '$baseUrl/${data['gambar']}',
              width: 60.0,
              height: 60.0,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            "Nama Barang: ${data['nama']}",
            style: TextStyle(color: mTitleColor, fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5.0),
              Text(
                "Merek: ${data['merek']}",
                style: TextStyle(color: mTitleColor, fontWeight: FontWeight.bold),
              ),
              Text(
                "Stock: ${data['stock']}",
                style: TextStyle(color: mTitleColor, fontWeight: FontWeight.bold),
              ),
              Text(
                "Deskripsi: ${data['deskripsi']}",
                style: TextStyle(color: mTitleColor, fontWeight: FontWeight.bold),
              ),
              Text(
                "Total Harga: Rp. ${data['harga']}",
                style: TextStyle(color: mTitleColor, fontWeight: FontWeight.bold),
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
        print(dataBarang);
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

// Fungsi untuk menghandle pembelian dan pembaruan stok
void handlePurchase(data) async {
  utilsApps.showDialog(context);
  bool status;
  var msg;
  try {
    // Sesuaikan dengan endpoint pembelian di backend Anda
    response = await dio.post('$baseUrl/purchase/${data['id']}', data: {
      'quantity': 1, // Jumlah barang yang dibeli, sesuaikan dengan kebutuhan
    });

    status = response!.data['sukses'];
    msg = response!.data['msg'];

    if (status) {
      // Refresh data barang setelah pembelian berhasil
      getDataBarang();
      AwesomeDialog(
        context: context,
        dialogType: DialogType.SUCCES,
        animType: AnimType.RIGHSLIDE,
        title: 'Sukses',
        desc: '$msg',
        btnOkOnPress: () {
          utilsApps.hideDialog(context);
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

// Widget untuk tombol pembelian di cardBarang
Widget purchaseButton(data) {
  return ElevatedButton(
    onPressed: () {
      handlePurchase(data);
    },
    child: Text('Beli'),
  );
}

// Modifikasi pada cardBarang untuk menambahkan tombol pembelian
Widget cardDataBarang(data) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, TransaksiScreens.routeName, arguments: data);
    },
    child: Card(
      elevation: 10.0,
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
        child: Container(
          child: ListTile(
            // ... Bagian lain dari cardBarang tetap sama
            trailing: Column(
              children: [
                Icon(
                  Icons.keyboard_arrow_right,
                  color: mTitleColor,
                  size: 30.0,
                ),
                purchaseButton(data),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

}
