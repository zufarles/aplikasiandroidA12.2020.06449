
import 'package:arlogi/Screens/Admin/Barang/DataBarangAdminScreens.dart';
import 'package:arlogi/Screens/Admin/Crud/EditBarangScreen.dart';
import 'package:arlogi/Screens/Admin/Crud/InputBarangScreen.dart';
import 'package:arlogi/Screens/Admin/HomeAdminScreens.dart';
import 'package:arlogi/Screens/Admin/Transaksi/DataTransaksiAdmin.dart';
import 'package:arlogi/Screens/Login/LoginScreens.dart';
import 'package:arlogi/Screens/Register/RegisterScreens.dart';
import 'package:arlogi/Screens/User/Barang/DataBarangScreens.dart';
import 'package:arlogi/Screens/User/HomeUserScreens.dart';
import 'package:flutter/material.dart';

import 'Screens/User/Transaksi/DataTransaksiUser.dart';
import 'Screens/User/Transaksi/TransaksiScreens.dart';
import 'Screens/User/Transaksi/UploadBuktiBayar.dart';

final Map<String, WidgetBuilder> routes = {
  // Login registrasi
  LoginScreens.routName: (context) => LoginScreens(),
  RegisterScreen.routName: (context) => RegisterScreen(),

  //routes user biasa
  HomeUserScreen.routeName: (context) => HomeUserScreen(),
  
  DataBarangScreens.routeName: (context) => DataBarangScreens(),
  TransaksiScreens.routeName: (context) => TransaksiScreens(),
  DataTransaksiScreens.routeName: (context) => DataTransaksiScreens(),
  UploadBuktiPembayaranScreens.routeName: (context) => UploadBuktiPembayaranScreens(),

  //routes admin
  HomeAdminScreens.routeName: (context) => HomeAdminScreens(),
  InputBarangScreens.routeName: (context) => InputBarangScreens(),
  EditBarangScreens.routeName: (context) => EditBarangScreens(),
  DataBarangAdminScreens.routeName: (context) => DataBarangAdminScreens(),
  DataTransaksiAdminScreens.routeName: (context) => DataTransaksiAdminScreens(),
};
