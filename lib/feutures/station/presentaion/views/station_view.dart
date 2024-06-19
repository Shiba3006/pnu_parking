import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'package:pnu_parking/core/widgets/custom_alert_dialog.dart';
import 'package:pnu_parking/feutures/home/presentation/views/home_view.dart';
import 'package:pnu_parking/feutures/notification/presentation/view_model/notification_cubit/notification_cubit.dart';
import 'package:pnu_parking/feutures/station/presentaion/view_model/station_cubit/station_cubit.dart';

import 'package:pnu_parking/feutures/station/presentaion/views/widgets/station_view_body.dart';

class StationView extends StatefulWidget {
  const StationView({super.key});

  @override
  State<StationView> createState() => _StationViewState();
}

class _StationViewState extends State<StationView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NotificationCubit>(context).getMovingOnSensor();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              setState(() {});
              showDialog(
                  context: context,
                  builder: (context) {
                    return CustomAlertDialog(
                      title: 'Cancel Reservation',
                      subTitle:
                          'Are you sure you want to cancel the reservation?',
                      ifOk: () {
                        Get.offAll(() => const HomeView());
                        BlocProvider.of<StationCubit>(context).cancelStation();
                      },
                    );
                  });
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: const StationViewBody(),
        // StationViewBody(),
      ),
    );
  }
}
