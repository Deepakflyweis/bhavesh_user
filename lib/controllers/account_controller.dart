import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:we_fast/api_provider/api_client.dart';
import 'package:we_fast/api_provider/providers/user_endpoint.dart';
import 'package:we_fast/models/user_model.dart';

class AccountController extends GetxController with StateMixin<UserModel> {
  Rx<bool> notificationsSetting = true.obs;
  GetStorage box = GetStorage();
  late UserModel user;
  changeNotificationSetting(value) {
    box.write("notificationSetting", value);
    notificationsSetting(value);
  }

  callGetUserApi() {
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
