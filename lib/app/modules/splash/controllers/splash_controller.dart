import 'package:get/get.dart';
import 'package:mess_mate/app/routes/app_pages.dart';

class SplashController extends GetxController {
  var opacity = 0.0.obs;

  @override
  void onInit() {
    super.onInit();

    Future.delayed(const Duration(milliseconds: 100), () {
      opacity.value = 1.0;
    });

    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(Routes.LOGIN);
    });
  }
}
