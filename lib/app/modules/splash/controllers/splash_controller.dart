import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mess_mate/app/routes/app_pages.dart';
import 'package:mess_mate/app/service/login_service.dart';

class SplashController extends GetxController {
  var opacity = 0.0.obs;

  final storage = GetStorage();
  final LoginService _loginService = Get.find<LoginService>();
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

  Future<void> _checkLoginStatus() async {
    bool isFirstTime = storage.read('isFirstTime') ?? true;
    bool isLoggedIn = await _loginService.isLoggedIn();
    String? token = await _loginService.getJwtToken();
    if (isFirstTime) {
      storage.write('isFirstTime', false);
      Get.offAllNamed(Routes.ONBOARDING);
    } else if (isLoggedIn && token != null) {
      Get.offAllNamed(Routes.NAV_BAR);
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
  }
}
