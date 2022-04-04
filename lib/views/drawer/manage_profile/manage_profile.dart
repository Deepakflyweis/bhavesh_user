import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:we_fast/constants/constants.dart';
import 'package:we_fast/controllers/account_controller.dart';
import 'package:we_fast/controllers/manage_profile_controller.dart';
import 'package:we_fast/widgets/drawer_appbar.dart';
import 'package:we_fast/widgets/error_widget.dart';

import '../../../essentails.dart';

class ManageProfileScreen extends GetView<ManageProfileController> {
  ManageProfileScreen({Key? key}) : super(key: key);
  ManageProfileController _manageProfileController =
      Get.put(ManageProfileController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: DrawerAppBar(
          title: 'Edit Profile',
        ),
        body: controller.obx(
            (state) => Form(
                  key: controller.key,
                  child: Column(
                    children: [
                      Spacer(),
                      Obx(
                        () => Stack(
                          children: [
                            ClipOval(
                              child: InkWell(
                                onTap: () {
                                  controller.pickImage();
                                },
                                child: controller.image.value.path == ""
                                    ? Image.network(
                                        controller.imageUrl.value ?? "",
                                        height: 15.h,
                                        errorBuilder: (context, _, __) => Icon(
                                            Icons.account_circle_outlined,
                                            color: Colors.grey,
                                            size: 80.sp),
                                      )
                                    : Image.file(
                                        controller.image.value,
                                        height: 15.h,
                                      ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Icon(
                                Icons.edit,
                                color: controller.image.value.path == ""
                                    ? Colors.red
                                    : Colors.green,
                                size: 30.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Obx(() => Visibility(
                            visible: controller.imageUrl.value == null,
                            child: Text(
                              "Select User Image",
                              style: TextStyle(color: Colors.red),
                            ),
                          )),
                      Spacer(),
                      TextFormField(
                        validator: (val) {
                          if (val == "") {
                            return "Enter User Name";
                          }
                        },
                        cursorColor: Colors.black,
                        controller: controller.name,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          constraints: BoxConstraints(
                            minHeight: 5.h,
                            maxWidth: 75.w,
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(50)),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(50)),
                          hintText: 'User Name',
                          hintStyle: const TextStyle(color: Colors.grey),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Phone Number: ",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              controller.state!.phoneNumber,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: AppColors.primaryColor),
                        onPressed: () {
                          controller.callEditProfileApi();
                        },
                        child: Text("SUBMIT"),
                      ),
                      Spacer(
                        flex: 5,
                      )
                    ],
                  ),
                ),
            onError: (err) => CustomErrorWidget(
                  err: err,
                )),
      ),
    );
  }
}
