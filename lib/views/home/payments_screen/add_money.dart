import 'package:we_fast/constants/constants.dart';
import 'package:we_fast/controllers/add_money_controller.dart';
import 'package:we_fast/essentails.dart';
import 'package:we_fast/widgets/buttons/rectangular_gradient_button.dart';
import 'package:we_fast/widgets/drawer_appbar.dart';
import 'package:we_fast/constants/enums.dart';

class AddMoneyScreen extends StatelessWidget {
  AddMoneyScreen({Key? key}) : super(key: key);
  final AddMoneyController addMoneyController = AddMoneyController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DrawerAppBar(title: 'Add Money'),
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: PhysicalModel(
          color: Colors.white,
          elevation: 3,
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(
            width: 80.w,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(() => Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Enter Details to Add Money',
                          style: TextStyle(fontSize: 13.sp),
                        ),
                      ),
                      RadioListTile(
                          title: Text(
                            'UPI',
                            style: TextStyle(fontSize: 12.sp),
                          ),
                          activeColor: AppColors.primaryColor,
                          value: paymentMethods.upi,
                          groupValue: addMoneyController.methodSelected.value,
                          onChanged: addMoneyController.onRadioChanged),
                      if (addMoneyController.methodSelected.value ==
                          paymentMethods.upi)
                        Padding(
                          padding: EdgeInsets.only(left: 10.w),
                          child: Column(
                            children: [
                              TextField(
                                controller: addMoneyController.upiId,
                                decoration: const InputDecoration(
                                    hintText: 'Enter UPI Id'),
                              ),
                              SizedBox(
                                width: 30.w,
                                child: RectangularGradientButton(
                                    title: 'VERIFY',
                                    onTap: () {},
                                    gradient: AppColors.buttonGradientPurple),
                              )
                            ],
                          ),
                        ),
                      RadioListTile(
                          title: Text(
                            'Debit Card',
                            style: TextStyle(fontSize: 12.sp),
                          ),
                          activeColor: AppColors.primaryColor,
                          value: paymentMethods.debitCard,
                          groupValue: addMoneyController.methodSelected.value,
                          onChanged: addMoneyController.onRadioChanged),
                      if (addMoneyController.methodSelected.value ==
                          paymentMethods.debitCard)
                        Padding(
                          padding: EdgeInsets.only(left: 10.w),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: addMoneyController.dCardNo,
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                  ),
                                  decoration: const InputDecoration(
                                    hintText: 'Enter Debit Card Number',
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      style: TextStyle(fontSize: 10.sp),
                                      controller: addMoneyController.expMonth,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          hintText: 'Exp. Month',
                                          suffixIcon:
                                              const Icon(Icons.calendar_today),
                                          constraints:
                                              BoxConstraints(maxWidth: 30.w)),
                                    ),
                                  ),
                                  TextField(
                                    controller: addMoneyController.expYear,
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                    ),
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        hintText: 'Exp. Year',
                                        suffixIcon:
                                            const Icon(Icons.calendar_today),
                                        constraints:
                                            BoxConstraints(maxWidth: 25.w)),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: addMoneyController.expMonth,
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                    ),
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        hintText: 'CVV',
                                        suffixIcon:
                                            const Icon(Icons.card_membership),
                                        constraints:
                                            BoxConstraints(maxWidth: 25.w)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      RectangularGradientButton(
                          title: 'Add +',
                          onTap: () {},
                          gradient: AppColors.buttonGradientPurple)
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
