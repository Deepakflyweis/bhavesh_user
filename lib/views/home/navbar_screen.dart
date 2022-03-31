import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:we_fast/constants/constants.dart';
import 'package:we_fast/controllers/bottom_navbar_controller.dart';
import 'package:get/get.dart';
import 'package:we_fast/essentails.dart';
import 'package:we_fast/nav_bar_icons_icons.dart';
import 'package:we_fast/views/home/account/account_screen.dart';
import 'package:we_fast/views/home/booking/booking_screen.dart';
import 'package:we_fast/views/home/home_screen/home_screen.dart';
import 'package:we_fast/views/home/payments_screen/payment_screen.dart';

class NavBarScreen extends StatelessWidget {
  NavBarScreen({
    Key? key,
  }) : super(key: key);
  final BottomNavBarController bottomNavBarController =
      Get.put(BottomNavBarController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> navBarItem = [
      BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(
            NavBarIcons.home_icon,
            size: 15.sp,
          )),
      BottomNavigationBarItem(
          label: 'Bookings',
          icon: Icon(
            NavBarIcons.bookings_icon,
            size: 15.sp,
          )),
      BottomNavigationBarItem(
          label: 'Payments',
          icon: Icon(
            NavBarIcons.payments_icon,
            size: 15.sp,
          )),
      BottomNavigationBarItem(
          label: 'Accounts',
          icon: Icon(
            NavBarIcons.accounts_icon,
            size: 15.sp,
          )),
    ];
    final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.grey,
    );
    final TextStyle selectedLabelStyle = TextStyle(
      color: AppColors.primaryColor,
    );
    return Obx(() => Scaffold(
          body: IndexedStack(
            index: bottomNavBarController.tabIndex.value,
            children: [
              HomeScreen(),
              BookingScreen(),
              PaymentsScreen(),
              AccountScreen()
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: bottomNavBarController.tabIndex.value,
            onTap: bottomNavBarController.changeTabIndex,
            selectedLabelStyle: selectedLabelStyle,
            unselectedLabelStyle: unselectedLabelStyle,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: Colors.grey,
            items: navBarItem,
          ),
        ));
  }
}
