import 'package:flutter/material.dart';
import 'package:my_helper/pages/home_page.dart';
import 'package:my_helper/routes/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homePage,
      routes: AppRoutes.routes,
    );
  }
}