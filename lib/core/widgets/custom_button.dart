import 'package:flutter/material.dart';
import 'package:pnu_parking/core/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title, required this.onPressed});
  final String title;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        // padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
        minimumSize: const Size(200, 50),
        maximumSize: const Size(200, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
      ),
      child: Text(title,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Colors.white)),
    );
  }
}
