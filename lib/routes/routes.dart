import 'package:get/get.dart';
import 'package:thekedar/views/dashboard.dart';
import 'package:thekedar/views/login.dart';
import '../views/register.dart';
var pages = [
  GetPage(name: "/", page: () => Login()),
  GetPage(name: "/register", page: () => Register()),
  GetPage(name: "/dashboard", page: () => Dashboard())
];