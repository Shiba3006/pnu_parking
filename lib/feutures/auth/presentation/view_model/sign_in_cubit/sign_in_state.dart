part of 'sign_in_cubit.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}

final class SignInLoadingState extends SignInState {}

final class SignInSuccessState extends SignInState {}

final class SignInErrorState extends SignInState {
  final String error;

  SignInErrorState({required this.error});
}

final class SignInAdminLoadingState extends SignInState {}

final class SignInAdminSuccessState extends SignInState {}

final class SignInAdminNotAllowedState extends SignInState {}

final class SignInAdminErrorState extends SignInState {
  final String error;

  SignInAdminErrorState({required this.error});
}

// final class CheckUserRoleLoadingState extends SignInState {}

// final class CheckUserRoleSuccessState extends SignInState {
//   final String role;

//   CheckUserRoleSuccessState({required this.role});
// }

// final class CheckUserRoleErrorState extends SignInState {
//   final String error;

//   CheckUserRoleErrorState({required this.error});
// }
