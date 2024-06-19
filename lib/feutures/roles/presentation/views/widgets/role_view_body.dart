import 'package:flutter/material.dart';

import 'package:pnu_parking/core/utils/app_assets.dart';
import 'package:pnu_parking/core/utils/custom_navigation.dart';
import 'package:pnu_parking/core/widgets/custom_button.dart';
import 'package:pnu_parking/feutures/auth/presentation/views/sign_in_admin_view.dart';
import 'package:pnu_parking/feutures/auth/presentation/views/sign_in_view.dart';
import 'package:pnu_parking/feutures/auth/presentation/views/sign_up_view.dart';

import 'package:pnu_parking/feutures/roles/presentation/views/widgets/text_row.dart';

class RolewViewBody extends StatelessWidget {
  const RolewViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                AppAssets.kLogo,
                height: 200,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        CustomButton(
          title: 'Admin',
          onPressed: () {
            CustomNavigation.goToDownUp(widget: const SignInAdminView());
          },
        ),
        const SizedBox(height: 20),
        CustomButton(
          title: 'User',
          onPressed: () {
            CustomNavigation.goToDownUp(widget: const SignInView());
          },
        ),
        const SizedBox(height: 20),
        TextRow(
          textQuestion: 'Don\'t have an account?',
          textCustomButton: 'Sign up',
          functionButton: () {
            CustomNavigation.goToDownUp(widget: const SignUpView());
          },
        ),
       
      ],
    );
  }
}
