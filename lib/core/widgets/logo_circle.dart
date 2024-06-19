import 'package:flutter/material.dart';
import 'package:pnu_parking/core/utils/app_assets.dart';

class LogoCircle extends StatelessWidget {
  const LogoCircle({
    super.key,
    required this.radius,
  });
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: const AssetImage(
        AppAssets.kLogo,
      ),
    );
  }
}
