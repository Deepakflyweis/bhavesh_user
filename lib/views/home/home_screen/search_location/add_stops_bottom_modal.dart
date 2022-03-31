import 'package:we_fast/constants/constants.dart';
import 'package:we_fast/controllers/book_vehicle_controller.dart';
import 'package:we_fast/essentails.dart';
import 'package:we_fast/views/home/home_screen/search_location/add_coupon_screen_bottom_modal.dart';
import 'package:we_fast/widgets/added_stops_widget.dart';
import 'package:we_fast/widgets/buttons/border_button.dart';
import 'package:we_fast/widgets/buttons/rounded_gradient_button.dart';

class AddStopsBottomModal extends StatelessWidget {
  AddStopsBottomModal({Key? key}) : super(key: key);
  final BookVehicleController bookVehicleController = Get.find();
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      builder: (BuildContext context, ScrollController scrollController) =>
          Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(
              () => SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Review/Add Stops",
                          style:
                              TextStyle(color: Colors.black, fontSize: 13.sp)),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 7),
                          child: AddedStopsWidget(
                              stops: bookVehicleController.stops.value),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 30,
                              width: 80.w,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '    Present Address',
                                    style: TextStyle(color: Colors.grey),
                                  )),
                            ),
                            for (int i = 0;
                                i < bookVehicleController.stops.value;
                                i++)
                              Column(
                                children: [
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Container(
                                    height: 30,
                                    width: 80.w,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "    Stops's Address",
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            )),
                                        InkWell(
                                          onTap: () {
                                            bookVehicleController.removeStops();
                                          },
                                          child: Icon(
                                            Icons.close,
                                            size: 18,
                                            color: Colors.grey,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            SizedBox(
                              height: 25,
                            ),
                            Container(
                              height: 30,
                              width: 80.w,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "    Reciever's Address",
                                    style: TextStyle(color: Colors.grey),
                                  )),
                            ),
                            SizedBox(
                              height: 28,
                            ),
                            BorderButton(
                              title: 'Add Stops',
                              onTap: () {
                                bookVehicleController.addStops();
                              },
                              color: Colors.blue,
                            )
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RoundedGradientButton(
                        title: 'Enter Contact Details',
                        gradient: AppColors.buttonGradientPurple,
                        onTap: () {
                          Get.back();
                          showModalBottomSheet(
                              isDismissible: false,
                              /* constraints:
                              BoxConstraints(minHeight: 150, maxHeight: 150), */
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (BuildContext context) =>
                                  AddCouponBottomModal());
                        },
                      ),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
