class UserModel {
  final String id;
  final String name;
  final String email;
  final String username;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.username,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      username: json["username"],
    );
  }

  Map<String, dynamic> json() => {"id": id, "name": name, "email": email, "username": username};
}
