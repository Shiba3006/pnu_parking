import 'package:flutter/material.dart';
import 'package:pnu_parking/core/utils/app_colors.dart';
import 'package:pnu_parking/feutures/auth/presentation/views/widgets/sign_up_text_form_field.dart';

class InputRowForm extends StatelessWidget {
  const InputRowForm({
    super.key,
    required this.icon,
    required this.hintText,
    required this.controller,
    this.textInputType = TextInputType.text,
    this.isPassword = false,
  });
  final IconData icon;
  final String hintText;
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        Icon(
          icon,
          color: AppColors.primaryColor,
          size: 30,
        ),
        const SizedBox(
          width: 5,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: SignUpTextFormField(
            textInputType: textInputType,
            isPassword: isPassword,
            hintText: hintText,
            controller: controller,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
