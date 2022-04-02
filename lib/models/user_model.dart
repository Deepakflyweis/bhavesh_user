// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.id,
    required this.phoneNumber,
    required this.name,
    this.profileImage,
  });

  String id;
  String phoneNumber;
  String name;
  String? profileImage;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        phoneNumber: json["phoneNumber"],
        name: json["name"],
        profileImage: json["profileImage"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "phoneNumber": phoneNumber,
        "name": name,
        "profileImage": profileImage,
      };
}
