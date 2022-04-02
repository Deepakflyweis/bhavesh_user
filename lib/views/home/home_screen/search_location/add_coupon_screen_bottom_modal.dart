import 'package:we_fast/constants/constants.dart';
import 'package:we_fast/controllers/book_vehicle_controller.dart';
import 'package:we_fast/essentails.dart';
import 'package:we_fast/views/home/home_screen/search_location/delivery_vehicle_details_bottom_modal.dart';
import 'package:we_fast/views/home/home_screen/search_location/select_goods_type_screen.dart';
import 'package:we_fast/widgets/added_stops_widget.dart';
import 'package:we_fast/widgets/buttons/border_button.dart';
import 'package:we_fast/widgets/buttons/rounded_gradient_button.dart';

class AddCouponBottomModal extends StatelessWidget {
  AddCouponBottomModal({Key? key}) : super(key: key);
  final BookVehicleController bookVehicleController = Get.find();
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.9,
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
                      children: [
                        SizedBox(
                          height: 15.h,
                          child: Obx(() => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              8), //index 0 is truck
                                          color: bookVehicleController
                                                      .selectedVehicle.value ==
                                                  bookVehicleController
                                                      .allVehicles[0]
                                              ? AppColors.primaryColor
                                                  .withOpacity(0.25)
                                              : Colors.transparent),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 6),
                                        child: InkWell(
                                          onTap: () {
                                            bookVehicleController
                                                .selectedVehicle(
                                                    bookVehicleController
                                                        .allVehicles[0]);
                                          },
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Truck',
                                                style:
                                                    TextStyle(fontSize: 13.sp),
                                              ),
                                              Image.asset(
                                                'assets/images/truck.png',
                                                height: 4.h,
                                              ),
                                              Text(
                                                '12 min',
                                                style:
                                                    TextStyle(fontSize: 11.sp),
                                              ),
                                              Text(
                                                '${RupeeSymbol.rupeeSymbol}xxxxx',
                                                style:
                                                    TextStyle(fontSize: 11.sp),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              8), //index 1 is carter
                                          color: bookVehicleController
                                                      .selectedVehicle.value ==
                                                  bookVehicleController
                                                      .allVehicles[1]
                                              ? AppColors.primaryColor
                                                  .withOpacity(0.25)
                                              : Colors.transparent),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 6),
                                        child: InkWell(
                                          onTap: () {
                                            bookVehicleController
                                                .selectedVehicle(
                                                    bookVehicleController
                                                        .allVehicles[1]);
                                          },
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Carter',
                                                style:
                                                    TextStyle(fontSize: 12.sp),
                                              ),
                                              Image.asset(
                                                'assets/images/box-truck.png',
                                                height: 4.h,
                                              ),
                                              Text(
                                                '12 min',
                                                style:
                                                    TextStyle(fontSize: 11.sp),
                                              ),
                                              Text(
                                                '${RupeeSymbol.rupeeSymbol}xxxxx',
                                                style:
                                                    TextStyle(fontSize: 11.sp),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              8), //index 2 is 3 wheeler
                                          color: bookVehicleController
                                                      .selectedVehicle.value ==
                                                  bookVehicleController
                                                      .allVehicles[2]
                                              ? AppColors.primaryColor
                                                  .withOpacity(0.25)
                                              : Colors.transparent),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 6),
                                        child: InkWell(
                                          onTap: () {
                                            bookVehicleController
                                                .selectedVehicle(
                                                    bookVehicleController
                                                        .allVehicles[2]);
                                          },
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '3-wheeler',
                                                style:
                                                    TextStyle(fontSize: 12.sp),
                                              ),
                                              Image.asset(
                                                'assets/images/tuk-tuk.png',
                                                height: 4.h,
                                              ),
                                              Text(
                                                '12 min',
                                                style:
                                                    TextStyle(fontSize: 11.sp),
                                              ),
                                              Text(
                                                '${RupeeSymbol.rupeeSymbol}xxxxx',
                                                style:
                                                    TextStyle(fontSize: 11.sp),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              8), //index 3 is 2 wheeler
                                          color: bookVehicleController
                                                      .selectedVehicle.value ==
                                                  bookVehicleController
                                                      .allVehicles[3]
                                              ? AppColors.primaryColor
                                                  .withOpacity(0.25)
                                              : Colors.transparent),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 6),
                                        child: InkWell(
                                          onTap: () {
                                            bookVehicleController
                                                .selectedVehicle(
                                                    bookVehicleController
                                                        .allVehicles[3]);
                                          },
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '2-wheeler',
                                                style:
                                                    TextStyle(fontSize: 12.sp),
                                              ),
                                              Image.asset(
                                                'assets/images/scooter.png',
                                                height: 4.h,
                                              ),
                                              Text(
                                                '12 min',
                                                style:
                                                    TextStyle(fontSize: 11.sp),
                                              ),
                                              Text(
                                                '${RupeeSymbol.rupeeSymbol}xxxxx',
                                                style:
                                                    TextStyle(fontSize: 11.sp),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              8), //index 4 is eeco
                                          color: bookVehicleController
                                                      .selectedVehicle.value ==
                                                  bookVehicleController
                                                      .allVehicles[4]
                                              ? AppColors.primaryColor
                                                  .withOpacity(0.25)
                                              : Colors.transparent),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 6),
                                        child: InkWell(
                                          onTap: () {
                                            bookVehicleController
                                                .selectedVehicle(
                                                    bookVehicleController
                                                        .allVehicles[4]);
                                          },
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Eeco',
                                                style:
                                                    TextStyle(fontSize: 12.sp),
                                              ),
                                              Image.asset(
                                                'assets/images/van.png',
                                                height: 4.h,
                                              ),
                                              Text(
                                                '12 min',
                                                style:
                                                    TextStyle(fontSize: 11.sp),
                                              ),
                                              Text(
                                                '${RupeeSymbol.rupeeSymbol}xxxxx',
                                                style:
                                                    TextStyle(fontSize: 11.sp),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Obx(() => SwitchListTile(
                                    value: bookVehicleController
                                        .selectedExtraHandler.value,
                                    onChanged: bookVehicleController
                                        .selectExtraHandler,
                                    secondary: Image.asset(
                                      'assets/images/truck_pic.png',
                                      height: 4.h,
                                    ),
                                    title: Text(
                                      'Include Lobour',
                                      style: TextStyle(
                                          fontSize: 12.sp, color: Colors.black),
                                    ),
                                    subtitle: Text(
                                      'Add Extra help for loading and unloading',
                                      style: TextStyle(
                                          fontSize: 12.sp, color: Colors.grey),
                                    ))),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Pickup Contract',
                                style: TextStyle(
                                    fontSize: 12.sp, color: Colors.black),
                              ),
                              Text(
                                '7838901961 UserName',
                                style: TextStyle(
                                    fontSize: 11.sp, color: Colors.blue),
                              )
                            ],
                          ),
                        ),
                        Obx(() => Visibility(
                              visible: bookVehicleController
                                          .selectedGoodType.value !=
                                      null
                                  ? true
                                  : false,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Goods Type',
                                      style: TextStyle(
                                          fontSize: 12.sp, color: Colors.black),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.to(() => SelectGoodsType());
                                      },
                                      child: Text(
                                        bookVehicleController
                                                    .selectedGoodType.value !=
                                                null
                                            ? bookVehicleController
                                                .selectedGoodType.value!.name
                                            : "",
                                        style: TextStyle(
                                            fontSize: 11.sp,
                                            color: Colors.blue),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Apply Coupons*',
                                style: TextStyle(
                                    fontSize: 12.sp, color: Colors.black),
                              ),
                              Image.asset(
                                'assets/images/offer_pic.png',
                                height: 3.h,
                              ),
                              Spacer(),
                              TextField(
                                controller: bookVehicleController.couponCode,
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 11.sp),
                                decoration: InputDecoration(
                                  hintText: 'Type Here',
                                  fillColor: AppColors.backgroundColor
                                      .withOpacity(0.8),
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                      borderSide: BorderSide(
                                        width: 5,
                                        color: AppColors.backgroundColor,
                                      )),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                      borderSide: BorderSide(
                                        width: 5,
                                        color: AppColors.backgroundColor,
                                      )),
                                  contentPadding:
                                      EdgeInsets.only(top: 7, left: 7),
                                  constraints: BoxConstraints(
                                      minHeight: 4.h,
                                      minWidth: 40.w,
                                      maxWidth: 40.w,
                                      maxHeight: 4.h),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Obx(() => bookVehicleController
                                    .selectedGoodType.value ==
                                null
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RoundedGradientButton(
                                    title: 'Goods Type?',
                                    gradient: AppColors.buttonGradientPurple,
                                    onTap: () {
                                      Get.to(() => SelectGoodsType());
                                    }),
                              )
                            : Obx(() => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                            value: bookVehicleController
                                                .selectedPaymentMethod.value,
                                            onChanged: bookVehicleController
                                                .selectPaymentMethod,
                                            items: BookVehicleController
                                                .paymentMethods
                                                .map((e) => DropdownMenuItem(
                                                    value: e,
                                                    child: Row(
                                                      children: [
                                                        Image.asset(
                                                          e.image,
                                                          width: 10.w,
                                                        ),
                                                        Text(
                                                          e.title,
                                                          style: TextStyle(
                                                              fontSize: 10.sp),
                                                        )
                                                      ],
                                                    )))
                                                .toList())),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: RoundedGradientButton(
                                          title:
                                              'Book ${bookVehicleController.selectedVehicle.value.name}',
                                          gradient:
                                              AppColors.buttonGradientPurple,
                                          onTap: () {
                                            Get.back();
                                            showModalBottomSheet(
                                                isDismissible: false,
                                                /* constraints:
                                                    BoxConstraints(minHeight: 150, maxHeight: 150), */
                                                backgroundColor:
                                                    Colors.transparent,
                                                context: context,
                                                builder: (BuildContext
                                                        context) =>
                                                    DeliveryVehicleDetailsBottomModal());
                                          }),
                                    ),
                                  ],
                                )))
                      ],
                    ),
                  )),
            ));
  }
}
