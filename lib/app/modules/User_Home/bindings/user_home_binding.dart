import 'package:get/get.dart';
import 'package:mess_mate/app/modules/map_page/controllers/map_page_controller.dart';

import '../controllers/user_home_controller.dart';

class UserHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserHomeController>(() => UserHomeController());
    Get.lazyPut<MapPageController>(() => MapPageController());
  }
}
