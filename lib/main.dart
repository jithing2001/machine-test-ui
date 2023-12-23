import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine/view/navigation/navigation.dart';

void main(List<String> args) {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Navigation(),
      
    );
  }
}
