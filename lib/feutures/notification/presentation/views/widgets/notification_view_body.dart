import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pnu_parking/core/widgets/error_container_message.dart';
import 'package:pnu_parking/core/widgets/notification_reservation_head.dart';
import 'package:pnu_parking/feutures/notification/presentation/view_model/notification_cubit/notification_cubit.dart';
import 'package:pnu_parking/feutures/notification/presentation/views/widgets/notification_item.dart';

class NotificationViewBody extends StatefulWidget {
  const NotificationViewBody({super.key});

  @override
  State<NotificationViewBody> createState() => _NotificationViewBodyState();
}

class _NotificationViewBodyState extends State<NotificationViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotificationCubit>(context).getNotificationsFromFirestore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NotificationReservationHead(
          headLine: 'Notifications',
          onDelete: () {
            BlocProvider.of<NotificationCubit>(context).clearNotifications();
          },
        ),
        const SizedBox(height: 20),
        BlocBuilder<NotificationCubit, NotificationState>(
          builder: (context, state) {
            if (state is GetNotificationSuccessState) {
              if (state.notificationsListModel.isEmpty) {
                return const ErrorContainerMessage(
                  message: 'No Notifications yet ...',
                );
              } else {
                return Expanded(
                  child: ListView.separated(
                    itemCount: state.notificationsListModel.length,
                    itemBuilder: (context, index) {
                      return NotificationItem(
                        title: state.notificationsListModel[index].title,
                        body: state.notificationsListModel[index].body,
                        time: state.notificationsListModel[index].timestamp
                            .toDate(),
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(
                      color: Colors.black,
                      thickness: 4,
                    ),
                  ),
                );
              }
            } else if (state is GetNotificationErrorState) {
              return ErrorContainerMessage(
                message: state.error,
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ],
    );
  }
}
