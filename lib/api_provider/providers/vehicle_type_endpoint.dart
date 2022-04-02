import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:we_fast/models/vehicle_details_model.dart';

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
}
