import 'package:we_fast/constants/constants.dart';
import 'package:we_fast/essentails.dart';
import 'package:we_fast/views/home/payments_screen/add_money.dart';
import 'package:we_fast/widgets/buttons/rounded_gradient_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:we_fast/widgets/drawer_appbar.dart';
import 'package:we_fast/widgets/transactions_tile.dart';

class MyWallet extends StatelessWidget {
  const MyWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DrawerAppBar(
        title: 'Wallet',
      ),
      body: Stack(
        children: [
          Positioned(
              top: 10.h,
              left: -10.w,
              child: SvgPicture.asset(
                'assets/icons/wavy_pattern_bg.svg',
                width: 120.w,
              )),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  height: 25.h,
                  width: 100.w,
                  color: AppColors.backgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Wallet Balance       ${RupeeSymbol.rupeeSymbol} 200',
                                  style: TextStyle(fontSize: 13.sp),
                                ),
                                Text(
                                  'Maintain ${RupeeSymbol.rupeeSymbol} 100 to withdraw money',
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                            Image.asset(
                              'assets/images/wallet_image.png',
                              width: 20.w,
                            )
                          ],
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 25.w,
                                height: 6.h,
                                child: RoundedGradientButton(
                                    title: 'Pay',
                                    gradient: AppColors.buttonGradientGreen,
                                    onTap: () {}),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              SizedBox(
                                width: 25.w,
                                height: 6.h,
                                child: RoundedGradientButton(
                                    title: 'Add Money',
                                    gradient: AppColors.buttonGradientBlue,
                                    onTap: () {
                                      Get.to(() => AddMoneyScreen());
                                    }),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text('RECENT TRANSACTIONS')),
                          ),
                          ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
