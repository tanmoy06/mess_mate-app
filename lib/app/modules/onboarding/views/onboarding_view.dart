import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mess_mate/app/components/custom_button.dart';
import 'package:mess_mate/app/constants/app_colors.dart';
import 'package:mess_mate/app/constants/app_text.dart';
import 'package:mess_mate/app/constants/app_text_styles.dart';
import 'package:mess_mate/app/constants/assets.dart';
import 'package:mess_mate/app/service/responsive_ui_service.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: controller.pageController,
              onPageChanged: (index) => controller.currentPage.value = index,
              children: [
                OnboardingPage(
                  image: Assets.findMess,
                  title: AppStrings.findYourPerfectMesss,
                  subtitle: AppStrings.exploreMessAndPg,
                  buttonText: AppStrings.next,
                  onTap: controller.nextPage,
                  backButton: true,
                  onSkip: controller.onSkip,
                ),
                OnboardingPage(
                  image: Assets.bookEasily,
                  title: AppStrings.bookEasily,
                  subtitle: AppStrings.compareAmenitiesPricing,
                  buttonText: AppStrings.next,
                  onTap: controller.nextPage,
                  backButton: true,
                  onSkip: controller.nextPage,
                ),
                OnboardingPage(
                  image: Assets.stayComfortable,
                  title: AppStrings.stayComfortable,
                  subtitle: AppStrings.enjoyAHassleFreeStay,
                  buttonText: AppStrings.getStarted,
                  onTap: () {
                    controller.getStarted();
                  },
                ),
              ],
            ),
          ),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 8,
                  width: controller.currentPage.value == index ? 24 : 8,
                  decoration: BoxDecoration(
                    color:
                        controller.currentPage.value == index
                            ? Colors.blue
                            : Colors.grey,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ),
          20.kheightBox,
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String? subtitle;
  final String buttonText;
  final VoidCallback onTap;
  final bool backButton;
  final VoidCallback? onSkip;

  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    this.subtitle,
    required this.buttonText,
    required this.onTap,
    this.backButton = false,
    this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          const Spacer(),
          Lottie.asset(image, height: 250),
          const SizedBox(height: 32),
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.sans700(color: AppColors.black, fontSize: 20),
          ),
          if (subtitle != null)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                subtitle!,
                textAlign: TextAlign.center,
                style: AppTextStyles.sans400(
                  color: AppColors.textGrey,
                  fontSize: 13,
                ),
              ),
            ),
          40.kheightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (backButton) ...[
                GestureDetector(
                  onTap: onSkip,
                  child: Text(
                    AppStrings.skip,
                    style: AppTextStyles.sans600(
                      color: AppColors.onboardingGrey,
                    ),
                  ),
                ),
                CustomElevatedButton(
                  buttonText: AppStrings.next,
                  height: 50.kh,
                  width: 120.kw,
                  onPressed: onTap,
                ),
              ] else
                CustomElevatedButton(
                  buttonText: buttonText,
                  height: 50.kh,
                  width: 80.w,
                  onPressed: onTap,
                ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
