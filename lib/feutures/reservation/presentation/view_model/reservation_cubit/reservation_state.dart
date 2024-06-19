part of 'reservation_cubit.dart';

@immutable
sealed class ReservationState {}

final class ReservationInitial extends ReservationState {}

final class AddReservationLoadingState extends ReservationState {}

final class AddReservationSuccessState extends ReservationState {}

final class AddReservationErrorState extends ReservationState {
  final String message;

  AddReservationErrorState({required this.message});
}

final class GetReservationLoadingState extends ReservationState {}

final class GetReservationSuccessState extends ReservationState {
  final List<ReservationModel> reservationList;

  GetReservationSuccessState({required this.reservationList});
}

final class GetReservationErrorState extends ReservationState {
  final String message;

  GetReservationErrorState({required this.message});
}

final class ClearReservationLoadingState extends ReservationState {}

final class ClearReservationSuccessState extends ReservationState {}

final class ClearReservationErrorState extends ReservationState {
  final String message;

  ClearReservationErrorState({required this.message});
}
