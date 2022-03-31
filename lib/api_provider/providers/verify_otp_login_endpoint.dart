import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:we_fast/api_provider/api_client.dart';
import 'package:we_fast/services/common_loader/common_loader.dart';
import 'package:get/get.dart' as g;
import 'package:we_fast/views/home/navbar_screen.dart';
import 'package:we_fast/views/registration/tell_us_about_screen.dart';

class VerifyOtpLoginEndPointProvider {
  Dio client;
  VerifyOtpLoginEndPointProvider({
    required this.client,
  });

  verifyOtp(String phone, String otp) async {
    CommonLoader.showLoading();
    try {
      var data = {"phoneNumber": phone, "otp": otp};
      Response r = await client.post("/user/login-otp", data: data);
      CommonLoader.hideLoading();
      if (r.statusMessage == "OK") {
        print(r.data);
        GetStorage box = GetStorage();
        String token = r.data['data']['loginToken'];
        await box.write("token", token);
        Client.token = token;
        if (r.data["data"]["signupProcessCompleted"] &&
            r.data["data"]["deliveryprefrencesCompleted"]) {
          g.Get.offAll(() => NavBarScreen());
        } else {
          g.Get.offAll(() => TellUsAboutScreen());
        }
      } else {
        CommonLoader.showErrorDialog(description: r.data['error']);
      }
    } on DioError catch (e) {
      CommonLoader.hideLoading();
      CommonLoader.showErrorDialog(description: e.message);
    }
  }
}
