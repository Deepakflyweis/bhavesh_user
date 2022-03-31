import 'package:we_fast/constants/constants.dart';
import 'package:we_fast/essentails.dart';
import 'package:we_fast/views/home/payments_screen/add_money.dart';
import 'package:we_fast/widgets/appbar.dart';
import 'package:we_fast/widgets/buttons/border_button.dart';
import 'package:we_fast/widgets/transactions_tile.dart';

class PaymentsScreen extends StatelessWidget {
  PaymentsScreen({Key? key}) : super(key: key);
  final ScrollController bottomSheetScrollController = ScrollController();
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
      body: Stack(
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
                    child: Row(
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
                                TextSpan(text: '${AppName.appName} Wallet'),
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
                              Get.to(() => AddMoneyScreen());
                            }),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/paytm.png',
                          height: 7.h,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 50.w,
                          child: const Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: 'Paytm Wallet'),
                                TextSpan(
                                  text:
                                      '\nLink your Paytm Wallet and Grab rewards',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Spacer(),
                        BorderButton(title: 'Link 🔗', onTap: () {}),
                      ],
                    ),
                  ),
                ),
              )
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
                              itemCount: 60,
                              itemBuilder: (context, index) => TransactionsTile(
                                    companyName: 'ABC Logistics',
                                    transactionDateTime: DateTime.now(),
                                    amount: 100000000,
                                  ))
                        ],
                      ),
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
