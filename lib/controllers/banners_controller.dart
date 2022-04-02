import 'package:get/get.dart';
import 'package:we_fast/api_provider/api_client.dart';
import 'package:we_fast/api_provider/providers/banners_endpoint.dart';
import 'package:we_fast/models/banners_model.dart';

class BannersController extends GetxController
    with StateMixin<List<BannersModel>> {
  callGetBannersApi() {
    Client client = Client();
    BannersEndPointProvider bannersEndPointProvider =
        BannersEndPointProvider(client: client.init());
    try {
      bannersEndPointProvider.getBanners().then((value) {
        if (value.isNotEmpty) {
          change(value, status: RxStatus.success());
        } else {
          change(null, status: RxStatus.empty());
        }
      }, onError: (err) {
        change(null, status: RxStatus.error(err));
      });
    } on Exception catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onInit() {
    callGetBannersApi();
    super.onInit();
  }
}
