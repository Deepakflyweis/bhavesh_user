import 'package:we_fast/constants/constants.dart';
import 'package:we_fast/essentails.dart';
import 'package:we_fast/widgets/contact_builder_widget.dart';
import 'package:we_fast/widgets/drawer_appbar.dart';

class HelpAndSupport extends StatelessWidget {
  const HelpAndSupport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: const DrawerAppBar(title: 'Help & Support'),
        body: Center(
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
                        subTitle: 'lorem is the simple \ntext which make the '),
                    ContactBuilder(
                        img: 'assets/images/contact_icon.png',
                        title: 'Contact',
                        subTitle: '+91 1234567890'),
                    ContactBuilder(
                        img: 'assets/images/mail_icon.png',
                        title: 'Mail',
                        subTitle: 'abc@gmail.com'),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
