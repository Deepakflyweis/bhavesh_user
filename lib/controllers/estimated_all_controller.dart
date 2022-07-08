import 'dart:developer';

import 'package:we_fast/api_provider/api_client.dart';
import 'package:we_fast/api_provider/providers/vehicle_type_endpoint.dart';
import 'package:we_fast/essentails.dart';
import 'package:we_fast/models/estimated_price_all.dart';

class EstimatedAllController extends GetxController
    with StateMixin<List<EstimatedAllModel>> {
  List<EstimatedAllModel> image = List<EstimatedAllModel>.empty().obs;
  late Rx<EstimatedAllModel> name;
  late Rx<EstimatedAllModel> estimatedPrice;
  RxBool isValue = false.obs;

  callGetEstimatedPriceAllApi() {
    Client cclient = Client();
    VehicleTypeEndPointProvider pointProvider =
        VehicleTypeEndPointProvider(client: cclient.init());
    try {
      log("in call");
      pointProvider.getEstimatedPriceAll().then((value) {
        isValue = true.obs;
        print('controller value $isValue');
        log("value ${value.toList()}");
        if (value.isNotEmpty) {
          change(value, status: RxStatus.success());
        } else {
          change(null, status: RxStatus.empty());
        }
      }, onError: (err) {
        log("err $err");
        change(null, status: RxStatus.error(err.toString()));
      });
    } catch (e) {
      log("e $e");
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  showPriceApi() {
    Client client = Client();
    VehicleTypeEndPointProvider pointProvider =
        VehicleTypeEndPointProvider(client: client.init());
    pointProvider.getPriceAll();
  }
}
