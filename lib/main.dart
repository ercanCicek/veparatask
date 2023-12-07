import 'package:flutter/material.dart';
import 'package:veparatask/homepage.dart';
import 'package:veparatask/loginpage.dart';
import 'package:veparatask/v.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: V.appName,
      theme: V.themeData,
      //home: LoginPage(),
      home: LoginPage(),
    );
  }
}