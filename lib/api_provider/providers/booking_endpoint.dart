import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:we_fast/models/booking_model.dart';
import 'package:we_fast/services/common_loader/common_loader.dart';

class BookingEndPointProvider {
  Dio client;

  BookingEndPointProvider({
    required this.client,
  });

  Future<List<BookingModel>> getAllBookings() async {
    try {
      Response r = await client.get("/booking");
      if (r.statusCode == 200) {
        return bookingModelFromJson(jsonEncode(r.data["data"]["bookings"]));
      } else {
        return Future.error(r.data["error"]);
      }
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  }

  bookNow() async {
    CommonLoader.showLoading();
    var data = {
      "vehicleType": "622b3a452c0469dab43fc7af",
      "pickupAddress": "etretret4e",
      "dropAddress": "erewr",
      "pickupLocation": [100, 45],
      "dropLocation": [100, 45],
      "receiverDetails": {"name": "receiver", "phoneNumber": "8745965741"},
      "senderDetails": {"name": "sender", "phoneNumber": "8741254785"},
      "loadWeight": 20,
      "notes": "ede3ds3wdewdw",
      "goodsType": "62303b05b04d89f6e46e1460",
      "labourNeeded": true,
      "paidBy": "receiver"
    };
    try {
      Response r = await client.post("/booking", data: data);
      CommonLoader.hideLoading();
      if (r.statusCode == 200) {
        CommonLoader.showSuccessDialog(description: "Booked");
      } else {
        CommonLoader.showErrorDialog(description: r.data["error"]);
      }
    } on DioError catch (e) {
      CommonLoader.showErrorDialog(description: e.message);
    }
  }

  bookLater() async {
    CommonLoader.showLoading();
    var data = {
      "vehicleType": "622b3a452c0469dab43fc7af",
      "pickupAddress": "etretret4e",
      "dropAddress": "erewr",
      "pickupLocation": [100, 45],
      "dropLocation": [100, 45],
      "receiverDetails": {"name": "receiver", "phoneNumber": "8745965741"},
      "senderDetails": {"name": "sender", "phoneNumber": "8741254785"},
      "loadWeight": 20,
      "notes": "ede3ds3wdewdw",
      "goodsType": "62303b05b04d89f6e46e1460",
      "labourNeeded": true,
      "paidBy": "receiver",
      "pickupDate": "2022-03-25",
      "dropDate": "2022-03-31"
    };
    try {
      Response r = await client.post("/booking", data: data);
      CommonLoader.hideLoading();
      if (r.statusCode == 200) {
        CommonLoader.showSuccessDialog(description: "Booked");
      } else {
        CommonLoader.showErrorDialog(description: r.data["error"]);
      }
    } on DioError catch (e) {
      CommonLoader.showErrorDialog(description: e.message);
    }
  }
}
