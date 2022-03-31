import 'package:we_fast/constants/constants.dart';
import 'package:we_fast/controllers/notification_controller.dart';
import 'package:we_fast/essentails.dart';
import 'package:we_fast/widgets/notification_tile.dart';

class NotificationScreen extends GetView<NotificationController> {
  NotificationScreen({Key? key}) : super(key: key);
  NotificationController controller = Get.put(NotificationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.black),
        ),
        automaticallyImplyLeading: true,
      ),
      body: RefreshIndicator(
        displacement: 2.h,
        onRefresh: () async {
          await controller.callGetNotificationApi();
        },
        child: controller.obx(
          (state) => ListView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state!.length,
            itemBuilder: (context, index) =>
                NotificationsTile(notification: state[index]),
          ),
          onError: (err) => Center(
            child: Text(
              err.toString(),
            ),
          ),
          onEmpty: Center(
            child: Text(
              "No Notifications",
            ),
          ),
        ),
      ),
    );
  }
}
