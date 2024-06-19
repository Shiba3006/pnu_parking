class ProfileUserModel {
  final String firstName;
  final String lastName;
  final String email;
  final String id;
  final String token;

  ProfileUserModel(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.id,
      required this.token});
}
