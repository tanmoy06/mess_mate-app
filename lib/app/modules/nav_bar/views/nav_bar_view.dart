import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mess_mate/app/constants/app_colors.dart';
import 'package:mess_mate/app/constants/app_text_styles.dart';

import '../controllers/nav_bar_controller.dart';

class NavBarView extends GetView<NavBarController> {
  const NavBarView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return controller.pages[controller.currentIndex.value];
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.white,
          currentIndex: controller.currentIndex.value,
          selectedItemColor: AppColors.blue,
          unselectedItemColor: AppColors.black,
          onTap: controller.changeIndex,
          selectedLabelStyle: AppTextStyles.sans600(height: 2),
          unselectedLabelStyle: AppTextStyles.sans500(height: 2),
          showSelectedLabels: true,
          showUnselectedLabels: true,

          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 28,
                // color:
                //     controller.currentIndex.value == 0
                //         ? AppColors.blue
                //         : AppColors.white,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                size: 28,
                // color:
                //     controller.currentIndex.value == 1
                //         ? AppColors.blue
                //         : AppColors.white,
              ),
              label: 'Saved',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.bookmark,
                size: 28,
                // color:
                //     controller.currentIndex.value == 2
                //         ? AppColors.blue
                //         : AppColors.white,
              ),
              label: 'Booking',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 28,
                // color:
                //     controller.currentIndex.value == 3
                //         ? AppColors.blue
                //         : AppColors.white,
              ),
              label: 'Profile',
            ),
          ],
        );
      }),
    );
  }
}
