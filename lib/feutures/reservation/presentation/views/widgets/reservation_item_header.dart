
import 'package:flutter/material.dart';
import 'package:pnu_parking/core/utils/app_colors.dart';

class ReservationItemHeader extends StatelessWidget {
  const ReservationItemHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: double.infinity,
      color: AppColors.primaryColor,
      child: Center(
        child: Text(
          'Reservation',
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}
