import 'package:we_fast/essentails.dart';

class BottomNavBarController extends GetxController{
  var tabIndex = 0.obs;
  void changeTabIndex(int index){
    tabIndex(index);
  }
}