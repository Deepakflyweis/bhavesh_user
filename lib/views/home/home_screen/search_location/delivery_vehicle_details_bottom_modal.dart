import 'package:we_fast/constants/constants.dart';
import 'package:we_fast/controllers/book_vehicle_controller.dart';
import 'package:we_fast/essentails.dart';
import 'package:we_fast/services/date_formatter.dart';
import 'package:lottie/lottie.dart';
import 'package:we_fast/views/home/home_screen/search_location/tracking_bottom_modal.dart';
import 'package:we_fast/widgets/cancel_delivery_dialog.dart';

class DeliveryVehicleDetailsBottomModal extends StatelessWidget {
  DeliveryVehicleDetailsBottomModal({Key? key}) : super(key: key);
  final BookVehicleController _bookVehicleController = Get.find();

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 1,
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
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: Text(
                            'Today, ${DateFormatter.timeFormatter(DateTime.now())}',
                            style: TextStyle(fontSize: 11.sp),
                          ),
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
                              Text(
                                'Delivery Vehicle Details',
                                style: TextStyle(fontSize: 11.sp),
                              ),
                              SizedBox(
                                height: 25.h,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              _bookVehicleController
                                                  .selectedVehicle.value.title,
                                              style: TextStyle(fontSize: 11.sp),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Image.asset(
                                                _bookVehicleController
                                                    .selectedVehicle.value.img,
                                                height: 20.w,
                                              ),
                                            ),
                                            Text(
                                                '12 min\n${RupeeSymbol.rupeeSymbol}xxxxxx')
                                          ],
                                        ),
                                        Text(
                                          'Truck Number',
                                          style: TextStyle(fontSize: 11.sp),
                                        ),
                                        Text(
                                          'PickUp Contact',
                                          style: TextStyle(fontSize: 11.sp),
                                        ),
                                        Text(
                                          'Goods Type',
                                          style: TextStyle(
                                            fontSize: 11.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          children: [
                                            Image.asset(
                                              'assets/lottie/radargif.gif',
                                              height: 20.w,
                                            ),
                                            Text(
                                              'Searching nearby ${_bookVehicleController.selectedVehicle.value.title}',
                                              style: TextStyle(
                                                fontSize: 11.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          'HR XY 0009',
                                          style: TextStyle(
                                              fontSize: 11.sp,
                                              color: Colors.blue),
                                        ),
                                        Text(
                                          '7838901961',
                                          style: TextStyle(
                                              fontSize: 11.sp,
                                              color: Colors.blue),
                                        ),
                                        Text(
                                          _bookVehicleController
                                              .selectedGoodType.value!,
                                          style: TextStyle(
                                              fontSize: 11.sp,
                                              color: Colors.blue),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              PhysicalModel(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                                elevation: 4,
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: Colors.grey.shade200,
                                          width: 2)),
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Get.dialog(CancelDeliveryDialog(),
                                              barrierDismissible: false);
                                        },
                                        child: SizedBox(
                                            width: 42.w,
                                            height: 5.h,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Cancel Trip ',
                                                  style: TextStyle(
                                                    fontSize: 11.sp,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                                Image.asset(
                                                  'assets/icons/close_icon.png',
                                                  height: 2.h,
                                                )
                                              ],
                                            )),
                                      ),
                                      Container(
                                        height: 5.h,
                                        color: Colors.grey.shade200,
                                        width: 2,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.back();
                                          Get.bottomSheet(TrackingBottomModal(),
                                              isDismissible: false);
                                        },
                                        child: SizedBox(
                                            width: 42.w,
                                            height: 5.h,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Track Vehicle ',
                                                  style: TextStyle(
                                                    fontSize: 11.sp,
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                                Image.asset(
                                                  'assets/icons/tracking_icon.png',
                                                  height: 2.5.h,
                                                )
                                              ],
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            ));
  }
}
