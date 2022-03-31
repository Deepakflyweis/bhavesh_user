import 'package:we_fast/constants/enums.dart';
import 'package:we_fast/essentails.dart';
import 'package:we_fast/services/date_formatter.dart';
import 'package:we_fast/widgets/tracking_status_widget.dart';

class TrackingBottomModal extends StatelessWidget {
  const TrackingBottomModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: .8,
      builder: (BuildContext context, ScrollController scrollController) =>
          Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Text(
                        'Today, ${DateFormatter.timeFormatter(DateTime.now())}',
                        style: TextStyle(fontSize: 11.sp),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Text(
                        'Trip_id: xyz12233',
                        style: TextStyle(fontSize: 11.sp),
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 3.h,
                  thickness: 1,
                  color: Colors.grey,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: TrackingStatusWidget(
                    status: trackingStatus.arrived,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
