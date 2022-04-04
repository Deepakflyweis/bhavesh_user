import 'package:get/get.dart';
import 'package:we_fast/api_provider/api_client.dart';
import 'package:we_fast/api_provider/providers/help_endpoint.dart';
import 'package:we_fast/models/help_and_support_model.dart';

class HelpController extends GetxController
    with StateMixin<HelpAndSupportModel> {
  callGetHelpAndSupportApi() {
    Client client = Client();
    HelpEndPointProvider helpEndPointProvider =
        HelpEndPointProvider(client: client.init());
    try {
      helpEndPointProvider.getHelpDetails().then((value) {
        change(value, status: RxStatus.success());
      }, onError: (err) {
        change(value, status: RxStatus.error(err));
      });
    } on Exception catch (e) {
      change(value, status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onInit() {
    callGetHelpAndSupportApi();
    super.onInit();
  }
}
