import 'package:dio/dio.dart';
import 'package:we_fast/services/common_loader/common_loader.dart';
import 'package:get/get.dart' as g;
import 'package:we_fast/views/otp/otp_screen.dart';

class SendOtpRegisterEndPointProvider {
  Dio client;
  SendOtpRegisterEndPointProvider({
    required this.client,
  });
  sendOtp(String phone) async {
    CommonLoader.showLoading();
    try {
      var data = {"phoneNumber": phone};
      Response r = await client.post("/user/register", data: data);
      CommonLoader.hideLoading();
      if (r.statusMessage == "Created") {
        g.Get.to(() => OtpScreen(isLogin: false));
      } else {
        CommonLoader.showErrorDialog(description: r.data['error']);
      }
    } on DioError catch (e) {
      CommonLoader.hideLoading();
      CommonLoader.showErrorDialog(description: e.message);
    }
  }
}
