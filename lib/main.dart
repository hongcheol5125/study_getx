import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_getx/page/simple_home_page.dart';

void main() {
  runApp(const GetMaterialApp(
    home: MyApp()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}