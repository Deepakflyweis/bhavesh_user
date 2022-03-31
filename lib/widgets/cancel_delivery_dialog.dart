import 'package:we_fast/essentails.dart';
import 'package:we_fast/views/home/home_screen/search_location/cancelled_delivery_bottom_modal.dart';

class CancelDeliveryDialog extends StatelessWidget {
  const CancelDeliveryDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        // height: 20.h,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Are You sure you want to cancel this delivery?'),
            ),
            Container(
              height: 2,
              width: 80.w,
              color: Colors.grey.shade200,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                    Get.back();
                    Get.bottomSheet(CancelledDeliveryBottomModal(),
                        isDismissible: false);
                  },
                  child: Container(
                    width: 40.w - 3,
                    height: 5.h,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(8))),
                    child: Center(
                      child: Text(
                        'Yes',
                        style: TextStyle(color: Colors.green, fontSize: 11.sp),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.grey.shade200,
                  height: 5.h,
                  width: 2,
                ),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: 40.w - 3,
                    height: 5.h,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(8))),
                    child: Center(
                      child: Text(
                        'No',
                        style: TextStyle(color: Colors.red, fontSize: 11.sp),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
