import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'package:we_fast/constants/constants.dart';
import 'package:we_fast/models/booking_model.dart';
import 'package:we_fast/services/date_formatter.dart';
import 'package:we_fast/views/drawer/loads_history/loads_history_details.dart';

class LoadsHistoryTile extends StatelessWidget {
  const LoadsHistoryTile({
    Key? key,
    required this.bookingModel,
  }) : super(key: key);

  final BookingModel bookingModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: PhysicalModel(
        color: Colors.white,
        elevation: 3,
        borderRadius: BorderRadius.circular(6),
        child: Container(
          height: 120,
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(6)),
          child: Padding(
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
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(bookingModel.pickupAddress +
                        "-----------" +
                        bookingModel.dropAddress),
                    Text(
                      "Load Id: " + bookingModel.id,
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "Load Date: ${DateFormatter.formatToTextDateTime(bookingModel.createdAt)}",
                      style: TextStyle(color: Colors.grey, fontSize: 9.sp),
                    ),
                    Spacer(),
                    Text(
                      "Load Total Amount: ${RupeeSymbol.rupeeSymbol} xxxxxx", //+bookingModel.amout
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          gradient: AppColors.buttonGradientRed),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 3, horizontal: 7),
                        child: Text(
                          bookingModel.status,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => LoadsHistoryDetails(
                              bookingModel: bookingModel,
                            ));
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'View Details',
                            style:
                                TextStyle(color: Colors.indigo, fontSize: 12),
                          ),
                          Icon(
                            Icons.chevron_right,
                            color: Colors.indigo,
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
