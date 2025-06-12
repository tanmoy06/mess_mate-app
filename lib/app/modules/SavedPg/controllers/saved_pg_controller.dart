import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mess_mate/app/constants/app_urls.dart';
import 'package:mess_mate/app/data/provider/api_provider.dart';
import 'package:mess_mate/app/models/messModel.dart';
import 'package:mess_mate/app/service/auth_service.dart';
import 'package:mess_mate/app/service/login_service.dart';

class SavedPgController extends GetxController {
  final LoginService _loginService = Get.find<LoginService>();
  final RxBool isLoading = false.obs;
  var messList = <MessUserModel>[].obs;

  Future<void> _fetchSavedMess() async {
    isLoading.value = true;
    try {
      String? jwtToken = await _loginService.getJwtToken();

      if (jwtToken == null || jwtToken.isEmpty) {
        Get.snackbar(
          'Error',
          'Authentication token missing. Please log in again.',
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }
      http.Response response = await ApiProvider.get(AppUrls.getSavedMess);
      if (response.statusCode == 401 || response.statusCode == 403) {
        final success = await AuthService().refreshAccessToken();
        if (success) {
          jwtToken = await _loginService.getJwtToken();
          response = await ApiProvider.get(AppUrls.getSavedMess);
        } else {
          Get.snackbar(
            'Session Expired',
            'Please log in again.',
            snackPosition: SnackPosition.BOTTOM,
          );
          await _loginService.clearUserSession();
          // Optional redirect:
          // Get.offAllNamed(Routes.LOGIN);
          return;
        }
      }
      if (response.statusCode == 200) {
        try {
          final List<dynamic> savedMess = jsonDecode(response.body);
          final data =
              savedMess
                  .map(
                    (item) =>
                        MessUserModel.fromJson(item as Map<String, dynamic>),
                  )
                  .toList();
          messList.value = data;
        } catch (e) {
          print("Fetch error: $e");
        }
      } else {
        print('Failed to fetch. Status: ${response.statusCode}');
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _checkAuthStatus() async {
    await AuthService().refreshAccessToken();
  }

  @override
  void onInit() {
    _checkAuthStatus();
    _fetchSavedMess();
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
