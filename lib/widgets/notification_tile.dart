import 'package:we_fast/controllers/notification_controller.dart';
import 'package:we_fast/essentails.dart';
import 'package:we_fast/models/notification_model.dart';

class NotificationsTile extends StatelessWidget {
  const NotificationsTile({Key? key, required this.notification})
      : super(key: key);
  final NotificationModel notification;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: PhysicalModel(
          color: Colors.white,
          elevation: 3,
          borderRadius: BorderRadius.circular(6),
          child: ListTile(
            leading: Image.asset(
              'assets/icons/notification_tile_icon.png',
              height: 30,
            ),
            title: SizedBox(
              width: 70.w,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  notification.message,
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
            trailing: PopupMenuButton(
                itemBuilder: (context) => [
                      PopupMenuItem(
                          value: "deleteNotification",
                          onTap: () {
                            Navigator.pop(context, "deleteNotification");
                            NotificationController _notificationController =
                                Get.find();
                            _notificationController
                                .callDeleteNotificationApi(notification.id);
                          },
                          child: Center(
                              child: Text(
                            'Delete',
                            style: TextStyle(fontSize: 13),
                          )))
                    ]),
          )),
    );
  }
}
