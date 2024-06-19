import 'package:flutter/material.dart';
import 'package:pnu_parking/core/utils/app_colors.dart';

class UserInfoItem extends StatelessWidget {
  const UserInfoItem({
    super.key,
    required this.subTitle,
    required this.icon,
    required this.title,
  });
  final String title;
  final String subTitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Icon(icon, size: 32, color: AppColors.primaryColor),
          const SizedBox(width: 10),
          Text(title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.black,
                  )),
          const SizedBox(width: 3),
          Text(subTitle, style: Theme.of(context).textTheme.titleMedium),
        ],
      ),
    );
  }
}
