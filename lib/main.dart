import 'package:flutter/material.dart';
import 'package:thekedar/routes/routes.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: ThemeData(fontFamily: 'open_sans_regular'),
        title: 'Thekedar',
        debugShowCheckedModeBanner: false,
        getPages: pages,
        initialRoute: "/",
    );
  }
}

