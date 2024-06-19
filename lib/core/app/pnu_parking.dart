import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pnu_parking/core/app/my_material_app.dart';
import 'package:pnu_parking/feutures/auth/presentation/view_model/sign_in_cubit/sign_in_cubit.dart';
import 'package:pnu_parking/feutures/auth/presentation/view_model/sign_up_cubit/sigu_up_cubit.dart';
import 'package:pnu_parking/feutures/home/presentation/view_models/add_parking_cubit/add_parking_cubit.dart';
import 'package:pnu_parking/feutures/notification/presentation/view_model/notification_cubit/notification_cubit.dart';
import 'package:pnu_parking/feutures/profile/presentation/view_model/profile_cubit/profile_cubit.dart';
import 'package:pnu_parking/feutures/reservation/presentation/view_model/reservation_cubit/reservation_cubit.dart';

import 'package:pnu_parking/feutures/station/presentaion/view_model/station_cubit/station_cubit.dart';
import 'package:pnu_parking/feutures/station/presentaion/view_model/timer_cubit/timer_cubit.dart';

class PnuParking extends StatelessWidget {
  const PnuParking({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => StationCubit()..getStationData(),
        ),
        BlocProvider(
          create: (context) => SignUpCubit(),
        ),
        BlocProvider(
          create: (context) => SignInCubit(),
        ),
        BlocProvider(
          create: (context) => TimerCubit(),
        ),
        BlocProvider(
          create: (context) => ProfileCubit()..getUserData(),
        ),
        BlocProvider(
          create: (context) => NotificationCubit()
            ..getNotificationsFromFirestore()
            ..getMovingOnSensor(),
        ),
        BlocProvider(
          create: (context) => ReservationCubit()..getReservations(),
        ),
        BlocProvider(
          create: (context) => AddParkingCubit(),
        ),
      ],
      child: const MyMaterialApp(),
    );
  }
}
