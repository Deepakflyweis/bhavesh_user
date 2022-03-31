import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:we_fast/api_provider/api_client.dart';
import 'package:we_fast/services/common_loader/common_loader.dart';
import 'package:get/get.dart' as g;
import 'package:we_fast/views/home/navbar_screen.dart';

import '../../views/registration/tell_us_about_screen.dart';

class VerifyOtpRegisterEndPointProvider {
  Dio client;
  VerifyOtpRegisterEndPointProvider({
    required this.client,
  });

  verifyOtp(String phone, String otp) async {
    CommonLoader.showLoading();
    try {
      var data = {"phoneNumber": phone, "otp": otp};
      Response r = await client.post("/user/registration-otp", data: data);
      CommonLoader.hideLoading();
      if (r.statusMessage == "OK") {
        print(r.data);
        GetStorage box = GetStorage();
        String token = r.data['data']['loginToken'];
        await box.write("token", token);
        Client.token = token;
        g.Get.offAll(() => TellUsAboutScreen());
      } else {
        CommonLoader.showErrorDialog(description: r.data['error']);
      }
    } on DioError catch (e) {
      CommonLoader.hideLoading();
      CommonLoader.showErrorDialog(description: e.message);
    }
  }
}
