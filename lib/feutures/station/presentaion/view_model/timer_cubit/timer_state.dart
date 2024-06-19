part of 'timer_cubit.dart';

@immutable
sealed class TimerState {}

final class TimerInitial extends TimerState {}

final class StartTimerSuccessState extends TimerState {}

final class StartTimerErrorrState extends TimerState {
  final String error;
  StartTimerErrorrState({required this.error});
}

final class ResetTimerSuccessState extends TimerState {}

final class ResetTimerErrorState extends TimerState {
  final String error;
  ResetTimerErrorState({required this.error});
}

final class ResumeTimerSuccessState extends TimerState {}

final class ResumeTimerErrorState extends TimerState {
  final String error;
  ResumeTimerErrorState({required this.error});
}

final class GetRemainingTimeSuccessState extends TimerState {}

final class GetRemainingTimeErrorState extends TimerState {
  final String error;
  GetRemainingTimeErrorState({required this.error});
}