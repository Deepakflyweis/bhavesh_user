// To parse this JSON data, do
//
//     final vehicleDetailsModel = vehicleDetailsModelFromJson(jsonString);

import 'dart:convert';

List<VehicleDetailsModel> vehicleDetailsModelFromJson(String str) => List<VehicleDetailsModel>.from(json.decode(str).map((x) => VehicleDetailsModel.fromJson(x)));

String vehicleDetailsModelToJson(List<VehicleDetailsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VehicleDetailsModel {
  VehicleDetailsModel({
    required this.title,
    required this.img,
    required this.dimensionImage,
    required this.amount,
    required this.wheels,
  });

  String title;
  String img;
  String dimensionImage;
  int amount;
  String wheels;

  factory VehicleDetailsModel.fromJson(Map<String, dynamic> json) => VehicleDetailsModel(
    title: json["title"],
    img: json["img"],
    dimensionImage: json["dimensionImage"],
    amount: json["amount"],
    wheels: json["wheels"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "img": img,
    "dimensionImage": dimensionImage,
    "amount": amount,
    "wheels": wheels,
  };
}
