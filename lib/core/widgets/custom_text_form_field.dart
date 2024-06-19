import 'package:flutter/material.dart';
import 'package:pnu_parking/core/utils/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.textInputType = TextInputType.text,
    this.isPassword = false,
    required this.onChanged,
  });
  final String hintText;
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool isPassword;
  final Function(String) onChanged;
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
      onChanged: onChanged,
      obscureText: isPassword,
      keyboardType: textInputType,
      style: const TextStyle(color: Colors.white),
      cursorColor: Colors.white.withOpacity(0.6),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.primaryColor,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 25,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.white.withOpacity(0.6),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
