import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mess_mate/app/components/custom_button.dart';
import 'package:mess_mate/app/constants/app_colors.dart';
import 'package:mess_mate/app/constants/app_text.dart';
import 'package:mess_mate/app/constants/app_text_styles.dart';
import 'package:mess_mate/app/constants/assets.dart';
import 'package:mess_mate/app/service/responsive_ui_service.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 100.w,
              height: 74.h,
              padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    30.kheightBox,
                    Obx(
                      () => TextField(
                        focusNode: controller.emailFocus,
                        onChanged: controller.validateEmail,
                        textInputAction: TextInputAction.next,
                        onSubmitted:
                            (value) => controller.passwordFocus.requestFocus(),
                        decoration: InputDecoration(
                          hintText: AppStrings.enterYourEmail,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: AppColors.red),
                          ),
                          errorText: controller.emailError.value,
                        ),
                      ),
                    ),

                    20.kheightBox,
                    Obx(
                      () => TextField(
                        focusNode: controller.passwordFocus,
                        onChanged: controller.validatePassword,
                        textInputAction: TextInputAction.done,
                        onSubmitted: (_) {
                          if (controller.validateAll()) {
                            // proceed with login
                          }
                        },
                        obscureText: controller.isPasswordHidden.value,
                        decoration: InputDecoration(
                          hintText: AppStrings.password,
                          suffixIcon: IconButton(
                            onPressed: controller.togglePasswordVisibility,
                            icon: Icon(
                              controller.isPasswordHidden.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: AppColors.red),
                          ),
                          errorText: controller.passwordError.value,
                        ),
                      ),
                    ),

                    10.kheightBox,
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        AppStrings.forgotYourPass,
                        style: AppTextStyles.sans600(
                          color: AppColors.blue,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    10.kheightBox,
                    Row(
                      children: [
                        Checkbox(
                          value: false,
                          onChanged: (_) {},
                          visualDensity: VisualDensity.compact,
                        ),
                        Text(AppStrings.rememberMe),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: false,
                          onChanged: (_) {},
                          visualDensity: VisualDensity.compact,
                        ),
                        const Flexible(child: Text(AppStrings.iAcceptTheTerms)),
                      ],
                    ),
                    5.kheightBox,
                    SizedBox(
                      width: double.infinity,
                      child: CustomElevatedButton(
                        buttonText: AppStrings.login,
                        height: 45.kh,
                        width: 100.w,
                        onPressed: controller.goToNavBar,
                      ),
                    ),
                    10.kheightBox,
                    Text(
                      AppStrings.or,
                      style: AppTextStyles.sans700(
                        fontSize: 12,
                        color: AppColors.black,
                      ),
                    ),
                    10.kheightBox,
                    SizedBox(
                      width: 100.w,
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Image.asset(Assets.googleLogo, height: 20),
                        ),
                        label: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            AppStrings.loginWithGoogle,
                            style: AppTextStyles.sans500(
                              color: AppColors.black,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                        ),
                      ),
                    ),
                    10.kheightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.dontHabeAnAccount,
                          style: AppTextStyles.sans600(
                            fontSize: 12,
                            color: AppColors.black,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            AppStrings.signUp,
                            style: AppTextStyles.sans600(
                              fontSize: 12,
                              color: AppColors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                36.kheightBox,
                Image.asset(Assets.messMateLogo, height: 25, width: 25),
                Center(child: SizedBox(height: 10)),
                Text(
                  AppStrings.loginToYourAccount,
                  style: AppTextStyles.sans700(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
