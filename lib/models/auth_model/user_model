class UserModel {
  final String name;
  final String email;
  final int id;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
      name: jsonData['name'],
      email: jsonData['email'],
      id: jsonData['id'],
    );
  }
}
