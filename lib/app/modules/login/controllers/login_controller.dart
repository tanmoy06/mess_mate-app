import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
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
