import 'package:flutter/material.dart';
import 'package:pnu_parking/core/utils/app_colors.dart';

class SignUpTextFormField extends StatelessWidget {
  const SignUpTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.textInputType = TextInputType.text,
    this.isPassword = false,
  });
  final String hintText;
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        } else {
          return null;
        }
      },
      onChanged: (value) {
        controller.text = value;
      },
      obscureText: isPassword,
      keyboardType: textInputType,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        hintText: hintText,
        // hintTextDirection: TextDirection.,
        hintStyle: TextStyle(
          color: AppColors.primaryColor.withOpacity(0.5),
          fontSize: 14,
        ),

        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
