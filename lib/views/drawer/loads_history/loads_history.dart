import 'package:we_fast/constants/constants.dart';
import 'package:we_fast/controllers/bookingListController.dart';
import 'package:we_fast/essentails.dart';
import 'package:we_fast/services/date_formatter.dart';
import 'package:we_fast/views/drawer/loads_history/loads_history_details.dart';
import 'package:we_fast/widgets/drawer_appbar.dart';
import 'package:we_fast/widgets/empty_widget.dart';
import 'package:we_fast/widgets/error_widget.dart';
import 'package:we_fast/widgets/load_history_tile.dart';

class LoadsHistory extends GetView<BookingListController> {
  LoadsHistory({Key? key}) : super(key: key);
  BookingListController _bookingListController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DrawerAppBar(title: 'Loads History'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Text('ALL'), Icon(Icons.filter_list_outlined)],
            ),
          ),
          controller.obx(
              (state) => Expanded(
                    child: ListView.builder(
                        itemCount: state!.length,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) => LoadsHistoryTile(
                              bookingModel: state[index],
                            )),
                  ),
              onEmpty: CustomEmptyWidget(msg: "No Loads History"),
              onError: (err) => CustomErrorWidget(
                    err: err,
                  ))
        ],
      ),
    );
  }
}
