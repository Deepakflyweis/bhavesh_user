import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AccountController extends GetxController {
  Rx<bool> notificationsSetting = true.obs;
  GetStorage box = GetStorage();
  changeNotificationSetting(value) {
    box.write("notificationSetting", value);
    notificationsSetting(value);
  }

  @override
  void onInit() {
    notificationsSetting.value = box.read("notificationSetting") == null
        ? true
        : box.read("notificationSetting");
    super.onInit();
  }
}
