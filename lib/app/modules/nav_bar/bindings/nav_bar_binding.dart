import 'package:get/get.dart';
import 'package:mess_mate/app/modules/SavedPg/controllers/saved_pg_controller.dart';
import 'package:mess_mate/app/modules/UserProfile/controllers/user_profile_controller.dart';
import 'package:mess_mate/app/modules/User_Home/controllers/user_home_controller.dart';
// import 'package:mess_mate/app/modules/map_page/controllers/map_page_controller.dart';

import '../controllers/nav_bar_controller.dart';

class NavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavBarController>(() => NavBarController());
    Get.lazyPut<UserHomeController>(() => UserHomeController());
    Get.lazyPut<UserProfileController>(() => UserProfileController());
    // Get.lazyPut<MapPageController>(() => MapPageController());
    Get.lazyPut<SavedPgController>(() => SavedPgController());
  }
}
