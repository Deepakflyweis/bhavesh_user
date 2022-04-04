import 'package:get_storage/get_storage.dart';
import 'package:we_fast/constants/constants.dart';
import 'package:we_fast/controllers/account_controller.dart';
import 'package:we_fast/controllers/bottom_navbar_controller.dart';
import 'package:we_fast/essentails.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:we_fast/views/drawer/help_and_support/help_and_support.dart';
import 'package:we_fast/views/drawer/loads_history/loads_history.dart';
import 'package:we_fast/views/drawer/manage_profile/manage_profile.dart';
import 'package:we_fast/views/drawer/my_wallet/my_wallet.dart';
import 'package:we_fast/views/drawer/refer_and_earn/refer_and_earn.dart';
import 'package:we_fast/views/home/navbar_screen.dart';
import 'package:we_fast/views/login/login_screen.dart';
import 'package:we_fast/views/notification/notification_screen.dart';
import 'package:we_fast/widgets/error_widget.dart';

class SideDrawer extends StatelessWidget {
  SideDrawer({Key? key}) : super(key: key);
  final BottomNavBarController navBarController = Get.find();
  AccountController accountController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.clear,
              color: AppColors.primaryColor,
            )),
        title: SvgPicture.asset(
          'assets/icons/logo.svg',
          height: 30,
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            accountController.obx(
              (state) => Container(
                color: AppColors.backgroundColor,
                height: 20.h,
                width: 100.w,
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 10.w,
                      ),
                      /* CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          'https://media.istockphoto.com/photos/smiling-indian-business-man-working-on-laptop-at-home-office-young-picture-id1307615661?b=1&k=20&m=1307615661&s=170667a&w=0&h=Zp9_27RVS_UdlIm2k8sa8PuutX9K3HTs8xdK0UfKmYk=',
                        ),
                      ), */
                      ClipOval(
                        child: Image.network(
                          state!.profileImage ?? "",
                          height: 23.w,
                          errorBuilder: (context, _, __) => Icon(
                              Icons.account_circle_outlined,
                              color: Colors.grey,
                              size: 40.sp),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 4.h,
                          ),
                          Text(
                            state.name,
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 13.sp),
                          ),
                          Text(
                            state.phoneNumber,
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 13.sp),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          InkWell(
                              onTap: () {
                                Get.off(() => ManageProfileScreen());
                              },
                              child: Text(
                                'Manage Profile',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13.sp,
                                    color: Colors.blue),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              onError: (error) => CustomErrorWidget(
                err: error,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {
                  navBarController.changeTabIndex(0);
                  Get.off(() => NavBarScreen());
                },
                leading: Image.asset(
                  'assets/icons/home.png',
                  height: 4.h,
                ),
                title: Text('Home'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {
                  navBarController.changeTabIndex(1);
                  Get.off(() => NavBarScreen());
                },
                leading: Image.asset(
                  'assets/icons/my_bookings.png',
                  height: 4.h,
                ),
                title: Text('My Bookings'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {
                  Get.off(() => MyWallet());
                },
                leading: Image.asset(
                  'assets/icons/my_wallet.png',
                  height: 4.h,
                ),
                title: Text('My Wallet'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {
                  Get.off(() => NotificationScreen());
                },
                leading: Image.asset(
                  'assets/icons/notification.png',
                  height: 4.h,
                ),
                title: Text('Notification'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {
                  Get.off(() => LoadsHistory());
                },
                leading: Image.asset(
                  'assets/icons/loads_history.png',
                  height: 4.h,
                ),
                title: Text('Loads History'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {
                  Get.off(() => HelpAndSupport());
                },
                leading: Image.asset(
                  'assets/icons/support.png',
                  height: 4.h,
                ),
                title: Text('Help & Support'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {
                  //todo setup invite and earn
                  Get.off(() => ReferAndEarn());
                },
                leading: Image.asset(
                  'assets/icons/invite_and_earn.png',
                  height: 4.h,
                ),
                title: Text('Invite & Earn'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {
                  GetStorage box = GetStorage();
                  box.erase();
                  Get.offAll(() => LoginScreen());
                },
                leading: Image.asset(
                  'assets/icons/logout.png',
                  height: 4.h,
                ),
                title: Text('Logout'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
