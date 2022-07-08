import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;
import 'package:we_fast/controllers/estimated_all_controller.dart';

import 'package:we_fast/models/estimated_price_all.dart';
import 'package:we_fast/models/vehicle_details_model.dart';
import 'package:we_fast/services/common_loader/common_loader.dart';

class VehicleTypeEndPointProvider {
  Dio client;
  VehicleTypeEndPointProvider({
    required this.client,
  });

  Future<List<VehicleDetailsModel>> getVehicleType() async {
    try {
      Response r = await client.get("/vehicle-type");
      if (r.statusCode == 200) {
        return vehicleDetailsModelFromJson(
            jsonEncode(r.data["data"]["vehicleTypes"]));
      } else {
        return Future.error(r.data["error"]);
      }
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  }

  // Future<num> getEstimatedPriceAll({
  //   required LatLng origin,
  //   required LatLng dest,
  // }) async {
  //   try {
  //     var data = {
  //       "origin": {"lng": origin.longitude, "lat": origin.latitude},
  //       "destination": {"lng": origin.longitude, "lat": dest.latitude},
  //     };
  //     Response r = await client.get("/booking/estimated-price/all");
  //     return r.data["data"]["vehicleTypes"];
  //   } on Exception catch (e) {
  //     return Future.error(e.toString());
  //   }
  // }

  Future<List<EstimatedAllModel>> getEstimatedPriceAll() async {
    final queryOrigin = {
      "lng": 77.38321095663733,
      "lat": 28.62735646099092,
    };

    final queryDest = {
      "lng": 77.11966773716995,
      "lat": 28.639175690474243,
    };
    var data = {
      "origin": {"lng": 77.38321095663733, "lat": 28.62735646099092},
      "destination": {"lng": 77.11966773716995, "lat": 28.639175690474243}
    };
    // final uri = Uri.https( "https://we-fast-flyweis.herokuapp.com/booking/estimated-price/all", queryOrigin.toString(), queryDest);
    // Response r = await client.get(uri.toString());
    try {
      Response r =
          await client.post("/booking/estimated-price/all", data: data);
      log("r ${r.data}");
      if (r.statusCode == 200) {
        EstimatedAllController().isValue = true.obs;
        print(EstimatedAllController().isValue);
        return estimatedAllModelFromJson(
            jsonEncode(r.data["data"]["vehicleTypes"]));
      } else {
        return Future.error(r.data["error"]);
      }
    } on DioError catch (e) {
      print(e.response!.data);
      return Future.error(e.message);
    }
  }

  getPriceAll() async {
    final queryOrigin = {"lng": 77.38321095663733, "lat": 28.62735646099092};
    final queryDest = {"lng": 77.11966773716995, "lat": 28.639175690474243};
    CommonLoader.showLoading();
    var data = {
      "origin": {"lng": 77.38321095663733, "lat": 28.62735646099092},
      "destination": {"lng": 77.11966773716995, "lat": 28.639175690474243}
    };
    //  var data = {
    //    "origin": queryOrigin,
    //   "destination": queryDest
    //   };

    try {
      Response r =
          await client.post("/booking/estimated-price/all", data: data);
      CommonLoader.hideLoading();
      if (r.statusCode == 200) {
        CommonLoader.showSuccessDialog(description: r.data["msg"]);
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
