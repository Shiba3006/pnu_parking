import 'package:flutter/material.dart';
import 'package:pnu_parking/core/utils/app_colors.dart';

class TextRow extends StatelessWidget {
  const TextRow(
      {super.key,
      required this.textQuestion,
      required this.textCustomButton,
      required this.functionButton});
  final String textQuestion;
  final String textCustomButton;
  final Function() functionButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textQuestion,
            style:
                const TextStyle(color: AppColors.primaryColor, fontSize: 16)),
        TextButton(
            onPressed: functionButton,
            child: Text(textCustomButton,
                style: const TextStyle(
                    color: AppColors.primaryColor, fontSize: 16))),
      ],
    );
  }
}
