import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:we_fast/views/drawer/drawer.dart';
import 'package:we_fast/views/notification/notification_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key, required this.titleWidget}) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(50);
  final Widget titleWidget;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: Center(
        child: InkWell(
            onTap: () {
              Get.to(() => SideDrawer());
            },
            child: SvgPicture.asset(
              'assets/icons/menu.svg',
              height: 35,
              fit: BoxFit.fitHeight,
            )),
      ),
      title: titleWidget,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Center(
              child: InkWell(
                  onTap: () {
                    Get.to(() => NotificationScreen());
                  },
                  child: Image.asset(
                    'assets/icons/notification_icon.png',
                    height: 30,
                    fit: BoxFit.fitHeight,
                  ))),
        )
      ],
    );
  }
}
