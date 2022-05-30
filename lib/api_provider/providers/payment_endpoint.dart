import 'package:dio/dio.dart';

import '../../services/common_loader/common_loader.dart';

class PaymentEndpoint {
  Dio client;
  PaymentEndpoint({
    required this.client,
  });

  Future<num> getWalletBalance() async {
    try {
      Response r = await client.get("/wallet");
      return r.data["data"]["wallet"]["balance"];
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<Map<String, dynamic>> addMoneyApi({required int amount}) async {
    CommonLoader.showLoading();
    try {
      var data = {"amount": amount};
      Response r = await client.post("/wallet/add-money", data: data);
      CommonLoader.hideLoading();
      return r.data;
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }
}
