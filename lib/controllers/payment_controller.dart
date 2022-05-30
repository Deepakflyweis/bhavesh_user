import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:we_fast/api_provider/api_client.dart';
import 'package:we_fast/api_provider/providers/booking_endpoint.dart';
import 'package:we_fast/api_provider/providers/payment_endpoint.dart';

import '../models/booking_model.dart';
import '../services/common_loader/common_loader.dart';

class PaymentController extends GetxController with StateMixin {
  List<BookingModel> bookings = [];
  num balance = 0;
  final ScrollController bottomSheetScrollController = ScrollController();
  TextEditingController money = TextEditingController();
  late Razorpay _razorpay;
  @override
  void onInit() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    callGetApi();
    super.onInit();
  }

  callGetApi() {
    Future.wait([
      BookingEndPointProvider(client: Client().init()).getAllBookings(),
      PaymentEndpoint(client: Client().init()).getWalletBalance()
    ]).then((value) {
      bookings.addAll(value[0] as List<BookingModel>);
      balance = value[1] as num;
      change(null, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  callAddBalanceApi() {
    PaymentEndpoint paymentEndpoint = PaymentEndpoint(client: Client().init());
    paymentEndpoint.addMoneyApi(amount: int.parse(money.text)).then((value) {
      var options = {
        'key':
            'rzp_test_RCA60YesrxgJwm', //razorPayKey,//todo change it to user key
        'amount': value["data"]["order"]["amount"]! * 100,
        'order_id': value["data"]["order"]["orderId"],
        'name': 'We Fast',
        'description': 'Adding Money to wallet',
      };

      try {
        _razorpay.open(options);
      } catch (e) {
        debugPrint('Error: e');
      }
    });
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print('Success Response: $response');
    CommonLoader.showSuccessDialog(description: "Money Successfully Added");
    callGetApi();
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Error Response: $response');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('External SDK Response: $response');
  }
}
