import 'package:we_fast/constants/constants.dart';
import 'package:we_fast/controllers/payment_controller.dart';
import 'package:we_fast/essentails.dart';
import 'package:we_fast/views/home/payments_screen/add_money.dart';
import 'package:we_fast/widgets/appbar.dart';
import 'package:we_fast/widgets/buttons/border_button.dart';
import 'package:we_fast/widgets/transactions_tile.dart';

class PaymentsScreen extends GetView<PaymentController> {
  PaymentController paymentController = Get.put(PaymentController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const CustomAppBar(
        titleWidget: Text(
          'Payments',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: controller.obx(
        (_) => Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/circle_logo.png',
                                height: 7.h,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: 50.w,
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                          text: '${AppName.appName} Wallet'),
                                      const TextSpan(
                                        text: '\nAdd money to wallet',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Spacer(),
                              BorderButton(
                                  title: 'Add Money',
                                  onTap: () {
                                    Get.defaultDialog(
                                      title: "Add Money",
                                      content: TextField(
                                        textAlign: TextAlign.center,
                                        controller: controller.money,
                                        keyboardType: TextInputType.number,
                                        style: TextStyle(fontSize: 20.sp),
                                        decoration: InputDecoration(),
                                      ),
                                      confirmTextColor: Colors.white,
                                      textCancel: "Cancel",
                                      textConfirm: "Submit",
                                      onConfirm: () {
                                        if (controller.money.text.isNum) {
                                          controller.callAddBalanceApi();
                                        }
                                      },
                                    );
                                  }),
                            ],
                          ),
                          Text("Balance: ${controller.balance}")
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            DraggableScrollableSheet(
                initialChildSize: 0.4,
                minChildSize: 0.4,
                builder: (BuildContext context,
                    ScrollController bottomSheetScrollController) {
                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    controller: bottomSheetScrollController,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(25))),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Container(
                              width: 25,
                              height: 7,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text('RECENT TRANSACTIONS')),
                            ),
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.bookings.length,
                              itemBuilder: (context, index) => TransactionsTile(
                                companyName: controller
                                    .bookings[index].receiverDetails.name,
                                transactionDateTime:
                                    controller.bookings[index].createdAt,
                                amount: controller.bookings[index].amount,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
