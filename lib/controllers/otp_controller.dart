import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_fast/api_provider/api_client.dart';
import 'package:we_fast/api_provider/providers/verify_otp_login_endpoint.dart';
import 'package:we_fast/api_provider/providers/verify_otp_register_endpoint.dart';
import 'package:we_fast/controllers/login_controller.dart';
import 'package:we_fast/controllers/register_controller.dart';
import 'package:we_fast/services/date_formatter.dart';
import 'package:we_fast/views/home/navbar_screen.dart';
import 'package:we_fast/views/registration/tell_us_about_screen.dart';

class OtpController extends GetxController {
  RxString elapsedTime = '01:00'.obs;
  int _start = 60;
  late Timer _timer;
  List<TextEditingController> otpControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  String _otp = "";

  void checkOtp(bool isLogin) {
    for (var element in otpControllers) {
      _otp += element.text;
    }
    if (_otp.length == 6) {
      if (isLogin) {
        dispose();
        callVerifyOtpLoginApi();
        _otp = "";
      } else {
        dispose();
        callVerifyOtpRegisterApi();
      }
    }
  }

  callVerifyOtpLoginApi() {
    Client _client = Client();
    VerifyOtpLoginEndPointProvider _verifyOtpEndPointProvider =
        VerifyOtpLoginEndPointProvider(client: _client.init());
    LoginController _loginController = Get.find();
    _verifyOtpEndPointProvider.verifyOtp(
        _loginController.mobileNumber.text, _otp);
  }

  callVerifyOtpRegisterApi() {
    Client _client = Client();
    VerifyOtpRegisterEndPointProvider _verifyOtpEndPointProvider =
        VerifyOtpRegisterEndPointProvider(client: _client.init());
    RegisterController _registerController = Get.find();
    _verifyOtpEndPointProvider.verifyOtp(
        _registerController.mobileNumber.text, _otp);
  }

  resendLoginOtp() {
    print("resend login");
    if (elapsedTime == "00:00") {
      LoginController _loginController = Get.find();
      _loginController.checkNumber();
      elapsedTime == "01:00";
      _start = 60;
      startTimer();
    }
  }

  resendRegisterOtp() {
    print("resend register");
    if (elapsedTime == "00:00") {
      RegisterController _registerController = Get.find();
      _registerController.checkNumber();
      elapsedTime == "01:00";
      _start = 60;
      startTimer();
    }
  }

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start < 1) {
        timer.cancel();
        elapsedTime.value = '00:00';
      } else {
        _start = _start - 1;
        elapsedTime.value = DateFormatter.formatSecondsToString(_start);
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
/* 
  @override
  void onClose() {
    dispose();
    super.onClose();
  } */
}
