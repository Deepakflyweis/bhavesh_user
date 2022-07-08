
// To parse this JSON data, do
//
//     final estimatedAllModel = estimatedAllModelFromJson(jsonString);

import 'dart:convert';

List<EstimatedAllModel> estimatedAllModelFromJson(String str) => List<EstimatedAllModel>.from(json.decode(str).map((x) => EstimatedAllModel.fromJson(x)));

String estimatedAllModelToJson(List<EstimatedAllModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EstimatedAllModel {
    EstimatedAllModel({
        required this.id,
        required this.name,
        this.loadWeight,
        this.baseFare,
        this.pricePerKm,
        this.pricePerMin,
        required this.image,
        this.dimensionImage,
        this.wheels,
        this.lowercaseName,
        this.roadClearance,
        this.createdAt,
        this.updatedAt,
        this.v,
        required this.estimatedPrice,
    });

    String id;
    String name;
    int ? loadWeight;
    int ? baseFare;
    int ? pricePerKm;
    int ? pricePerMin;
    String image;
    String ? dimensionImage;
    int ? wheels;
    String ? lowercaseName;
    String ? roadClearance;
    DateTime ? createdAt;
    DateTime ? updatedAt;
    int ? v;
    double estimatedPrice;

    factory EstimatedAllModel.fromJson(Map<String, dynamic> json) => EstimatedAllModel(
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
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["v"],
        estimatedPrice:json['estimatedPrice']!=null? json["estimatedPrice"].toDouble():0.0,
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
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "v": v,
        "estimatedPrice": estimatedPrice,
    };
}
