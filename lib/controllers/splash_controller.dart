import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:we_fast/api_provider/api_client.dart';
import 'package:we_fast/views/home/navbar_screen.dart';
import 'package:we_fast/views/login/login_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Timer(const Duration(seconds: 5), () {
      checkLogin();
    });
    super.onInit();
  }

  checkLogin() async {
    GetStorage box = GetStorage();
    try {
      String? token = box.read("token");
      if (token != null) {
        Client.token = token;        
        Get.off(() => NavBarScreen());
      } else {
        Get.off(() => LoginScreen());
      }
    } on Exception catch (e) {
      Get.off(() => LoginScreen());
    }
  }
}
