import 'package:flutter/material.dart';
import 'package:we_fast/constants/constants.dart';
import 'package:we_fast/controllers/book_vehicle_controller.dart';
import 'package:we_fast/essentails.dart';

class SelectedVehicleTile extends GetView {
  SelectedVehicleTile(
      {Key? key,
      required this.title,
      required this.img,
      required this.wheels
      })
      : super(key: key);
  BookVehicleController bookVehicleController =
      Get.put(BookVehicleController());
  
  final String img, title, wheels ;
  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.white,
      elevation: 3,
      child: bookVehicleController.obx((state) => 
           Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.network(img,
                height: 8.h,
                errorBuilder: (context, Object, StackTrace) => Center(
                        child: Icon(
                      Icons.image,
                    ))),
             Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontSize: 14.sp),
                    ),
                    Icon(
                      Icons.info_outline,
                      color: AppColors.primaryColor,
                      size: 16.sp,
                    )
                  ],
                ),
                Text(
                  "Wheels: " + wheels,
                  style: TextStyle(fontSize: 13.sp, color: Colors.grey),
                ),
                Obx(() => Text(
                     bookVehicleController.estimatePrice.value.tr,                  
                    style: TextStyle(fontSize: 13.sp, color: Colors.grey),
                  ),
                )
                
              ],
            ),
            Spacer(
              flex: 3,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 4.h,
                    width: 20.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        gradient: AppColors.buttonGradientPurple,
                        borderRadius: BorderRadius.circular(4)),
                    child: Text(
                      'Change',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 4.h,
                    width: 20.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        gradient: AppColors.buttonGradientPurple,
                        borderRadius: BorderRadius.circular(4)),
                    child: Text(
                      'Add',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ), 
      ),   
    );
  }
}
