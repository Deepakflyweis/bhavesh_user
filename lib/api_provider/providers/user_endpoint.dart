import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:we_fast/models/user_model.dart';

class UserEndPointProvider {
  Dio client;
  UserEndPointProvider({
    required this.client,
  });

  Future<UserModel> getUserDetails() async {
    try {
      Response r = await client.get("/user");
      if (r.statusCode == 200) {
        return userModelFromJson(jsonEncode(r.data["data"]["user"]));
      } else {
        return Future.error(r.data["error"]);
      }
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  }
}
