import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pnu_parking/core/widgets/error_container_message.dart';
import 'package:pnu_parking/core/widgets/notification_reservation_head.dart';
import 'package:pnu_parking/feutures/reservation/presentation/view_model/reservation_cubit/reservation_cubit.dart';
import 'package:pnu_parking/feutures/reservation/presentation/views/widgets/reservation_item.dart';

class ReservationsListViewBody extends StatefulWidget {
  const ReservationsListViewBody({super.key});

  @override
  State<ReservationsListViewBody> createState() =>
      _ReservationsListViewBodyState();
}

class _ReservationsListViewBodyState extends State<ReservationsListViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ReservationCubit>(context).getReservations();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NotificationReservationHead(
          headLine: 'Reservation',
          onDelete: () {
            BlocProvider.of<ReservationCubit>(context).clearNotifications();
          },
        ),
        BlocBuilder<ReservationCubit, ReservationState>(
          builder: (context, state) {
            if (state is GetReservationSuccessState) {
              return Expanded(
                child: ListView.builder(
                  itemCount: state.reservationList.length,
                  itemBuilder: (context, index) => ReservationItem(
                    reservationModel: state.reservationList[index],
                  ),
                ),
              );
            } else if (state is GetReservationErrorState) {
              return ErrorContainerMessage(
                message: state.message,
              );
            } else if (state is GetReservationLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return const ErrorContainerMessage(
                  message: 'There no reservation yest ...');
            }
          },
        ),
      ],
    );
  }
}
