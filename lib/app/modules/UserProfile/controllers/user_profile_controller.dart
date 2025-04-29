import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mess_mate/app/routes/app_pages.dart';

class UserProfileController extends GetxController {
  //TODO: Implement UserProfileController

  void logout() {
    final storage = GetStorage();
    storage.remove('accessToken');
    storage.remove('refreshToken');
    Get.offAllNamed(Routes.LOGIN);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
