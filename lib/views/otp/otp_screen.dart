// ignore_for_file: must_be_immutable

import 'package:we_fast/constants/constants.dart';
import 'package:we_fast/controllers/otp_controller.dart';
import 'package:we_fast/essentails.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:we_fast/widgets/buttons/rounded_gradient_button.dart';
import 'package:we_fast/widgets/otp_input.dart';

class OtpScreen extends StatelessWidget {
  OtpController otpController = Get.put(OtpController());
  OtpScreen({Key? key, required this.isLogin}) : super(key: key);
  final bool isLogin;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: PhysicalModel(
                color: Colors.transparent,
                elevation: 3,
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(20)),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  width: double.infinity,
                  height: 68.h,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(20))),
                  child: Column(
                    children: [
                      const Spacer(),
                      Hero(
                        tag: 'logo',
                        child: SvgPicture.asset(
                          'assets/icons/logo.svg',
                          semanticsLabel: 'Logo',
                          height: 10.h,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'Auto Verifying One Time Password that we have sent to you:',
                        style: TextStyle(fontSize: 12.sp),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OtpInput(
                              controller: otpController.otpControllers[0],
                              autoFocus: true),
                          OtpInput(
                              controller: otpController.otpControllers[1],
                              autoFocus: false),
                          OtpInput(
                              controller: otpController.otpControllers[2],
                              autoFocus: false),
                          OtpInput(
                              controller: otpController.otpControllers[3],
                              autoFocus: false),
                          OtpInput(
                              controller: otpController.otpControllers[4],
                              autoFocus: false),
                          OtpInput(
                              controller: otpController.otpControllers[5],
                              autoFocus: false),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Obx(() => InkWell(
                                onTap: () {
                                  isLogin
                                      ? otpController.resendLoginOtp()
                                      : otpController.resendRegisterOtp();
                                },
                                child: Text(
                                  'Resend',
                                  style: TextStyle(
                                      color: otpController.elapsedTime.value ==
                                              "00:00"
                                          ? AppColors.primaryColor
                                          : Colors.grey),
                                ),
                              )),
                          Obx(
                            () => Text(
                              '${otpController.elapsedTime.value} secs',
                              style: const TextStyle(color: Colors.grey),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RoundedGradientButton(
                            title: 'VERIFY',
                            gradient: AppColors.buttonGradientPurple,
                            onTap: () {
                              otpController.checkOtp(isLogin);
                            }),
                      ),
                      const Spacer(
                        flex: 2,
                      )
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            Text(
              'Version ${Version.version}',
              style: TextStyle(color: AppColors.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
