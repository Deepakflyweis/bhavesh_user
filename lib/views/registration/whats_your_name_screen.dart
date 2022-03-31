// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:we_fast/constants/constants.dart';
import 'package:we_fast/controllers/whats_your_name_controller.dart';
import 'package:we_fast/essentails.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:we_fast/views/home/navbar_screen.dart';

class WhatsYourNameScreen extends StatelessWidget {
  WhatsYourNameScreen({Key? key}) : super(key: key);
  WhatsYourNameController controller = Get.put(WhatsYourNameController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 15.h),
          child: PhysicalModel(
            color: Colors.transparent,
            elevation: 3,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(20))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "What's your name?",
                    style: TextStyle(fontSize: 12.sp),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      'Knowing your name will help couriers contact or find you quicker',
                      style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                    ),
                  ),
                  Form(
                    key: controller.key,
                    child: TextFormField(
                      autofocus: true,
                      controller: controller.name,
                      validator: controller.namevalidator,
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.primaryColor))),
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: InkWell(
                          onTap: () {
                            controller.checkName();
                          },
                          child: SvgPicture.asset(
                              'assets/icons/grey_right_button.svg')),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
