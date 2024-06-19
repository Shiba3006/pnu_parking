import 'package:flutter/material.dart';
import 'package:pnu_parking/core/widgets/logo_circle.dart';

class ProfileHead extends StatelessWidget {
  const ProfileHead({
    super.key,
    required this.firstName,
    required this.lastName,
  });
  final String firstName;
  final String lastName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const LogoCircle(radius: 50),
        const SizedBox(width: 40),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Welcome',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Row(
              children: [
                Text(
                  firstName,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(width: 3),
                Text(
                  lastName,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
