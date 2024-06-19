import 'package:flutter/material.dart';
import 'package:pnu_parking/core/utils/app_colors.dart';

class NotificationReservationHead extends StatelessWidget {
  const NotificationReservationHead({
    super.key,
    required this.headLine, required this.onDelete,
  });
  final String headLine;
  final Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      color: AppColors.primaryColor,
      child: Stack(
        children: [
          Positioned(
            right: 10,
            top: 20,
            child: IconButton(
              icon: const Icon(
                Icons.delete_forever_outlined,
                color: Colors.white,
              ),
              onPressed: onDelete,
            ),
          ),
          Positioned(
            left: 15,
            top: 20,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Positioned(
            left: 70,
            top: 80,
            child: Text(headLine,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
