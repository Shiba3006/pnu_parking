part of 'station_cubit.dart';

@immutable
sealed class StationState {}

final class StationInitial extends StationState {}

final class GetStationDataLoading extends StationState {}

final class GetStationDataSuccess extends StationState {}

final class GetStationDataError extends StationState {
  final String error;

  GetStationDataError({required this.error});
}

final class BookStationLoading extends StationState {}

final class BookStationSuccess extends StationState {}

final class BookStationError extends StationState {
  final String error;
  BookStationError({required this.error});
}

final class CancelStationLoading extends StationState {}

final class CancelStationSuccess extends StationState {}

final class CancelStationError extends StationState {
  final String error;
  CancelStationError({required this.error});
}

final class GetTimeSuccess extends StationState {}
