import 'package:we_fast/constants/constants.dart';
import 'package:we_fast/essentails.dart';
import 'package:we_fast/models/booking_model.dart';
import 'package:we_fast/services/date_formatter.dart';
import 'package:we_fast/widgets/sender_reciver_tile.dart';
import 'package:we_fast/widgets/start_stop_widget.dart';

class LoadsHistoryDetails extends StatelessWidget {
  const LoadsHistoryDetails({
    Key? key,
    required this.bookingModel,
  }) : super(key: key);
  final BookingModel bookingModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.chevron_left,
            color: Colors.black,
            size: 25.sp,
          ),
        ),
        backgroundColor: Colors.white,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Load Id: " + bookingModel.id,
              style: TextStyle(color: Colors.black, fontSize: 13.sp),
            ),
            Text(
              DateFormatter.formatToTextDateTime(bookingModel.createdAt),
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            )
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'History',
                    style: TextStyle(color: Colors.black, fontSize: 15.sp),
                  ),
                ),
                Container(
                  height: 2,
                  width: 70.w,
                  color: Colors.grey.shade200,
                )
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Container(
              color: Colors.grey.shade200,
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        bookingModel.vehicleType.image,
                        height: 75,
                        errorBuilder: (context, _, __) => const Center(
                          child: Icon(Icons.image),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(bookingModel.vehicleType.name),
                      const Text(
                        "Vehicle Number",
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        bookingModel.vehicle.vehicleNumber.toString(),
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Text(
                        "${RupeeSymbol.rupeeSymbol} " +
                            bookingModel.amount.toString(),
                        style: const TextStyle(color: Colors.green),
                      ),
                      const Text(
                        "Total Amount",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SenderReceiverTile(
              sMobile: bookingModel.senderDetails.phoneNumber,
              sName: bookingModel.senderDetails.name,
              rMobile: bookingModel.receiverDetails.phoneNumber,
              rName: bookingModel.receiverDetails.name,
            ),
            Container(
              width: 100.w,
              decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  border: Border.all(color: Colors.grey.shade100)),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Pickup and Drop Location'),
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: StartStopWidget(
                    distance: 35,
                  ),
                ),
                Column(
                  children: [
                    Container(
                      height: 15.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(4)),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: const Text(
                              'Present Address',
                              style: TextStyle(color: Colors.grey),
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 15.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(4)),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Reciever's Address",
                              style: TextStyle(color: Colors.grey),
                            ),
                          )),
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 5.h,
                  //width: 50.w,
                  decoration: BoxDecoration(
                      gradient: AppColors.buttonGradientPurple,
                      borderRadius: BorderRadius.circular(6)),
                  child: const Center(
                      child: Text(
                    'REQUEST CANCELED',
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
