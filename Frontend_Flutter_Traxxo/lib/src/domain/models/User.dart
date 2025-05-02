import 'package:transporte_carga_flutter/src/domain/models/Role.dart';

class User {
  int id;
  String name;
  String lastname;
  String email;
  String phone;
  dynamic image;
  String? notificationToken;
  List<Role> roles;

  User({
    required this.id,
    required this.name,
    required this.lastname,
    required this.email,
    required this.phone,
    required this.image,
    required this.notificationToken,
    required this.roles,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    lastname: json["lastname"],
    email: json["email"],
    phone: json["phone"],
    image: json["image"],
    notificationToken: json["notification_token"],
    roles:
        json["roles"] != null
            ? List<Role>.from(json["roles"].map((x) => Role.fromJson(x)))
            : [],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "lastname": lastname,
    "email": email,
    "phone": phone,
    "image": image,
    "notification_token": notificationToken,
    "roles":
        // ignore: unnecessary_null_comparison
        roles != null ? List<dynamic>.from(roles.map((x) => x.toJson())) : [],
  };
}
