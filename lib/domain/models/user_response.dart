import 'dart:convert';

UserResponse userResponseFromJson(String str) =>
    UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
  final int? statusCode;
  final String? message;
  final User? data;

  UserResponse({
    this.statusCode,
    this.message,
    this.data,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        statusCode: json["status_code"],
        message: json["message"],
        data: json["data"] == null ? null : User.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "message": message,
        "data": data?.toJson(),
      };
}

class User {
  final int? id;
  final String? username;
  final String? fullname;
  final String? email;
  final String? phone;
  final String? avatar;

  User({
    this.id,
    this.username,
    this.fullname,
    this.email,
    this.phone,
    this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        fullname: json["fullname"],
        email: json["email"],
        phone: json["phone"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "fullname": fullname,
        "email": email,
        "phone": phone,
        "avatar": avatar,
      };
}
