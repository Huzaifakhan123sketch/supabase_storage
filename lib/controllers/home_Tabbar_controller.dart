import 'package:get/get.dart';

class HomeTabbarController extends GetxController {
  var selectedIndex = 0.obs;

  void changeIndex(value) {
    selectedIndex.value = value;
  }
}
