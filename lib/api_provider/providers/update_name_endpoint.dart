import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;
import 'package:we_fast/services/common_loader/common_loader.dart';

import '../../views/home/navbar_screen.dart';

class UpdateNameEndpointProvider {
  Dio client;
  UpdateNameEndpointProvider({
    required this.client,
  });

  updateName(String name) async {
    CommonLoader.showLoading();
    var data = {"name": name};
    try {
      Response r = await client.put("/user/update-name", data: data);
      CommonLoader.hideLoading();
      if (r.statusCode == 200) {
        g.Get.offAll(() => NavBarScreen());
      } else {
        CommonLoader.showErrorDialog(description: r.data['error']);
      }
    } on DioError catch (e) {
      CommonLoader.hideLoading();
      CommonLoader.showErrorDialog(description: e.message);
    }
  }
}
