import 'package:arlogi/Components/User/Transaksi/UploadBuktiPembayaran/UploadPembayaranComponent.dart';
import 'package:arlogi/Utils/constants.dart';
import 'package:arlogi/size_config.dart';
import 'package:flutter/material.dart';


class UploadBuktiPembayaranScreens extends StatelessWidget {
  static var routeName = '/upload_bukti_pembayaran';
  static var dataTransaksi;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    dataTransaksi = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Upload Bukti Bayar",
          style: TextStyle(color: mTitleColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: UploadPembayaranComponent(),
    );
  }
}
