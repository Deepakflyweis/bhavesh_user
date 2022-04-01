import 'package:get/get.dart';
import 'package:we_fast/api_provider/api_client.dart';
import 'package:we_fast/api_provider/providers/booking_endpoint.dart';
import 'package:we_fast/models/booking_model.dart';

class BookingListController extends GetxController
    with StateMixin<List<BookingModel>> {
  callGetBookingApi() {
    try {
      Client client = Client();
      BookingEndPointProvider bookingEndPointProvider =
          BookingEndPointProvider(client: client.init());

      bookingEndPointProvider.getAllBookings().then((value) {
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
    callGetBookingApi();
    super.onInit();
  }
}
