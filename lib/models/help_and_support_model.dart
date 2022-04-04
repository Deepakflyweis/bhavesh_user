// To parse this JSON data, do
//
//     final helpAndSupportModel = helpAndSupportModelFromJson(jsonString);

import 'dart:convert';

HelpAndSupportModel helpAndSupportModelFromJson(String str) =>
    HelpAndSupportModel.fromJson(json.decode(str));

String helpAndSupportModelToJson(HelpAndSupportModel data) =>
    json.encode(data.toJson());

class HelpAndSupportModel {
  HelpAndSupportModel({
    required this.id,
    required this.email,
    required this.address,
    required this.phoneNumber,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String email;
  String address;
  String phoneNumber;
  DateTime createdAt;
  DateTime updatedAt;

  factory HelpAndSupportModel.fromJson(Map<String, dynamic> json) =>
      HelpAndSupportModel(
        id: json["id"],
        email: json["email"],
        address: json["address"],
        phoneNumber: json["phoneNumber"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "address": address,
        "phoneNumber": phoneNumber,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
