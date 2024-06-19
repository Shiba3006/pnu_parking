import 'package:flutter/material.dart';
import 'package:pnu_parking/core/utils/app_colors.dart';

final themeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
  appBarTheme: const AppBarTheme(foregroundColor: AppColors.primaryColor),
  textTheme: ThemeData().textTheme.apply(
        bodyColor: AppColors.primaryColor,
        displayColor: AppColors.primaryColor,
      ),
  useMaterial3: true,
);
