import 'package:we_fast/constants/constants.dart';
import 'package:we_fast/controllers/splash_controller.dart';
import 'package:we_fast/essentails.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  final SplashController controller = Get.put(SplashController());

  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: 'logo',
            child: SvgPicture.asset(
              'assets/icons/logo.svg',
              semanticsLabel: 'Logo',
              height: 10.h,
            ),
          ),
          Lottie.asset('assets/lottie/delivery_truck_animation.json'),
          const Text(
            "Lorem ipsum is randomly generated sample text",
            style: TextStyle(
                color: Color(0xff505050),
                fontStyle: FontStyle.italic,
                fontSize: 17),
          )
        ],
      ),
    );
  }
}
