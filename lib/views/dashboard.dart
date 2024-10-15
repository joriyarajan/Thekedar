import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thekedar/controllers/dashboard_controller.dart';
import 'package:get/get.dart';

class Dashboard extends StatelessWidget {
  final DashboardController _con = Get.put(DashboardController());
  Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) => Scaffold(
          backgroundColor: Color(0xfff5f6fa),
          body: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
              },
              child: SafeArea(child: _dashboard()))),
    );
  }
  Widget _dashboard(){
    return SingleChildScrollView(
      child: Center(
        child: Text("Welcome To Dashboard!"),
      ),
    );
  }
}
