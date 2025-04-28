import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mess_mate/app/routes/app_pages.dart';

class SplashController extends GetxController {
  var opacity = 0.0.obs;
  final storage = GetStorage();
  @override
  void onInit() {
    super.onInit();

    Future.delayed(const Duration(milliseconds: 100), () {
      opacity.value = 1.0;
    });

    Future.delayed(const Duration(seconds: 3), () {
      _checkLoginStatus();
    });
  }

  void _checkLoginStatus() {
    String? token = storage.read('accessToken');
    if (token != null) {
      Get.offAllNamed(Routes.NAV_BAR);
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
  }
}
