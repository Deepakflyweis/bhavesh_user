// ignore_for_file: must_be_immutable

import 'package:we_fast/constants/constants.dart';
import 'package:we_fast/controllers/tell_us_about_controller.dart';
import 'package:we_fast/essentails.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:we_fast/views/registration/whats_your_name_screen.dart';
import 'package:we_fast/constants/enums.dart';

import '../../models/goods_model.dart';

class TellUsAboutScreen extends GetView<TellUsAboutController> {
  TellUsAboutScreen({Key? key}) : super(key: key);
  TellUsAboutController controller = Get.put(TellUsAboutController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: PhysicalModel(
                color: Colors.transparent,
                elevation: 3,
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(20)),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  width: double.infinity,
                  height: 68.h,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(20))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Tell us about yourself',
                        style: TextStyle(fontSize: 12.sp),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          'So that we can make your deliveries smoother',
                          style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                        ),
                      ),
                      Text('Do you need delivery for business?',
                          style: TextStyle(fontSize: 12.sp)),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              controller.doDeliver(true);
                            },
                            child: Obx(() => Container(
                                  height: 30,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      color: controller.doDeliver.value
                                          ? Colors.black
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: controller.doDeliver.value
                                              ? Colors.black
                                              : Colors.grey)),
                                  child: Center(
                                      child: Text(
                                    'Yes',
                                    style: TextStyle(
                                        color: controller.doDeliver.value
                                            ? Colors.white
                                            : Colors.grey),
                                  )),
                                )),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () {
                              controller.doDeliver(false);
                            },
                            child: Obx(() => Container(
                                  height: 30,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      color: controller.doDeliver.value == false
                                          ? Colors.black
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: controller.doDeliver.value ==
                                                  false
                                              ? Colors.black
                                              : Colors.grey)),
                                  child: Center(
                                      child: Text(
                                    'No',
                                    style: TextStyle(
                                        color:
                                            controller.doDeliver.value == false
                                                ? Colors.white
                                                : Colors.grey),
                                  )),
                                )),
                          )
                        ],
                      ),
                      Obx(() => Visibility(
                          visible: controller.doDeliver.value,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              const Text('What Do You Deliver?'),
                              const SizedBox(
                                height: 5,
                              ),
                              controller.obx(
                                (state) => Wrap(
                                  children: [
                                    for (GoodsModel element in state!)
                                      InkWell(
                                        onTap: () {
                                          controller
                                              .selectWhatToDeliver(element);
                                        },
                                        child: Obx(() => Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: controller
                                                            .selectedGoodsList
                                                            .value
                                                            .contains(element)
                                                        ? Colors.black
                                                        : Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: controller
                                                                    .selectedGoodsList
                                                                    .value ==
                                                                element
                                                            ? Colors.black
                                                            : Colors.grey)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    element.name,
                                                    style: TextStyle(
                                                        color: controller
                                                                    .selectedGoodsList
                                                                    .value ==
                                                                element
                                                            ? Colors.white
                                                            : Colors.grey),
                                                  ),
                                                ),
                                              ),
                                            )),
                                      )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text('How Many deliveries per week?'),
                              const SizedBox(
                                height: 5,
                              ),
                              Wrap(
                                children: [
                                  for (String element
                                      in controller.howManyDeliveriesList)
                                    InkWell(
                                      onTap: () {
                                        controller
                                            .selectedHowManyDeliveries(element);
                                      },
                                      child: Obx(() => Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: controller
                                                              .selectedHowManyDeliveries
                                                              .value ==
                                                          element
                                                      ? Colors.black
                                                      : Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  border: Border.all(
                                                      color: controller
                                                                  .selectedHowManyDeliveries
                                                                  .value ==
                                                              element
                                                          ? Colors.black
                                                          : Colors.grey)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  element,
                                                  style: TextStyle(
                                                      color: controller
                                                                  .selectedHowManyDeliveries
                                                                  .value ==
                                                              element
                                                          ? Colors.white
                                                          : Colors.grey),
                                                ),
                                              ),
                                            ),
                                          )),
                                    )
                                ],
                              ),
                              //Spacer(),
                            ],
                          ))),
                      const Spacer(),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: InkWell(
                              onTap: () {
                                controller.callDeliveryPrefrencesApi();
                              },
                              child: SvgPicture.asset(
                                  'assets/icons/grey_right_button.svg'),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
