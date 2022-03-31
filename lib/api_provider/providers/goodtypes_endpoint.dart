import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:we_fast/models/goods_model.dart';

class GoodTypesEndPointProvider {
  Dio client;
  GoodTypesEndPointProvider({
    required this.client,
  });

  Future<List<GoodsModel>> getGoodTypes() async {
    try {
      Response r = await client.get("/goods-type");
      if (r.statusCode == 200) {
        return goodsModelFromJson(jsonEncode(r.data['data']['goodsTypes']));
      } else {
        return Future.error(r.data['error']);
      }
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  }
}
