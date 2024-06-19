class UserModel {
  final String firstName;
  final String lastName;
  final String email;
  final String id;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.id,
  });

  factory UserModel.fromJson(json) {
    return UserModel(
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      id: json['id'],
    );
  }
}
