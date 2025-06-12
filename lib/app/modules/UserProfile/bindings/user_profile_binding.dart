import 'package:get/get.dart';
import 'package:mess_mate/app/modules/User_Home/controllers/user_home_controller.dart';

import '../controllers/user_profile_controller.dart';

class UserProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserHomeController>(() => UserHomeController());
    Get.lazyPut<UserProfileController>(() => UserProfileController());
  }
}
