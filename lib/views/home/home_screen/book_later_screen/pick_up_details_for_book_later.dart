// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:we_fast/constants/constants.dart';
import 'package:we_fast/controllers/book_vehicle_controller.dart';
import 'package:we_fast/essentails.dart';
import 'package:we_fast/services/date_formatter.dart';
import 'package:we_fast/views/home/home_screen/book_now_screen/add_new_load_form.dart';
import 'package:we_fast/widgets/buttons/rectangular_gradient_button.dart';
import 'package:we_fast/widgets/drawer_appbar.dart';
import 'package:we_fast/widgets/selected_vehicle_tile.dart';
import 'package:we_fast/widgets/start_stop_widget.dart';

class PickUpDetailsForBookLater extends StatelessWidget {
  PickUpDetailsForBookLater({Key? key}) : super(key: key);
  final BookVehicleController bookVehicleController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: const DrawerAppBar(title: 'Add New Load'),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Form(
                  key: bookVehicleController.pickUpDetailsForBookLaterFormKey,
                  child: Column(
                    children: [
                      Text(
                        "PICKUP & DROP LOCATION",
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      Divider(
                        height: 3.h,
                        color: Colors.grey,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: StartStopWidget(distance: 35),
                          ),
                          Column(
                            children: [
                              TextFormField(
                                maxLines: 4,
                                controller:
                                    bookVehicleController.presentAddress,
                                validator: (val) {
                                  if (val == "") {
                                    return "Enter Present Address";
                                  }
                                },
                                decoration: InputDecoration(
                                    hintText: 'Present Address',
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 12.sp),
                                    border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.grey),
                                        borderRadius: BorderRadius.circular(6)),
                                    constraints:
                                        BoxConstraints(maxWidth: 80.w)),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                maxLines: 4,
                                controller:
                                    bookVehicleController.recieverAddress,
                                validator: (val) {
                                  if (val == "") {
                                    return "Enter Receiver's Address";
                                  }
                                },
                                decoration: InputDecoration(
                                    hintText: 'Receiver\'s Address',
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 12.sp),
                                    border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.grey),
                                        borderRadius: BorderRadius.circular(6)),
                                    constraints:
                                        BoxConstraints(maxWidth: 80.w)),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Divider(
                        height: 1.h,
                        color: Colors.grey,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'SELECT VEHICLE TYPE',
                          style: TextStyle(fontSize: 12.sp),
                        ),
                      ),
                      Divider(
                        height: 3.h,
                        color: Colors.grey,
                      ),
                      SelectedVehicleTile(
                          title:
                              bookVehicleController.selectedVehicle.value.name,
                          img:
                              bookVehicleController.selectedVehicle.value.image,
                          wheels: bookVehicleController
                              .selectedVehicle.value.wheels
                              .toString(),
                          // amount: bookVehicleController.estimatePrice
                          ),
                      Divider(
                        height: 1.h,
                        color: Colors.grey,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'SELECT PICK UP AND DROP DATE',
                          style: TextStyle(fontSize: 12.sp),
                        ),
                      ),
                      Divider(
                        height: 3.h,
                        color: Colors.grey,
                      ),
                      Row(
                        children: [
                          Text(
                            'PICK UP DATE',
                            style:
                                TextStyle(color: Colors.grey, fontSize: 12.sp),
                          ),
                          Spacer(),
                          Obx(
                            () => Text(
                              bookVehicleController.pickUpDate.value == null
                                  ? 'Date Time'
                                  : DateFormatter
                                      .formatToShashedDateWithoutTime(
                                          bookVehicleController
                                              .pickUpDate.value!),
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 11.sp),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              bookVehicleController.selectPickUpDate(context);
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: Image.asset(
                                'assets/icons/calander_icon.png',
                                height: 3.h,
                              ),
                            ),
                          )
                        ],
                      ),
                      Obx(() => Divider(
                            height: 3.h,
                            thickness: 1,
                            color: bookVehicleController
                                            .isNextForBookLaterTapped.value ==
                                        true &&
                                    bookVehicleController
                                            .isPickUpDateVerified.value ==
                                        false
                                ? Colors.red
                                : Colors.grey,
                          )),
                      Row(
                        children: [
                          Text(
                            'DROP DATE',
                            style:
                                TextStyle(color: Colors.grey, fontSize: 12.sp),
                          ),
                          Spacer(),
                          Obx(() => Text(
                                bookVehicleController.dropDate.value == null
                                    ? 'Date Time'
                                    : DateFormatter
                                        .formatToShashedDateWithoutTime(
                                            bookVehicleController
                                                .dropDate.value!),
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 11.sp),
                              )),
                          InkWell(
                            onTap: () {
                              bookVehicleController.selectDropDate(context);
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: Image.asset(
                                'assets/icons/calander_icon.png',
                                height: 3.h,
                              ),
                            ),
                          )
                        ],
                      ),
                      Obx(() => Divider(
                            height: 3.h,
                            thickness: 1,
                            color: bookVehicleController
                                            .isNextForBookLaterTapped.value ==
                                        true &&
                                    bookVehicleController
                                            .isDropDateVerified.value ==
                                        false
                                ? Colors.red
                                : Colors.grey,
                          )),
                      RectangularGradientButton(
                          title: 'NEXT',
                          onTap: () {
                            bookVehicleController
                                .isNextForBookLaterTapped.value = true;
                            if (bookVehicleController
                                    .pickUpDetailsForBookLaterFormKey
                                    .currentState!
                                    .validate() &&
                                bookVehicleController
                                    .isDropDateVerified.value &&
                                bookVehicleController
                                    .isPickUpDateVerified.value) {
                              Get.to(() => AddNewLoadForm());
                            }
                          },
                          gradient: AppColors.buttonGradientPurple),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
