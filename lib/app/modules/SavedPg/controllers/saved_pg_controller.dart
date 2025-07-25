import 'dart:convert';

// import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mess_mate/app/constants/app_urls.dart';
import 'package:mess_mate/app/data/provider/api_provider.dart';
import 'package:mess_mate/app/models/pg_owner_model.dart';
import 'package:mess_mate/app/service/login_service.dart';

class SavedPgController extends GetxController {
  final LoginService _loginService = Get.find<LoginService>();
  final RxBool isLoading = false.obs;
  var messList = <PgOwnerModel>[].obs;

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
      http.Response response = await ApiProvider.getWithAuth(
        AppUrls.getSavedMess,
      );
      if (response.statusCode == 200) {
        // debugPrint(jsonEncode(jsonDecode(response.body)), wrapWidth: 1024);
        try {
          final List<dynamic> savedMess = jsonDecode(response.body);
          final data =
              savedMess
                  .map(
                    (item) =>
                        PgOwnerModel.fromJson(item as Map<String, dynamic>),
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

  @override
  void onInit() {
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
