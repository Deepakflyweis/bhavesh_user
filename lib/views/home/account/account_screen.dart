import 'package:get_storage/get_storage.dart';
import 'package:we_fast/constants/constants.dart';
import 'package:we_fast/controllers/account_controller.dart';
import 'package:we_fast/essentails.dart';
import 'package:we_fast/views/drawer/help_and_support/help_and_support.dart';
import 'package:we_fast/widgets/appbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:we_fast/widgets/buttons/border_button.dart';
import 'package:we_fast/widgets/error_widget.dart';

import '../../drawer/manage_profile/manage_profile.dart';
import '../../login/login_screen.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({Key? key}) : super(key: key);
  final AccountController accountController = Get.put(AccountController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        titleWidget: Text(
          'Account',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/account_bg.png',
              width: 70.w,
            ),
          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/icons/logo.svg',
                    height: 7.h,
                  ),
                  Text(
                    '${AppName.appName}',
                    style: TextStyle(color: Colors.black, fontSize: 15.sp),
                  ),
                  accountController.obx(
                      (state) => Row(
                            children: [
                              Text(
                                state!.name,
                                style: TextStyle(fontSize: 12.sp),
                              ),
                              Spacer(),
                              Text(
                                state.phoneNumber,
                                style: TextStyle(
                                    fontSize: 10.sp, color: Colors.grey),
                              ),
                            ],
                          ),
                      onError: (err) => CustomErrorWidget(
                            err: err,
                          )),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Get.to(() => ManageProfileScreen());
                      },
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(color: AppColors.primaryColor),
                      ),
                    ),
                  ),
                  Row(
                    //todo setup Invite
                    children: [Text('Invite friends '), Icon(Icons.share)],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/icons/whatsapp.png',
                          height: 6.h,
                        ),
                        Image.asset(
                          'assets/icons/facebook.png',
                          height: 8.h,
                        ),
                        Image.asset(
                          'assets/icons/twitter.png',
                          height: 6.h,
                        )
                      ],
                    ),
                  ),
                  BorderButton(title: 'xxxxxxxx', onTap: () {}),
                  Text(
                    'Copy 🔗',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  Obx(() => SwitchListTile(
                        activeColor: AppColors.primaryColor,
                        secondary: Image.asset(
                          'assets/icons/notifications_settings.png',
                          height: 5.h,
                        ),
                        value: accountController.notificationsSetting.value,
                        onChanged: accountController.changeNotificationSetting,
                        title: Text(
                          'Notifications',
                          style: TextStyle(fontSize: 12.sp),
                        ),
                      )),
                  ListTile(
                    onTap: () {
                      Get.to(() => HelpAndSupport());
                    },
                    leading: Image.asset(
                      'assets/icons/contact_us.png',
                      height: 5.h,
                    ),
                    title: Text.rich(TextSpan(children: [
                      TextSpan(text: 'Contact Us'),
                      TextSpan(
                          text: '\nFor any queries or help',
                          style: TextStyle(color: Colors.grey))
                    ])),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      GetStorage box = GetStorage();
                      box.erase();
                      Get.offAll(() => LoginScreen());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icons/logout_icon.png',
                          height: 4.h,
                        ),
                        Text(
                          ' LOGOUT',
                          style: TextStyle(
                              color: AppColors.primaryColor, fontSize: 12.sp),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
