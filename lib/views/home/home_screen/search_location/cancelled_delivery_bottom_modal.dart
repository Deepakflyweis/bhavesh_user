import 'package:flutter/material.dart';
import 'package:we_fast/constants/constants.dart';
import 'package:we_fast/essentails.dart';
import 'package:we_fast/services/date_formatter.dart';
import 'package:we_fast/views/home/navbar_screen.dart';
import 'package:we_fast/widgets/buttons/border_button.dart';
import 'package:we_fast/widgets/start_stop_widget.dart';

class CancelledDeliveryBottomModal extends StatelessWidget {
  const CancelledDeliveryBottomModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: .7,
        builder: (BuildContext context, ScrollController scrollController) =>
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              ),
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5.w),
                                  child: Text(
                                    'Today, ${DateFormatter.timeFormatter(DateTime.now())}',
                                    style: TextStyle(fontSize: 11.sp),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5.w),
                                  child: Text(
                                    'Trip_id: xyz12233',
                                    style: TextStyle(fontSize: 11.sp),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              child: Text(
                                '${RupeeSymbol.rupeeSymbol} xxxxxx',
                                style: TextStyle(fontSize: 11.sp),
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          height: 3.h,
                          thickness: 1,
                          color: Colors.grey,
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      StartStopWidget(
                                        distance: 10,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            height: 30,
                                            width: 70.w,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                            child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  '    Present Address',
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                )),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Container(
                                            height: 30,
                                            width: 70.w,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                            child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  "    Reciever's Address",
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                )),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Delivery Cancelled!',
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 12.sp),
                                      ),
                                      Image.asset(
                                        'assets/images/sad_emoji.png',
                                        height: 4.h,
                                      )
                                    ],
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: BorderButton(
                                        title: 'Book Again',
                                        onTap: () {},
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.offAll(() => NavBarScreen());
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.arrow_back_ios_rounded,
                                          size: 12.sp,
                                        ),
                                        Text(
                                          'Back to Home',
                                          style: TextStyle(
                                            fontSize: 11.sp,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ]))
                      ],
                    ),
                  )),
            ));
  }
}
