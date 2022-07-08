import 'package:we_fast/constants/constants.dart';
import 'package:we_fast/essentails.dart';
import 'package:we_fast/models/vehicle_details_model.dart';

class VehicleDetailsDialogContent extends GetView {
  const VehicleDetailsDialogContent({
    Key? key,
    required this.vehicleDetailsModel,
    required this.onTap,
  }) : super(key: key);

  final VehicleDetailsModel vehicleDetailsModel;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Vehicle Details',
              style: TextStyle(
                fontSize: 13.sp,
              ),
            ),
            InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(Icons.clear))
          ],
        ),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade300,
                        offset: Offset(1, 1.15),
                        blurRadius: 0.55)
                  ],
                  border: Border.all(
                    color: Colors.grey.shade300,
                  )),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text.rich(TextSpan(children: [
                  TextSpan(
                    text: 'Base Fare: ',
                    style: TextStyle(fontSize: 8.sp),
                  ),
                  TextSpan(
                    text: '${RupeeSymbol.rupeeSymbol}' +
                        vehicleDetailsModel.baseFare.toString(),
                    style: TextStyle(fontSize: 8.sp, color: Colors.grey),
                  )
                ])),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade300,
                        offset: Offset(1, 1.15),
                        blurRadius: 0.55)
                  ],
                  border: Border.all(
                    color: Colors.grey.shade300,
                  )),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text.rich(TextSpan(children: [
                  TextSpan(
                    text: 'Per Km: ',
                    style: TextStyle(fontSize: 8.sp),
                  ),
                  TextSpan(
                    text: '${RupeeSymbol.rupeeSymbol}' +
                        vehicleDetailsModel.pricePerKm.toString(),
                    style: TextStyle(fontSize: 8.sp, color: Colors.grey),
                  )
                ])),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade300,
                        offset: Offset(1, 1.15),
                        blurRadius: 0.55)
                  ],
                  border: Border.all(
                    color: Colors.grey.shade300,
                  )),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text.rich(TextSpan(children: [
                  TextSpan(
                    text: 'Per Minute: ',
                    style: TextStyle(fontSize: 8.sp),
                  ),
                  TextSpan(
                    text: '${RupeeSymbol.rupeeSymbol}' +
                        vehicleDetailsModel.pricePerMin.toString(),
                    style: TextStyle(fontSize: 8.sp, color: Colors.grey),
                  )
                ])),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(vehicleDetailsModel.dimensionImage,
              width: 70.w,
              errorBuilder: (context, Object, StackTrace) => Center(
                      child: Icon(
                    Icons.image,
                  ))),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade300,
                        offset: Offset(1, 1.15),
                        blurRadius: 0.55)
                  ],
                  border: Border.all(
                    color: Colors.grey.shade300,
                  )),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: 23.w,
                        child: Text(
                          'Maximum Weight to be carried',
                          style: TextStyle(fontSize: 9.sp),
                        )),
                    Text(
                      vehicleDetailsModel.loadWeight.toString(),
                      style: TextStyle(fontSize: 10.sp, color: Colors.grey),
                    )
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade300,
                        offset: Offset(1, 1.15),
                        blurRadius: 0.55)
                  ],
                  border: Border.all(
                    color: Colors.grey.shade300,
                  )),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: 23.w,
                        child: Text(
                          'Road clearance measurements',
                          style: TextStyle(fontSize: 9.sp),
                        )),
                    Text(
                      vehicleDetailsModel.roadClearance,
                      style: TextStyle(fontSize: 10.sp, color: Colors.grey),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: onTap,
            child: Container(
              height: 5.h,
              width: 50.w,
              decoration: BoxDecoration(
                  gradient: AppColors.buttonGradientPurple,
                  borderRadius: BorderRadius.circular(6)),
              child: Center(
                  child: Text(
                'Select Vehicle',
                style: TextStyle(color: Colors.white),
              )),
            ),
          ),
        ),
      ],
    );
  }
}
