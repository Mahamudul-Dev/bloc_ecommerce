// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  final String? userName;
  final String? email;
  final String? photoUrl;
  final String? phoneNumber;

  UserModel({
    this.userName,
    this.email,
    this.photoUrl,
    this.phoneNumber
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    userName: json["user_name"],
    email: json["email"],
    photoUrl: json["photo_url"],
    phoneNumber: json["phone_number"],
  );

  Map<String, dynamic> toJson() => {
    "user_name": userName,
    "email": email,
    "photo_url": photoUrl,
    "phone_number": phoneNumber,
  };
}
