import 'package:we_fast/api_provider/api_client.dart';
import 'package:we_fast/api_provider/providers/notification_endpoint.dart';
import 'package:we_fast/controllers/account_controller.dart';
import 'package:we_fast/essentails.dart';
import 'package:we_fast/models/notification_model.dart';
import 'package:we_fast/services/common_loader/common_loader.dart';

class NotificationController extends GetxController
    with StateMixin<List<NotificationModel>> {
  callDeleteNotificationApi(String notificationId) async {
    try {
      Client _client = Client();
      NotificationEndPointProvider _notificationEndPointProvider =
          NotificationEndPointProvider(client: _client.init());
      await _notificationEndPointProvider.deleteNotification(notificationId);
      callGetNotificationApi();
    } on Exception catch (e) {
      // TODO
    }
  }

  callGetNotificationApi() {
    try {
      Client _client = Client();
      NotificationEndPointProvider _notificationEndPointProvider =
          NotificationEndPointProvider(client: _client.init());
      _notificationEndPointProvider.getNotification().then((value) {
        if (value.isNotEmpty) {
          change(value, status: RxStatus.success());
        } else {
          change(null, status: RxStatus.empty());
        }
      }, onError: (err) {
        change(null, status: RxStatus.error(err));
      });
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onInit() {
    AccountController _accountController = Get.find();
    if (_accountController.notificationsSetting.isTrue) {
      change(null, status: RxStatus.loading());
      callGetNotificationApi();
    } else {
      change(null, status: RxStatus.empty());
    }
    super.onInit();
  }
}
