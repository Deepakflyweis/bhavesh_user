import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:we_fast/models/notification_model.dart';
import 'package:we_fast/services/common_loader/common_loader.dart';

class NotificationEndPointProvider {
  Dio client;
  NotificationEndPointProvider({
    required this.client,
  });

  Future<List<NotificationModel>> getNotification() async {
    try {
      Response r = await client.get("/notification");
      if (r.statusCode == 200) {
        return notificationModelFromJson(
            jsonEncode(r.data["data"]["notifications"]));
      } else {
        debugPrint(r.data);
        return Future.error(r.data["Error"]);
      }
    } on DioError catch (e) {
      debugPrint(e.toString());
      return Future.error(e.message);
    }
  }

  deleteNotification(String notificationId) async {
    CommonLoader.showLoading();
    var data = {"notificationId": notificationId};
    try {
      Response r = await client.delete("/notification", data: data);
      CommonLoader.hideLoading();
      if (r.statusCode == 200) {
        CommonLoader.showSuccessDialog(description: "Notification Deleted");
      } else {
        CommonLoader.showErrorDialog(description: r.data["error"]);
      }
    } on DioError catch (e) {
      print(e.response!.data);
      CommonLoader.hideLoading();
      CommonLoader.showErrorDialog(description: e.message);
    }
  }
}
