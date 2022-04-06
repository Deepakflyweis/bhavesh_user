class WeightConverter {
  static String convertLbsToKg({required String lbs}) {
    return (0.453592 * double.parse(lbs)).toStringAsFixed(2);
  }

  static String convertKgToLbs({required String kg}) {
    return (2.20462 * double.parse(kg)).toStringAsFixed(2);
  }
}
