import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pnu_parking/core/app/app_theme_data.dart';
import 'package:pnu_parking/feutures/roles/presentation/views/role_view.dart';

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: const RoleView(),
    );
  }
}
