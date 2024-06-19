import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pnu_parking/core/firebase_messaging/firebase_api.dart';
import 'package:pnu_parking/core/utils/app_functions.dart';
import 'package:pnu_parking/core/utils/constants.dart';

part 'station_state.dart';

// 1:empty, 0:booked
class StationCubit extends Cubit<StationState> {
  StationCubit() : super(StationInitial());
  final _data = AppConstants.realDataReserve;
  bool? isEmpty;

  void getStationData() {
    emit(GetStationDataLoading());
    _data.onValue.listen(
      (event) {
        Map data = event.snapshot.value as Map;
        for (var element in data.keys) {
          if (element == 'ESP') {
            isEmpty = data[element] == 1 ? true : false;
          }
        }
        emit(GetStationDataSuccess());
      },
      onDone: () => emit(GetStationDataSuccess()),
      onError: (error) => emit(
        GetStationDataError(
          error: error.toString(),
        ),
      ),
    );
  }

  void bookStation() async {
    if (!isEmpty!) {
      return;
    }
    emit(BookStationLoading());
    
    await _data.update({
      'APP': 1,
    }).then((value) {
      FirebaseApi.scheduleNotificationViaFirebase(
        'RESERVATION',
        '2 minutes left until reservation is over.',
        duration: const Duration(seconds: 120), // 2 minutes 120
      ).then((value) {
        FirebaseApi.scheduleNotificationViaFirebase(
          'RESERVATION',
          'Your reservation is over.',
          duration: const Duration(seconds: 180), // 3 minutes 180
        );
      });
      AppFunctions.buildSnackBar(
        title: 'Reservation',
        message: 'The park has been reserved',
      );
      emit(BookStationSuccess());
    }).catchError((e) {
      emit(BookStationError(error: e.toString()));
    });
  }

  void cancelStation() async {
    if (isEmpty!) {
      return;
    }
    emit(CancelStationLoading());
    await _data.update({
      'APP': 0,
    }).then((value) {
      FirebaseApi.cancelScheduledNotification();
      AppFunctions.buildSnackBar(
        title: 'Reservation',
        message: 'The park has been cancelled',
      );
      emit(CancelStationSuccess());
    }).catchError((e) {
      emit(CancelStationError(error: e.toString()));
    });
  }
}
