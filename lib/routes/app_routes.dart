import 'package:flutter/material.dart';
import 'package:my_helper/pages/custom_app_bar.dart';
import 'package:my_helper/pages/home_page.dart';
import 'package:my_helper/pages/list_page.dart';
import 'package:my_helper/pages/painter_page.dart';

abstract class AppRoutes {
  static final homePage = '/home_page';
  static final listPage = '/list_page';
  static final painterPage = '/painter_page';
  static final appBarPage = '/app_bar_page';

  static final routes = {
    AppRoutes.homePage: (BuildContext context) => HomePage(),
    AppRoutes.listPage: (BuildContext context) => ListPage(),
    AppRoutes.painterPage: (BuildContext context) => PainterPage(),
    AppRoutes.appBarPage: (BuildContext context) => CustomAppBar(),
  };
}