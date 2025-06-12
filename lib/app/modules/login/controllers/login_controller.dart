import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:mess_mate/app/constants/app_urls.dart';
import 'package:mess_mate/app/routes/app_pages.dart';
import 'package:http/http.dart' as http;
import 'package:mess_mate/app/service/login_service.dart';

class LoginController extends GetxController {
  final LoginService _loginService = Get.find<LoginService>();
  late FocusNode emailFocus;
  late FocusNode passwordFocus;
  @override
  void onInit() {
    super.onInit();
    emailFocus = FocusNode();
    passwordFocus = FocusNode();
  }

  var email = ''.obs;
  var password = ''.obs;
  var isPasswordHidden = true.obs;
  var emailError = RxnString();
  var passwordError = RxnString();
  final storage = GetStorage();
  var isLoading = false.obs;
  var isRememberMeChecked = false.obs;
  var isTermsAnsConditionsChecked = false.obs;

  void toggleRememberMe(bool? value) {
    isRememberMeChecked.value = value ?? false;
  }

  void toggleTermsAndCondition(bool? value) {
    isTermsAnsConditionsChecked.value = value ?? false;
  }

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void validateEmail(String value) {
    email.value = value;
    if (value.isEmpty) {
      emailError.value = "Email is required";
    } else if (!GetUtils.isEmail(value)) {
      emailError.value = "Invalid email";
    } else {
      emailError.value = null;
    }
  }

  void validatePassword(String value) {
    password.value = value;
    if (value.isEmpty) {
      passwordError.value = "Password is required";
    } else if (value.length < 6) {
      passwordError.value = "Minimum 6 characters";
    } else {
      passwordError.value = null;
    }
  }

  bool validateAll() {
    validateEmail(email.value);
    validatePassword(password.value);
    if (emailError.value != null) {
      emailFocus.requestFocus();
      return false;
    }
    if (passwordError.value != null) {
      passwordFocus.requestFocus();
      return false;
    }

    return true;
  }

  void goToNavBar() {
    Get.offNamed(Routes.NAV_BAR);
  }

  Future<void> login() async {
    if (!validateAll()) {
      return;
    }
    if (!isTermsAnsConditionsChecked.value) {
      Get.snackbar('Terms & Conditions', 'Please check the box to continue');
      return;
    }

    isLoading.value = true;
    try {
      var response = await http.post(
        Uri.parse(AppUrls.login),
        headers: {'Content-type': 'application/json'},
        body: jsonEncode({"email": email.value, "password": password.value}),
      );

      if (response.statusCode == 200) {
        var bdy = jsonDecode(response.body);
        String message = bdy['message'];
        String? accessToken = bdy['accessToken'];
        String? refreshToken = bdy['refreshToken'];
        if (accessToken != null &&
            accessToken.isNotEmpty &&
            refreshToken != null &&
            refreshToken.isNotEmpty) {
          print('Received access Token: $accessToken');
          print('Received refresh Token: $refreshToken');
          try {
            Map<String, dynamic> payload = Jwt.parseJwt(accessToken);
            final String? userId = payload['id'];
            final String? userType = payload['type'];
            if (userId != null && userType != null) {
              await _loginService.saveUserSession(
                userId: userId,
                userType: userType,
                jwtToken: accessToken,
                refreshToken: refreshToken,
              );
              print(
                'User session (ID, Type, Access Token) saved securely via LoginService.',
              );
            } else {
              print(
                'Error: User ID or Type is null after decoding JWT. Session not saved.',
              );
            }
          } catch (e) {
            print('Error decoding JWT token: $e');
            Get.snackbar(
              'Login Error',
              'Failed to decode authentication token.',
            );
          }
        }

        // if (isRememberMeChecked.value) {
        //   // storage.write('accessToken', accessToken);
        //   storage.write('refreshToken', refreshToken);
        // }
        Get.snackbar('Success', message);
        Get.offAllNamed(Routes.NAV_BAR);
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    emailFocus.dispose();
    passwordFocus.dispose();
  }
}
