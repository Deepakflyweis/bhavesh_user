import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:we_fast/models/help_and_support_model.dart';

class HelpEndPointProvider {
  Dio client;
  HelpEndPointProvider({
    required this.client,
  });

  Future<HelpAndSupportModel> getHelpDetails() async {
    try {
      Response r = await client.get("/help-and-support");
      if (r.statusCode == 200) {
        return helpAndSupportModelFromJson(jsonEncode(r.data["data"]));
      } else {
        return Future.error(r.data["error"]);
      }
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  }
}
