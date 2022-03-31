import 'package:get/get.dart';
import 'package:we_fast/api_provider/api_client.dart';
import 'package:we_fast/api_provider/providers/delivery_prefrences_endpoint.dart';
import 'package:we_fast/api_provider/providers/goodtypes_endpoint.dart';
import 'package:we_fast/constants/enums.dart';
import 'package:we_fast/models/goods_model.dart';

class TellUsAboutController extends GetxController
    with StateMixin<List<GoodsModel>> {
  var doDeliver = false.obs;

  List<GoodsModel> whatDoYouDeliverList = [];
  RxList<GoodsModel> selectedGoodsList = <GoodsModel>[].obs;
  selectWhatToDeliver(GoodsModel goodsModel) {
    if (selectedGoodsList.contains(goodsModel)) {
      selectedGoodsList.remove(goodsModel);
      selectedGoodsList.refresh();
    } else {
      selectedGoodsList.add(goodsModel);
      selectedGoodsList.refresh();
    }
  }

  callGetGoodsApi() async {
    change(null, status: RxStatus.loading());
    try {
      Client client = Client();
      GoodTypesEndPointProvider goodTypesEndPointProvider =
          GoodTypesEndPointProvider(client: client.init());
      goodTypesEndPointProvider.getGoodTypes().then((value) {
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

  List<String> howManyDeliveriesList = [
    '1-5',
    '6-10',
    '11-25',
    '26-50',
    '51-100',
    'More than 100'
  ];
  var selectedHowManyDeliveries = "".obs;

  callDeliveryPrefrencesApi() async {
    Client client = Client();
    DeliveryPrefrencesEndPointProvider deliveryPrefrencesEndPointProvider =
        DeliveryPrefrencesEndPointProvider(client: client.init());
    deliveryPrefrencesEndPointProvider.addDeliveryPrefrences(
        doDeliver.value, selectedGoodsList, selectedHowManyDeliveries.value);
  }

  @override
  void onInit() {
    callGetGoodsApi();
    super.onInit();
  }
}
