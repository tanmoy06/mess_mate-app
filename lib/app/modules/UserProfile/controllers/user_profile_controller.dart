import 'package:get/get.dart';

import 'package:mess_mate/app/routes/app_pages.dart';
import 'package:mess_mate/app/service/login_service.dart';

class UserProfileController extends GetxController {
  final LoginService _loginService = Get.find<LoginService>();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> logout() async {
    await _loginService.clearUserSession();
    Get.offAllNamed(Routes.LOGIN);
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
