import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:we_fast/controllers/manage_profile_controller.dart';
import 'package:get/get.dart' as g;
import 'package:we_fast/models/user_model.dart';
import 'package:we_fast/services/common_loader/common_loader.dart';

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

  edituserDetails(String name, String imageUrl) async {
    CommonLoader.showLoading();
    try {
      var data = {"name": name, "profileImage": imageUrl};
      Response r = await client.put("/user", data: data);
      CommonLoader.hideLoading();
      if (r.statusCode == 200) {
        CommonLoader.showSuccessDialog(description: r.data["msg"]);
        ManageProfileController manageProfileController = g.Get.find();
        manageProfileController.callGetUserApi();
      } else {
        CommonLoader.showErrorDialog(description: r.data["error"]);
      }
    } on DioError catch (e) {
      print(e.response!.data);
      CommonLoader.hideLoading();
      CommonLoader.showErrorDialog(description: e.message);
    }
  }

  Future<String> uploadImage(String imagePath) async {
    CommonLoader.showLoading();
    try {
      var data =
          FormData.fromMap({"image": await MultipartFile.fromFile(imagePath)});
      Response r = await client.post("/image-upload", data: data);
      CommonLoader.hideLoading();
      if (r.statusCode == 200) {
        log(r.data.toString());
        CommonLoader.showSuccessDialog(description: r.data["msg"]);
        return r.data["data"]["image"];
      } else {
        CommonLoader.showErrorDialog(description: r.data["error"]);
        return Future.error(r.data['error']);
      }
    } on DioError catch (e) {
      CommonLoader.hideLoading();
      CommonLoader.showErrorDialog(description: e.message);
      return Future.error(e.message);
    }
  }
}
