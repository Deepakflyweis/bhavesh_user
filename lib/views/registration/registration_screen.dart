// ignore_for_file: must_be_immutable

import 'package:we_fast/constants/constants.dart';
import 'package:we_fast/controllers/register_controller.dart';
import 'package:we_fast/essentails.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:we_fast/views/login/login_screen.dart';
import 'package:we_fast/views/otp/otp_screen.dart';
import 'package:we_fast/widgets/buttons/rounded_gradient_button.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({Key? key}) : super(key: key);
  RegisterController registerController = Get.put(RegisterController());
  TextEditingController mobileNumber = TextEditingController();
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
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(color: AppColors.primaryColor)),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Text(
                              'Signup',
                              style: TextStyle(color: AppColors.primaryColor),
                            )),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Register using mobile number',
                              style: TextStyle(fontSize: 15.sp),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Form(
                          key: registerController.numberKey,
                          child: TextFormField(
                            validator: registerController.numberValidator,
                            cursorColor: Colors.black,
                            controller: registerController.mobileNumber,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                constraints: BoxConstraints(
                                  minHeight: 5.h,
                                  maxWidth: 75.w,
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                prefixIcon: SizedBox(
                                  width: 15.w,
                                  child: Row(
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 8),
                                        child: Text(
                                          '+91',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                        child: const Center(
                                          child: VerticalDivider(
                                            color: Colors.grey,
                                            thickness: 1,
                                            width: 2,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                contentPadding:
                                    const EdgeInsets.only(left: 3, top: -6),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(50)),
                                border: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(50)),
                                hintText: 'Enter Mobile Number',
                                hintStyle: const TextStyle(color: Colors.grey)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RoundedGradientButton(
                            title: 'Register',
                            gradient: AppColors.buttonGradientPurple,
                            onTap: () {
                              registerController.checkNumber();
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Already registered with us?'),
                            InkWell(
                                onTap: () {
                                  Get.off(() => LoginScreen());
                                },
                                child: Text(
                                  'Login',
                                  style:
                                      TextStyle(color: AppColors.primaryColor),
                                ))
                          ],
                        ),
                      ),
                      const Spacer(
                        flex: 2,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.sp),
              child: const Text('OR'),
            ),
            Text(
              'Login with',
              style: TextStyle(color: AppColors.primaryColor),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/icons/google.png',
                  height: 10.h,
                  fit: BoxFit.fitHeight,
                ),
                Image.asset(
                  'assets/icons/facebook.png',
                  height: 10.h,
                  fit: BoxFit.fitHeight,
                ),
              ],
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
