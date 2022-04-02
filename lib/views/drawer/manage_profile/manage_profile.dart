import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: DrawerAppBar(
        title: 'Edit Profile',
      ),
      body: controller.obx(
          (state) => Column(
                children: [
                  Obx(
                    () => ClipOval(
                      child: InkWell(
                        onTap: () {
                          controller.pickImage();
                        },
                        child: controller.image.value.path == ""
                            ? Icon(
                                Icons.image_search_sharp,
                                size: 40.sp,
                              )
                            : Image.network(
                                state!.profileImage ?? "",
                                height: 5.h,
                                errorBuilder: (context, _, __) => Icon(
                                    Icons.account_circle_outlined,
                                    color: Colors.grey,
                                    size: 40.sp),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
          onError: (err) => CustomErrorWidget(
                err: err,
              )),
    );
  }
}
