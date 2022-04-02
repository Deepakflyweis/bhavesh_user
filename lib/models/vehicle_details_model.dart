// To parse this JSON data, do
//
//     final vehicleDetailsModel = vehicleDetailsModelFromJson(jsonString);

import 'dart:convert';

List<VehicleDetailsModel> vehicleDetailsModelFromJson(String str) =>
    List<VehicleDetailsModel>.from(
        json.decode(str).map((x) => VehicleDetailsModel.fromJson(x)));

String vehicleDetailsModelToJson(List<VehicleDetailsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VehicleDetailsModel {
  VehicleDetailsModel({
    required this.id,
    required this.name,
    required this.loadWeight,
    required this.baseFare,
    required this.pricePerKm,
    required this.pricePerMin,
    required this.image,
    required this.dimensionImage,
    required this.wheels,
    required this.lowercaseName,
    required this.roadClearance,
  });

  String id;
  String name;
  int loadWeight;
  int baseFare;
  int pricePerKm;
  int pricePerMin;
  String image;
  String dimensionImage;
  int wheels;
  String lowercaseName;
  String roadClearance;

  factory VehicleDetailsModel.fromJson(Map<String, dynamic> json) =>
      VehicleDetailsModel(
        id: json["id"],
        name: json["name"],
        loadWeight: json["loadWeight"],
        baseFare: json["baseFare"],
        pricePerKm: json["pricePerKm"],
        pricePerMin: json["pricePerMin"],
        image: json["image"],
        dimensionImage: json["dimensionImage"],
        wheels: json["wheels"],
        lowercaseName: json["lowercaseName"],
        roadClearance: json["roadClearance"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "loadWeight": loadWeight,
        "baseFare": baseFare,
        "pricePerKm": pricePerKm,
        "pricePerMin": pricePerMin,
        "image": image,
        "dimensionImage": dimensionImage,
        "wheels": wheels,
        "lowercaseName": lowercaseName,
        "roadClearance": roadClearance,
      };
}
