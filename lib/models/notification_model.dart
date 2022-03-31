// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

List<NotificationModel> notificationModelFromJson(String str) =>
    List<NotificationModel>.from(
        json.decode(str).map((x) => NotificationModel.fromJson(x)));

String notificationModelToJson(List<NotificationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NotificationModel {
  NotificationModel({
    required this.id,
    required this.receiver,
    required this.sender,
    required this.message,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  Receiver receiver;
  String sender;
  String message;
  DateTime createdAt;
  DateTime updatedAt;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        id: json["id"],
        receiver: Receiver.fromJson(json["receiver"]),
        sender: json["sender"],
        message: json["message"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "receiver": receiver.toJson(),
        "sender": sender,
        "message": message,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class Receiver {
  Receiver({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory Receiver.fromJson(Map<String, dynamic> json) => Receiver(
        id: json["_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
      };
}
