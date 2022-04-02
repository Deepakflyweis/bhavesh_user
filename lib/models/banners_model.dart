// To parse this JSON data, do
//
//     final bannersModel = bannersModelFromJson(jsonString);

import 'dart:convert';

List<BannersModel> bannersModelFromJson(String str) => List<BannersModel>.from(
    json.decode(str).map((x) => BannersModel.fromJson(x)));

String bannersModelToJson(List<BannersModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BannersModel {
  BannersModel({
    required this.id,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String image;
  DateTime createdAt;
  DateTime updatedAt;

  factory BannersModel.fromJson(Map<String, dynamic> json) => BannersModel(
        id: json["_id"],
        image: json["image"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "image": image,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
