import 'package:get/get.dart';
import 'package:mess_mate/app/modules/home/controllers/home_controller.dart';

import '../controllers/nav_bar_controller.dart';

class NavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavBarController>(() => NavBarController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
