import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mess_mate/app/routes/app_pages.dart';

class OnboardingController extends GetxController {
  PageController pageController = PageController();
  RxInt currentPage = 0.obs;

  void nextPage() {
    if (currentPage.value < 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  void previousPage() {
    if (currentPage.value > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  void onSkip() {
    pageController.jumpToPage(2);
  }

  void getStarted() {
    Get.offAllNamed(Routes.LOGIN);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
