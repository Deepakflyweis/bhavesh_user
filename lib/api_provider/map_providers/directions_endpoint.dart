import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:we_fast/constants/env.dart';
import 'package:we_fast/models/directions_model.dart';

class DirectionsEndPointProvider {
  Dio mapClient;
  DirectionsEndPointProvider({
    required this.mapClient,
  });

  Future<DirectionsModel> getDirections(
      {required String originPlaceId,
      required String destinationPlaceId}) async {
    try {
      Response r = await mapClient.get(
          "https://maps.googleapis.com/maps/api/directions/json?destination=place_id:$destinationPlaceId&origin=place_id:$originPlaceId&key=$googleMapApiKey");
      if (r.statusCode == 200) {
        return directionsModelFromJson(jsonEncode(r.data));
      } else {
        return Future.error(r.data["status"]);
      }
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  }
}
