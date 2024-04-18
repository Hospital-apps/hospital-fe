import 'package:get/get.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin {
  var selectedIndex = 1.obs;
  late MotionTabBarController _motionTabBarController;

  @override
  void onInit() {
    _motionTabBarController = MotionTabBarController(
      initialIndex: 0,
      length: 4,
      vsync: this,
    );
    super.onInit();
  }

  @override
  void onClose() {
    _motionTabBarController.dispose();
    super.onClose();
  }

  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }

  MotionTabBarController get motionTabBarController => _motionTabBarController;
}
