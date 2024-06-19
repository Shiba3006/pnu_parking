import 'package:flutter/material.dart';
import 'package:pnu_parking/feutures/notification/presentation/views/widgets/reservation_info_item.dart';
import 'package:pnu_parking/feutures/reservation/data/models/reservation_model.dart';
import 'package:pnu_parking/feutures/reservation/presentation/views/widgets/reservation_item_header.dart';

class ReservationItem extends StatelessWidget {
  const ReservationItem({
    super.key,
    required this.reservationModel,
  });
  final ReservationModel reservationModel;

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const ReservationItemHeader(),
          const SizedBox(
            height: 10,
          ),
          const ReservationInfoItem(
            title: 'Station:',
            subTitle: 'A2',
          ),
          ReservationInfoItem(
            title: 'Time:',
            subTitle:
                '${reservationModel.time.toDate().year}/${reservationModel.time.toDate().month}/${reservationModel.time.toDate().day} at: ${reservationModel.time.toDate().hour}:${reservationModel.time.toDate().minute}:${reservationModel.time.toDate().second}',
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
