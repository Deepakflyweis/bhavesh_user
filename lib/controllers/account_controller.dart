import 'dart:developer';

import 'package:flutter_share_me/flutter_share_me.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:we_fast/api_provider/api_client.dart';
import 'package:we_fast/api_provider/providers/user_endpoint.dart';
import 'package:we_fast/models/user_model.dart';

class AccountController extends GetxController with StateMixin<UserModel> {
  Rx<bool> notificationsSetting = true.obs;
  GetStorage box = GetStorage();
  late UserModel user;

  static const String shareLink = "www.playstore.com"; //todo change share link
  final FlutterShareMe flutterShareMe = FlutterShareMe();

  changeNotificationSetting(value) {
    box.write("notificationSetting", value);
    notificationsSetting(value);
  }

  shareToWhatsApp() async {
    try {
      String? r = await flutterShareMe.shareToWhatsApp(msg: shareLink);
      print(r!);
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  shareToFacebook() async {
    try {
      String? r = await flutterShareMe.shareToFacebook(
          url: shareLink,
          msg:
              'Check Out This Amazing App'); //todo register app on facebook to use share to facebook and setup in manifest
      print(r!);
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  shareToTwitter() async {
    try {
      String? r = await flutterShareMe.shareToTwitter(
          url: shareLink, msg: 'Check Out This Amazing App');
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  callGetUserApi () {
    Client client = Client();
    UserEndPointProvider userEndPointProvider =
        UserEndPointProvider(client: client.init());
    try {
      userEndPointProvider.getUserDetails().then((value) {
        user = value;
        change(user, status: RxStatus.success());
      }, onError: (err) {
        change(null, status: RxStatus.error(err));
      });
    } on Exception catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onInit() {
    callGetUserApi();
    notificationsSetting.value = box.read("notificationSetting") == null
        ? true
        : box.read("notificationSetting");
    super.onInit();
  }
}
