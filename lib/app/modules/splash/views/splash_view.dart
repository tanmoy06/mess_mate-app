import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mess_mate/app/constants/app_colors.dart';
import 'package:mess_mate/app/constants/app_text.dart';
import 'package:mess_mate/app/constants/app_text_styles.dart';
import 'package:mess_mate/app/constants/assets.dart';
import 'package:mess_mate/app/service/responsive_ui_service.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              Assets.messMateLogo,
              height: 64,
              width: 70,
              color: AppColors.white,
            ),
          ),
          30.kheightBox,
          Text(
            AppStrings.findYourPerfectMess,
            style: AppTextStyles.sans400(color: AppColors.white),
          ),
          Text(
            AppStrings.minutes,
            style: AppTextStyles.sans400(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
