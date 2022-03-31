import 'package:we_fast/constants/constants.dart';
import 'package:we_fast/essentails.dart';
import 'package:we_fast/widgets/buttons/image_text_button.dart';
import 'package:we_fast/widgets/drawer_appbar.dart';

class ReferAndEarn extends StatelessWidget {
  const ReferAndEarn({Key? key}) : super(key: key);

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
                  Image.asset(
                    'assets/images/money_bag.png',
                    width: 45.w,
                  ),
                  Text(
                    'Invite & Earn',
                    style: TextStyle(fontSize: 13.sp),
                  ),
                  Text(
                    'Earn Upto',
                  ),
                  Text(
                    '${RupeeSymbol.rupeeSymbol} 150',
                    style: TextStyle(fontSize: 15.sp, color: Colors.green),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Share'),
                  ),
                  GridView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, mainAxisExtent: 12.h),
                    children: [
                      ImageTextButton(
                        img: 'assets/icons/whatsapp_icon2.png',
                        title: 'Whatsapp',
                        onTap: () {},
                      ),
                      ImageTextButton(
                          img: 'assets/icons/facebook.png',
                          title: 'Facebook',
                          onTap: () {}),
                      ImageTextButton(
                          img: 'assets/icons/twitter.png',
                          title: 'Twitter',
                          onTap: () {}),
                      ImageTextButton(
                          img: 'assets/icons/messenger.png',
                          title: 'Messenger',
                          onTap: () {}),
                      ImageTextButton(
                          img: 'assets/icons/more_icon.png',
                          title: 'More',
                          onTap: () {})
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
