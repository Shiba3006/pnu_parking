import 'package:flutter/material.dart';
import 'package:pnu_parking/core/widgets/custom_back_btn.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title = '',
    this.isBack = true,
  });
  final String title;
  final bool isBack;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(title),
      leading: isBack ? const CustomBackButton() : const SizedBox(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
