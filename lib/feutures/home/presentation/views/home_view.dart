import 'package:flutter/material.dart';
import 'package:pnu_parking/core/utils/app_colors.dart';
import 'package:pnu_parking/feutures/home/presentation/views/helpers/build_custom_menu.dart';
import 'package:pnu_parking/feutures/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            buildCustomMenu(context);
          },
          icon: const Icon(
            Icons.menu,
          ),
        ),
      ),
      body: const HomeViewBody(),
    );
  }
}
