import 'package:flutter/material.dart';
import 'package:pnu_parking/feutures/profile/data/models/profile_user_model.dart';
import 'package:pnu_parking/feutures/profile/presentation/views/widgets/profle_head.dart';
import 'package:pnu_parking/feutures/profile/presentation/views/widgets/user_info_item.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key, required this.profileUserModel});
  final ProfileUserModel profileUserModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 30),
          ProfileHead(
            firstName: profileUserModel.firstName,
            lastName: profileUserModel.lastName,
          ),
          const SizedBox(height: 30),
          UserInfoItem(
            title: 'Email:',
            subTitle: profileUserModel.email,
            icon: Icons.email_rounded,
          ),
          UserInfoItem(
            title: 'ID:',
            subTitle: profileUserModel.id,
            icon: Icons.badge_outlined,
          ),

          // Spacer(),
          // CustomButton(title: 'EDIT', onPressed: () {}),
          const Spacer(),
        ],
      ),
    );
  }
}
