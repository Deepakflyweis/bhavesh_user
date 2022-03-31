import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:we_fast/api_provider/api_client.dart';
import 'package:we_fast/api_provider/providers/send_otp_for_register_endpoint.dart';
import 'package:we_fast/views/otp/otp_screen.dart';

class RegisterController extends GetxController {
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
      SendOtpRegisterEndPointProvider _registerEndPointProvider =
          SendOtpRegisterEndPointProvider(client: _client.init());
      await _registerEndPointProvider.sendOtp(mobileNumber.text);
    }
  }
}
