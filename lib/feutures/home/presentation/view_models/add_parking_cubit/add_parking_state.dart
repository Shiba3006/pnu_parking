part of 'add_parking_cubit.dart';

@immutable
sealed class AddParkingState {}

final class AddParkingInitial extends AddParkingState {}

final class AddParkingLoadingState extends AddParkingState {}

final class AddParkingSuccessState extends AddParkingState {}

final class AddParkingErrorState extends AddParkingState {
  final String error;
  AddParkingErrorState({required this.error});
}
