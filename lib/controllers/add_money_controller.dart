import 'package:we_fast/essentails.dart';
import 'package:we_fast/constants/enums.dart';

class AddMoneyController extends GetxController {
  var methodSelected = paymentMethods.upi.obs;
  onRadioChanged(value) {
    methodSelected(value);
  }

  TextEditingController upiId = TextEditingController();
  TextEditingController dCardNo = TextEditingController();
  TextEditingController expMonth = TextEditingController();
  TextEditingController expYear = TextEditingController();
  TextEditingController cvv = TextEditingController();
}
