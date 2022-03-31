import 'package:dio/dio.dart';
import 'package:we_fast/models/goods_model.dart';
import 'package:get/get.dart' as g;
import 'package:we_fast/services/common_loader/common_loader.dart';
import 'package:we_fast/views/registration/whats_your_name_screen.dart';

class DeliveryPrefrencesEndPointProvider {
  Dio client;
  DeliveryPrefrencesEndPointProvider({
    required this.client,
  });

  addDeliveryPrefrences(bool deliveryForBusiness,
      List<GoodsModel> selectedGoods, String deliveryPerWeek) async {
    CommonLoader.showLoading();
    var data;
    if (deliveryForBusiness) {
      List<String> goodsListId = [];
      for (var element in selectedGoods) {
        goodsListId.add(element.id);
      }
      data = {
        "deliveryForBusiness": deliveryForBusiness,
        "goodsType": goodsListId,
        "deliveriesPerWeek": deliveryPerWeek
      };
    } else {
      data = {
        "deliveryForBusiness": deliveryForBusiness,
      };
    }
    try {
      Response r = await client.put("/user/delivery-preference", data: data);
      CommonLoader.hideLoading();
      if (r.statusCode == 200) {
        g.Get.to(() => WhatsYourNameScreen());
      } else {
        CommonLoader.showErrorDialog(description: r.data['error']);
      }
    } on DioError catch (e) {
      print(e.response!.data);
      CommonLoader.hideLoading();
      CommonLoader.showErrorDialog(description: e.message);
    }
  }
}
