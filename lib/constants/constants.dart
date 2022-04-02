import 'package:flutter/material.dart';

class AppColors {
  static const Color backgroundColor = const Color(0xffFFEBE5);
  static const Color primaryColor = const Color(0xffD87F31);
  static const Gradient buttonGradientPurple = const LinearGradient(
    colors: [Color(0xffE18181), Color(0xffB54493)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const Gradient buttonGradientOrange = const LinearGradient(
    colors: [Color(0xffF9AB67), Color(0xffBB6417)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const Gradient buttonGradientGreen = const LinearGradient(
    colors: [Color(0xff72FEA1), Color(0xff1CBC52)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const Gradient buttonGradientBlue = const LinearGradient(
    colors: [Color(0xffAFE8FB), Color(0xff237F9E)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const Gradient buttonGradientRed = const LinearGradient(
    colors: [Color(0xffFF8A8A), Color(0xffBF3333)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

class Version {
  static double version = 1.0;
}

class RupeeSymbol {
  static String rupeeSymbol = '₹';
}

class AppName {
  static String appName = 'AppName';
}
