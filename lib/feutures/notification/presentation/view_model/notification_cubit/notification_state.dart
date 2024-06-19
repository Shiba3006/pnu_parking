part of 'notification_cubit.dart';

@immutable
sealed class NotificationState {}

final class NotificationInitial extends NotificationState {}

final class GetNotificationLoadingState extends NotificationState {}

final class GetNotificationSuccessState extends NotificationState {
  final List<NotificationModel> notificationsListModel;

  GetNotificationSuccessState({required this.notificationsListModel});
}

final class GetNotificationErrorState extends NotificationState {
  final String error;

  GetNotificationErrorState({required this.error});
}

final class GetMovingOnSensorLoadingState extends NotificationState {}

final class GetMovingOnSensorSuccessState extends NotificationState {}

final class GetMovingOnSensorErrorState extends NotificationState {
  final String error;

  GetMovingOnSensorErrorState({required this.error});
}

final class GetNotificationFromMovingOnSensorLoadingState
    extends NotificationState {}

final class GetNotificationFromMovingOnSensorSuccessState
    extends NotificationState {}

final class GetNotificationFromMovingOnSensorErrorState
    extends NotificationState {
  final String error;

  GetNotificationFromMovingOnSensorErrorState({required this.error});
}

final class ClearNotificationsLoadingState extends NotificationState {}

final class ClearNotificationsSuccessState extends NotificationState {}

final class ClearNotificationsErrorState extends NotificationState {
  final String error;

  ClearNotificationsErrorState({required this.error});
}
