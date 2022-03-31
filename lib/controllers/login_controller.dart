import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:we_fast/api_provider/api_client.dart';
import 'package:we_fast/api_provider/providers/send_otp_for_login_endpoint.dart';
import 'package:we_fast/views/otp/otp_screen.dart';

class LoginController extends GetxController {
  TextEditingController mobileNumber = TextEditingController();
  GlobalKey<FormState> numberKey = GlobalKey();

  String? numberValidator(value) {
    if (value!.length != 10) {
      return "Enter Valid Number";
    }
    return null;
  }

  checkNumber() async {
    if (numberKey.currentState!.validate()) {
      Client _client = Client();
      SendOtpLoginEndPointProvider _loginEndPointProvider =
          SendOtpLoginEndPointProvider(client: _client.init());
      await _loginEndPointProvider.sendOtp(mobileNumber.text);
    }
  }
}
