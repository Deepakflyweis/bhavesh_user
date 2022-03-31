// To parse this JSON data, do
//
//     final goodsModel = goodsModelFromJson(jsonString);

import 'dart:convert';

List<GoodsModel> goodsModelFromJson(String str) =>
    List<GoodsModel>.from(json.decode(str).map((x) => GoodsModel.fromJson(x)));

String goodsModelToJson(List<GoodsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GoodsModel {
  GoodsModel({
    required this.id,
    required this.name,
    required this.description,
    required this.lowercaseName,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String name;
  String description;
  String lowercaseName;
  DateTime createdAt;
  DateTime updatedAt;

  factory GoodsModel.fromJson(Map<String, dynamic> json) => GoodsModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        lowercaseName: json["lowercaseName"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "lowercaseName": lowercaseName,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
