import 'package:flutter/material.dart';
import 'package:we_fast/constants/constants.dart';
import 'package:we_fast/essentails.dart';


class SelectedVehicleTile extends StatelessWidget {
  const SelectedVehicleTile({Key? key,required this.title,required this.img,required this.wheels,required this.amount}) : super(key: key);
  final String img,title,wheels,amount;
  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.white,
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(img,height: 8.h,),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title,style: TextStyle(fontSize: 14.sp),),
                    Icon(Icons.info_outline,color: AppColors.primaryColor,size: 16.sp,)
                  ],
                ),
                Text(wheels,style: TextStyle(fontSize: 13.sp,color: Colors.grey),),
                Text(amount,style: TextStyle(fontSize: 13.sp,color: Colors.grey),),
              ],
            ),
            Spacer(flex: 3,),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){
                    Get.back();
                  },
                  child: Container(
                    height: 4.h,
                    width: 20.w,
                    decoration: BoxDecoration(
                      gradient: AppColors.buttonGradientPurple,
                      borderRadius: BorderRadius.circular(4)
                    ),
                    child: Center(
                      child: Text('Change',style: TextStyle(color: Colors.white),),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                InkWell(
                  onTap: (){

                  },
                  child: Container(
                    height: 4.h,
                    width: 20.w,
                    decoration: BoxDecoration(
                        gradient: AppColors.buttonGradientPurple,
                        borderRadius: BorderRadius.circular(4)
                    ),
                    child: Center(
                      child: Text('Add',style: TextStyle(color: Colors.white),),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
