import 'package:we_fast/constants/constants.dart';
import 'package:we_fast/controllers/bookingListController.dart';
import 'package:we_fast/essentails.dart';
import 'package:we_fast/widgets/appbar.dart';
import 'package:we_fast/widgets/booking_tile.dart';
import 'package:we_fast/widgets/empty_widget.dart';
import 'package:we_fast/widgets/error_widget.dart';

class BookingScreen extends GetView<BookingListController> {
  BookingListController _bookingListController =
      Get.put(BookingListController());
  @override
  Widget build(BuildContext context) {
    final TextEditingController searchBooking = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
          titleWidget: Text(
        'All Bookings',
        style: TextStyle(color: Colors.black),
      )),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: PhysicalModel(
              borderRadius: BorderRadius.circular(25),
              elevation: 3,
              color: Colors.white,
              child: TextField(
                style: TextStyle(fontSize: 15),
                controller: searchBooking,
                decoration: InputDecoration(
                    isDense: true,
                    hintText: 'Search your orders here',
                    suffixIconColor: Colors.grey,
                    prefixIconColor: Colors.grey,
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.filter_list_outlined),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(25)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(25))),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: controller.obx(
                    ((state) => ListView.builder(
                        itemCount: state!.length,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) => BookingTile(
                              bookingModel: state[index],
                            ))),
                    onError: (err) => CustomErrorWidget(err: err.toString()),
                    onEmpty: CustomEmptyWidget(msg: "No Booking Right Now")),
              ),
            ),
          )
        ],
      ),
    );
  }
}
