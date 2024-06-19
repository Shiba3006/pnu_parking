import 'package:bloc/bloc.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

import 'package:meta/meta.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(TimerInitial());
  CountDownController countDownController = CountDownController();
  void startTimer() {
    try {
      countDownController.start();
      emit(StartTimerSuccessState());
    } catch (e) {
      emit(StartTimerErrorrState(error: e.toString()));
    }
  }

  void resetTimer() {
    try {
      countDownController.reset();
      emit(ResetTimerSuccessState());
    } catch (e) {
      emit(ResetTimerErrorState(error: e.toString()));
    }
  }
}
