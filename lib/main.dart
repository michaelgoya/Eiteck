
import 'dart:io';
import 'package:flutter/material.dart';
import 'Front/frm_Login.dart';
void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(new MaterialApp(
    home:frm_Login(),
  )
  );
}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

