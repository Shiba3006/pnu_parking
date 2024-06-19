import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:pnu_parking/core/widgets/logo_circle.dart';
import 'package:pnu_parking/feutures/home/presentation/views/widgets/row_request_admin.dart';
import 'package:pnu_parking/feutures/station/presentaion/views/station_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          const LogoCircle(radius: 100),
          const SizedBox(height: 150),
          RowRequestAdmin(
            onTap: () {
              Get.to(
                () => const StationView(),
                transition: Transition.rightToLeft,
              );
            },
            text: 'Station A1',
          ),
        ],
      ),
    );
  }
}
