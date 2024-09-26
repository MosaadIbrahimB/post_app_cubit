class UserModel {
  String id;
  String email;
  String name;
  String age;

  UserModel(
      {this.id = '',
        required this.email,
        required this.name,
        required this.age,
    });

  factory UserModel.from(Map<String, dynamic> json) => UserModel(
      id: json["id"],
      email: json["email"],
      name: json["name"],
      age: json["age"],
      );

  Map<String, dynamic> toJson() =>
      {"id": id, "email": email, "name": name, "age": age};
}
