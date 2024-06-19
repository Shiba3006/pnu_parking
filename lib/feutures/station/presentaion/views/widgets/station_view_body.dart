import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pnu_parking/core/widgets/custom_button.dart';
import 'package:pnu_parking/feutures/reservation/presentation/view_model/reservation_cubit/reservation_cubit.dart';
import 'package:pnu_parking/feutures/station/presentaion/view_model/station_cubit/station_cubit.dart';
import 'package:pnu_parking/feutures/station/presentaion/view_model/timer_cubit/timer_cubit.dart';
import 'package:pnu_parking/feutures/station/presentaion/views/widgets/custom_timer.dart';
import 'package:pnu_parking/feutures/station/presentaion/views/widgets/station_widget.dart';

class StationViewBody extends StatefulWidget {
  const StationViewBody({super.key});

  @override
  State<StationViewBody> createState() => _StationViewBodyState();
}

class _StationViewBodyState extends State<StationViewBody> {
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 90;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 30),
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomTimer(),
            SizedBox(width: 20),
          ],
        ),
        const StationWidget(),
        const SizedBox(
          height: 20,
        ),
        CustomButton(
            title: 'RESERVE',
            onPressed: () {
              BlocProvider.of<StationCubit>(context).bookStation();
              BlocProvider.of<ReservationCubit>(context).addReservations();
              BlocProvider.of<TimerCubit>(context).startTimer();
            }),
        const SizedBox(
          height: 10,
        ),
        CustomButton(
            title: 'CANCEL',
            onPressed: () {
              BlocProvider.of<StationCubit>(context).cancelStation();
              BlocProvider.of<TimerCubit>(context).resetTimer();
            }),
      ],
    );
  }
}
