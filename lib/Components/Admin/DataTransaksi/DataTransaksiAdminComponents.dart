import 'package:arlogi/Api/configAPI.dart';
import 'package:arlogi/Screens/User/Transaksi/UploadBuktiBayar.dart';
import 'package:arlogi/Utils/constants.dart';
import 'package:arlogi/size_config.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DataTransaksiAdminComponents extends StatefulWidget {
  @override
  State<DataTransaksiAdminComponents> createState() =>
      _DataTransaksiAdminComponentsState();
}

class _DataTransaksiAdminComponentsState
    extends State<DataTransaksiAdminComponents> {
  Response? response;
  Dio dio = Dio();
  List<Map<String, dynamic>> dataTransaksi = [];

  @override
  void initState() {
    super.initState();
    getTransaksiUser();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenHeight(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var transaksi in dataTransaksi) CardTransaksi(transaksi),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget CardTransaksi(Map<String, dynamic> data) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          UploadBuktiPembayaranScreens.routeName,
          arguments: data,
        );
      },
      child: Card(
        elevation: 10.0,
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
          child: ListTile(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: buildLeadingImage(data),
            title: Text(
              "${data['idUser']}",
              style: TextStyle(
                color: mTitleColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: buildSubtitle(data),
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

  Widget buildLeadingImage(Map<String, dynamic> data) {
    return Container(
      padding: EdgeInsets.only(right: 12.0),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(width: 1.0, color: Colors.white24),
        ),
      ),
      child: Image.asset(
        'assets/images/sample_image.jpg', // Replace with the correct image path
      ),
    );
  }

  Widget buildSubtitle(Map<String, dynamic> data) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildText("Nama User", "${data['username']}"),
        buildText("Lama Sewa", "${data['lamaSewa']} hari"),
        buildText("Harga", "Rp. ${data['harga']}"),
        buildText("Jumlah Sewa", "${data['jumlah']}"),
        buildText("Total", "Rp. ${data['total']}"),
        buildStatusText(
          data['status'] == 0 ? "Pending" : "Berhasil",
          data['status'] == 0 ? kColorYellow : kPrimaryColor,
        ),
      ],
    );
  }

  Widget buildText(String judul, String nilai) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          judul,
          style: TextStyle(
            color: mTitleColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(nilai),
      ],
    );
  }

  Widget buildStatusText(String status, Color warna) {
    return Text(
      status,
      style: TextStyle(
        color: warna,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  void getTransaksiUser() async {
    try {
      utilsApps.showDialog(context);

      // Replace 'idUser yang sedang login' with the appropriate logic to get the ID of the logged-in user
      String idUser = 'idUser';

      response = await dio.get('$getTransaksiUserLimit?idUser=$idUser');
      bool status = response!.data['sukses'];
      var msg = response!.data['msg'];

      if (status) {
        setState(() {
          dataTransaksi = List<Map<String, dynamic>>.from(
            response!.data['data'],
          );
        });
      } else {
        showErrorDialog(msg);
      }
    } catch (e) {
      print(e);
      showErrorDialog('Terjadi kesalahan pada server kami');
    } finally {
      utilsApps.hideDialog(context);
    }
  }

  void showErrorDialog(String pesanError) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.ERROR,
      animType: AnimType.rightSlide,
      title: 'Peringatan',
      desc: pesanError,
      btnOkOnPress: () {
        utilsApps.hideDialog(context);
      },
    ).show();
  }
}
