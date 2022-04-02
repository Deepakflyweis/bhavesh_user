import 'dart:convert';
import 'package:we_fast/api_provider/api_client.dart';
import 'package:we_fast/api_provider/providers/goodtypes_endpoint.dart';
import 'package:we_fast/api_provider/providers/vehicle_type_endpoint.dart';
import 'package:we_fast/essentails.dart';
import 'package:we_fast/models/country_model.dart';
import 'package:we_fast/models/goods_model.dart';
import 'package:we_fast/models/payment_methods_model.dart';
import 'package:we_fast/models/vehicle_details_model.dart';

class BookVehicleController extends GetxController
    with StateMixin<List<VehicleDetailsModel>> {
  GlobalKey<FormState> formKey = GlobalKey();
  late Rx<VehicleDetailsModel> selectedVehicle;
  List<VehicleDetailsModel> allVehicles = [];
  TextEditingController senderName = TextEditingController();
  TextEditingController senderMobile = TextEditingController(text: '+91');
  TextEditingController recieverName = TextEditingController();
  TextEditingController recieverMobile = TextEditingController(text: '+91');
  TextEditingController aditionalNotes = TextEditingController();
  TextEditingController couponCode = TextEditingController();
  TextEditingController loadWeight = TextEditingController();
  static List<CountryModel> countries = <CountryModel>[
    CountryModel('+91', 'assets/images/india.png', 'India'),
    CountryModel('+1', 'assets/images/usa.png', 'USA')
  ];
  Rx<CountryModel> selectedSenderCountry = countries.first.obs;
  selectSenderCountry(value) {
    selectedSenderCountry(value);
    senderMobile.text = selectedSenderCountry.value.dialingNumber;
  }

  Rx<CountryModel> selectedRecieverCountry = countries.first.obs;
  selectRecieverCountry(value) {
    selectedRecieverCountry(value);
    senderMobile.text = selectedRecieverCountry.value.dialingNumber;
  }

  Rx<bool> sameAsSender = false.obs;
  sameAsSenderOnChanged(value) {
    sameAsSender(value);
    if (value as bool) {
      recieverName.text = senderName.text;
      recieverMobile.text = senderMobile.text;
      selectedRecieverCountry.value = selectedSenderCountry.value;
    }
  }

  RxString paidBy = 'Reciever'.obs;
  selectPaidBy(value) {
    paidBy(value);
  }

  RxList<GoodsModel> goodsList = <GoodsModel>[].obs;
  Rx<GoodsModel?> selectedGoodType = (null as GoodsModel?).obs;
  selectGoodType(GoodsModel? value) {
    selectedGoodType(value);
  }

  RxString selectedWeightType = 'kg'.obs;
  selectWeightType(value) {
    selectedWeightType(value);
  }

  RxBool selectedExtraHandler = false.obs;

  selectExtraHandler(value) {
    selectedExtraHandler(value as bool);
  }

  Rx<int> stops = 0.obs;
  addStops() {
    if (stops.value < 4) {
      stops.value += 1;
    }
  }

  removeStops() {
    stops.value -= 1;
  }

  static List<PaymentmethodModel> paymentMethods = <PaymentmethodModel>[
    PaymentmethodModel(title: 'Cash', image: 'assets/images/cash.png'),
    PaymentmethodModel(title: 'UPI', image: 'assets/images/upi.png')
  ];
  Rx<PaymentmethodModel> selectedPaymentMethod = paymentMethods.first.obs;
  selectPaymentMethod(value) {
    selectedPaymentMethod(value);
  }

  late Rx<DateTime?> pickUpDate = (null as DateTime?).obs;
  Future<void> selectPickUpDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null) pickUpDate.value = pickedDate;
  }

  late Rx<DateTime?> dropDate = (null as DateTime?).obs;
  Future<void> selectDropDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null) dropDate.value = pickedDate;
  }

  callGetAllGoodsApi() {
    Client client = Client();
    GoodTypesEndPointProvider goodTypesEndPointProvider =
        GoodTypesEndPointProvider(client: client.init());
    goodTypesEndPointProvider.getGoodTypes().then((value) {
      goodsList.addAll(value);
      goodsList.refresh();
    });
  }

  callGetAllVehicleApi() {
    Client client = Client();
    VehicleTypeEndPointProvider vehicleTypeEndPointProvider =
        VehicleTypeEndPointProvider(client: client.init());
    try {
      vehicleTypeEndPointProvider.getVehicleType().then((value) {
        if (value.isNotEmpty) {
          allVehicles.addAll(value);
          selectedVehicle = value[0].obs;
          change(allVehicles, status: RxStatus.success());
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
    callGetAllVehicleApi();
    callGetAllGoodsApi();
    super.onInit();
  }
}
