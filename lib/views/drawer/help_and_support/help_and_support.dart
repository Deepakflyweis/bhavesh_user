import 'package:we_fast/constants/constants.dart';
import 'package:we_fast/controllers/help_and_support_controller.dart';
import 'package:we_fast/essentails.dart';
import 'package:we_fast/widgets/contact_builder_widget.dart';
import 'package:we_fast/widgets/drawer_appbar.dart';
import 'package:we_fast/widgets/error_widget.dart';

class HelpAndSupport extends GetView<HelpController> {
  HelpController helpController = Get.put(HelpController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: const DrawerAppBar(title: 'Help & Support'),
        body: controller.obx(
            (state) => Center(
                  child: PhysicalModel(
                    color: Colors.white,
                    elevation: 3,
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      width: 70.w,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ContactBuilder(
                                img: 'assets/images/address_icon.png',
                                title: 'Address',
                                subTitle: state!.address),
                            ContactBuilder(
                                img: 'assets/images/contact_icon.png',
                                title: 'Contact',
                                subTitle: state.phoneNumber),
                            ContactBuilder(
                                img: 'assets/images/mail_icon.png',
                                title: 'Mail',
                                subTitle: state.email),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            onError: (err) => CustomErrorWidget(
                  err: err,
                )));
  }
}
