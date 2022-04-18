import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:we_fast/api_provider/map_client.dart';
import 'package:we_fast/constants/env.dart';
import 'package:we_fast/models/places_model.dart';

class PlaceEndPointProvider {
  Dio mapClient;
  PlaceEndPointProvider({
    required this.mapClient,
  });

  Future<List<PlacesModel>> getPlace(String searchText) async {
    try {
      Response r = await mapClient
          .get("/place/textsearch/json?query=$searchText&key=$googleMapApiKey");
      if (r.statusCode == 200) {        
        return placesModelFromJson(jsonEncode(r.data["results"]));
      } else {
        return Future.error(r.data["status"]);
      }
    } on DioError catch (e) {
      print(e.response!.data);
      return Future.error(e.message);
    }
  }
}
