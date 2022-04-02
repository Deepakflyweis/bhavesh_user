import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:we_fast/models/banners_model.dart';

class BannersEndPointProvider {
  Dio client;
  BannersEndPointProvider({
    required this.client,
  });

  Future<List<BannersModel>> getBanners() async {
    try {
      Response r = await client.get("/banner");
      if (r.statusCode == 200) {
        return bannersModelFromJson(jsonEncode(r.data["data"]["banners"]));
      } else {
        return Future.error(r.data["error"]);
      }
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  }
}
