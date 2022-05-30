import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:we_fast/constants/enums.dart';
import 'package:we_fast/models/booking_model.dart';
import 'package:we_fast/services/common_loader/common_loader.dart';
import 'package:we_fast/services/date_formatter.dart';

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

  bookNow(
      {required String vehicleTypeId,
      required String pickUpAdress,
      required String dropAddress,
      required List<double> pickUpLongLat,
      required List<double> dropLongLat,
      required Map<String, String> recieverNameNumber,
      required Map<String, String> senderNameNumber,
      required double loadweight,
      required String notes,
      required String goodsId,
      required bool labourNeeded,
      required senderReceiver paidBy}) async {
    CommonLoader.showLoading();
    var data = {
      "vehicleType": vehicleTypeId,
      "pickupAddress": pickUpAdress,
      "dropAddress": dropAddress,
      "pickupLocation": pickUpLongLat, //[100, 45],
      "dropLocation": dropLongLat, //[100, 45],
      "receiverDetails":
          recieverNameNumber, //{"name": "receiver", "phoneNumber": "8745965741"},
      "senderDetails":
          senderNameNumber, //{"name": "sender", "phoneNumber": "8741254785"},
      "loadWeight": loadweight, //20,
      "notes": notes, //"ede3ds3wdewdw",
      "goodsType": goodsId, //"62303b05b04d89f6e46e1460",
      "labourNeeded": labourNeeded, //true,
      "paidBy": paidBy.name //"receiver"
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
      print(e.response!.data);
      CommonLoader.hideLoading();
      CommonLoader.showErrorDialog(description: e.message);
    }
  }

  bookLater({
    required String vehicleTypeId,
    required String pickUpAdress,
    required String dropAddress,
    required List<double> pickUpLongLat,
    required List<double> dropLongLat,
    required Map<String, String> recieverNameNumber,
    required Map<String, String> senderNameNumber,
    required double loadweight,
    required String notes,
    required String goodsId,
    required bool labourNeeded,
    required senderReceiver paidBy,
    required DateTime pickUpDate,
    required DateTime dropDate,
  }) async {
    CommonLoader.showLoading();
    var data = {
      "vehicleType": vehicleTypeId,
      "pickupAddress": pickUpAdress,
      "dropAddress": dropAddress,
      "pickupLocation": pickUpLongLat, //[100, 45],
      "dropLocation": dropLongLat, //[100, 45],
      "receiverDetails":
          recieverNameNumber, //{"name": "receiver", "phoneNumber": "8745965741"},
      "senderDetails":
          senderNameNumber, //{"name": "sender", "phoneNumber": "8741254785"},
      "loadWeight": loadweight, //20,
      "notes": notes, //"ede3ds3wdewdw",
      "goodsType": goodsId, //"62303b05b04d89f6e46e1460",
      "labourNeeded": labourNeeded, //true,
      "paidBy": paidBy.name, //"receiver"
      "pickupDate": DateFormatter.formatToShashedDateWithoutTime(
          pickUpDate), //"2022-03-25",
      "dropDate":
          DateFormatter.formatToShashedDateWithoutTime(dropDate) //"2022-03-31"
    };
    try {
      Response r = await client.post("/booking/schedule", data: data);
      CommonLoader.hideLoading();
      if (r.statusCode == 200) {
        CommonLoader.showSuccessDialog(description: "Booked");
      } else {
        CommonLoader.showErrorDialog(description: r.data["error"]);
      }
    } on DioError catch (e) {
      print(e.response!.data);
      CommonLoader.hideLoading();
      CommonLoader.showErrorDialog(description: e.message);
    }
  }

  cancelBooking(String bookingId) async {
    CommonLoader.showLoading();
    try {
      Response r = await client.post("/booking/$bookingId/cancel");
      CommonLoader.hideLoading();
      if (r.statusCode == 200) {
        CommonLoader.showSuccessDialog(description: "Booking Cancelled");
      } else {
        CommonLoader.showErrorDialog(description: r.data["error"]);
      }
    } on DioError catch (e) {
      CommonLoader.hideLoading();
      CommonLoader.showErrorDialog(description: e.message);
    }
  }

  Future<num> getEstimatePricing(
      {required LatLng origin, required LatLng dest}) async {
    try {
      var data = {
        "origin": {"lng": origin.longitude, "lat": origin.latitude},
        "destination": {"lng": origin.longitude, "lat": dest.latitude}
      };
      Response r = await client.get("/booking/estimated-price");
      return r.data["data"]["price"];
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }
}
