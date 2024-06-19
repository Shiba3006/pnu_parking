import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:pnu_parking/core/widgets/custom_alert_dialog.dart';
import 'package:pnu_parking/feutures/home/presentation/views/widgets/custom_menu_item.dart';
import 'package:pnu_parking/feutures/notification/presentation/views/notification_view.dart';
import 'package:pnu_parking/feutures/profile/presentation/views/profile_view.dart';
import 'package:pnu_parking/feutures/reservation/presentation/views/reservation_list_view.dart';
import 'package:pnu_parking/feutures/roles/presentation/views/role_view.dart';

Future<dynamic> buildCustomMenu(BuildContext context) {
  return showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(0, 0, 0, 0),
      elevation: 0.0,
      popUpAnimationStyle: AnimationStyle(
        curve: Curves.ease,
        duration: const Duration(milliseconds: 500),
      ),
      items: [
        PopupMenuItem(
          child: CustomMenuItem(
            text: 'profile',
            icon: Icons.person,
            onPressed: () {
              Get.to(() => const ProfileView());
            },
          ),
        ),
        PopupMenuItem(
          child: CustomMenuItem(
            text: 'notification',
            icon: Icons.notifications,
            onPressed: () {
              Get.to(() => const NotificationView());
            },
          ),
        ),
        PopupMenuItem(
          child: CustomMenuItem(
            text: 'reservation',
            icon: Icons.book_online_rounded,
            onPressed: () {
              Get.to(() => const ReservationsListView());
            },
          ),
        ),
        PopupMenuItem(
          child: CustomMenuItem(
            text: 'sign out',
            icon: Icons.account_circle_rounded,
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => CustomAlertDialog(
                        title: 'Sign Out',
                        subTitle: 'Are you sure you want to sign out?',
                        ifOk: () {
                          Get.offAll(() => const RoleView());
                        },
                      ));
            },
          ),
        ),
      ]);
}
