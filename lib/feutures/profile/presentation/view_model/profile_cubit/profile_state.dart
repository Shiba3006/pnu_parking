part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class GetProfileLoadingState extends ProfileState {}

final class GetProfileSuccessState extends ProfileState {
  final ProfileUserModel profileUserModel;

  GetProfileSuccessState({required this.profileUserModel});
}

final class GetProfileErrorState extends ProfileState {
  final String error;

  GetProfileErrorState({required this.error});

}
