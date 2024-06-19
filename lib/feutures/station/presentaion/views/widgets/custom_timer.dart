import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pnu_parking/core/utils/app_colors.dart';
import 'package:pnu_parking/feutures/station/presentaion/view_model/station_cubit/station_cubit.dart';
import 'package:pnu_parking/feutures/station/presentaion/view_model/timer_cubit/timer_cubit.dart';

class CustomTimer extends StatelessWidget {
  const CustomTimer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TimerCubit, TimerState>(
      listener: (context, state) {},
      builder: (context, state) {
        var timerCubit = BlocProvider.of<TimerCubit>(context);
        var stationCubit = BlocProvider.of<StationCubit>(context);
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 40),
              child: CircularCountDownTimer(
                isReverseAnimation: true,
                width: 150,
                height: 150,
                duration: 180,
                fillColor: Colors.red,
                ringColor: Colors.transparent,
                backgroundColor: AppColors.primaryColor,
                strokeWidth: 5.0,
                strokeCap: StrokeCap.round,
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
                textFormat: CountdownTextFormat.MM_SS,
                isReverse: true,
                autoStart: false,
                onChange: (String timeStamp) {
                  // debugPrint('Countdown Changed $timeStamp');
                  if (timeStamp == '03:00') {
                    debugPrint('Countdown = 2');
                    // send notification
                  }
                },
                onComplete: () {
                  debugPrint('Countdown Completed');
                  timerCubit.resetTimer();
                  stationCubit.cancelStation();
                },
                controller: timerCubit.countDownController,
              ),
            ),
          ],
        );
      },
    );
  }
}
