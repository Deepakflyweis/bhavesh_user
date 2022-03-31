// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:we_fast/constants/constants.dart';
import 'package:we_fast/controllers/book_vehicle_controller.dart';
import 'package:we_fast/essentails.dart';
import 'package:we_fast/views/home/home_screen/book_now_screen/add_new_load_form.dart';
import 'package:we_fast/widgets/buttons/rectangular_gradient_button.dart';
import 'package:we_fast/widgets/drawer_appbar.dart';
import 'package:we_fast/widgets/selected_vehicle_tile.dart';
import 'package:we_fast/widgets/start_stop_widget.dart';

class PickUpDetailsForBookNow extends StatelessWidget {
  PickUpDetailsForBookNow({Key? key}) : super(key: key);
  final BookVehicleController bookVehicleController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        TextField(
                          maxLines: 4,
                          decoration: InputDecoration(
                              hintText: 'Present Address',
                              hintStyle: TextStyle(
                                  color: Colors.grey, fontSize: 12.sp),
                              border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(6)),
                              constraints: BoxConstraints(maxWidth: 80.w)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          maxLines: 4,
                          decoration: InputDecoration(
                              hintText: 'Receiver\'s Address',
                              hintStyle: TextStyle(
                                  color: Colors.grey, fontSize: 12.sp),
                              border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(6)),
                              constraints: BoxConstraints(maxWidth: 80.w)),
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
                    title: bookVehicleController.selectedVehicle.value.title,
                    img: bookVehicleController.selectedVehicle.value.img,
                    wheels: bookVehicleController.selectedVehicle.value.wheels,
                    amount: bookVehicleController.selectedVehicle.value.amount
                        .toString()),
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
                Container(
                  height: 5.h,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Colors.grey.shade400)),
                  child: Obx(
                    () => DropdownButtonHideUnderline(
                      child: DropdownButton(
                        icon: Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: Colors.grey,
                          size: 15.sp,
                        ),
                        isExpanded: true,
                        style: TextStyle(color: Colors.grey, fontSize: 11.sp),
                        value: bookVehicleController.paidBy.value,
                        onChanged: bookVehicleController.selectPaidBy,
                        items: [
                          const DropdownMenuItem(
                            value: 'Reciever',
                            child: Text('Reciever'),
                          ),
                          const DropdownMenuItem(
                            value: 'Sender',
                            child: Text('Sender'),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: 3.h,
                  color: Colors.grey,
                ),
                RectangularGradientButton(
                    title: 'NEXT',
                    onTap: () {
                      Get.to(() => AddNewLoadForm());
                    },
                    gradient: AppColors.buttonGradientPurple),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
