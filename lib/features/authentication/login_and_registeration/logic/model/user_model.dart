class UserModel {
  final String name;

  UserModel(this.name);

  factory UserModel.fromJson(Map<String, dynamic>? json) =>
      UserModel(json?['name'] ?? "No Name");

  Map<String, dynamic> toMap() => {
        "user_name": name,
      };
}
