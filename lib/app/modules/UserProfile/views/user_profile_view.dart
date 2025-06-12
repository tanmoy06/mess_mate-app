import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mess_mate/app/constants/app_colors.dart';
import 'package:mess_mate/app/constants/app_text.dart';
import 'package:mess_mate/app/constants/app_text_styles.dart';
import 'package:mess_mate/app/modules/User_Home/controllers/user_home_controller.dart';
import 'package:mess_mate/app/service/responsive_ui_service.dart';

import '../controllers/user_profile_controller.dart';

class UserProfileView extends GetView<UserProfileController> {
  final UserHomeController userHomeController = Get.find();
  UserProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppStrings.profile,
          style: AppTextStyles.sans700(fontSize: 18, color: AppColors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              10.kheightBox,
              Center(
                child: CircleAvatar(
                  backgroundColor: AppColors.red,
                  radius: 50.kh,
                ),
              ),
              Obx(() {
                return Text(
                  "${userHomeController.userFirstName} ${userHomeController.userLastName}",
                  style: AppTextStyles.sans700(
                    fontSize: 22,
                    color: AppColors.black,
                  ),
                );
              }),
              Obx(() {
                return Text(
                  userHomeController.userEmail.toString(),
                  style: AppTextStyles.sans400(
                    fontSize: 16,
                    color: AppColors.yellow,
                  ),
                );
              }),

              // Text(
              //   '+91 1234567890',
              //   style: AppTextStyles.sans400(
              //     fontSize: 16,
              //     color: AppColors.yellow,
              //   ),
              // ),
              20.kheightBox,
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 8.0,
                ),
                child: SizedBox(
                  width: 100.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.account,
                        style: AppTextStyles.sans700(
                          fontSize: 20,
                          color: AppColors.black,
                        ),
                      ),
                      10.kheightBox,
                      Card(
                        elevation: 0.1,
                        color: AppColors.lightYellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: ListTile(
                          leading: Icon(
                            Icons.payment_outlined,
                            color: AppColors.nipple,
                          ),
                          title: Text(
                            AppStrings.paymentMethods,
                            style: AppTextStyles.sans400(
                              fontSize: 16,
                              color: AppColors.nipple,
                            ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: AppColors.nipple,
                            size: 20,
                          ),
                          onTap: () {},
                        ),
                      ),
                      Card(
                        elevation: 0.1,
                        color: AppColors.lightYellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: ListTile(
                          leading: Icon(
                            Icons.settings_outlined,
                            color: AppColors.nipple,
                          ),
                          title: Text(
                            AppStrings.settings,
                            style: AppTextStyles.sans400(
                              fontSize: 16,
                              color: AppColors.nipple,
                            ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: AppColors.nipple,
                            size: 20,
                          ),
                          onTap: () {},
                        ),
                      ),
                      Card(
                        elevation: 0.1,
                        color: AppColors.lightYellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: ListTile(
                          leading: Icon(
                            Icons.support_agent_outlined,
                            color: AppColors.nipple,
                          ),
                          title: Text(
                            AppStrings.helpAndSupport,
                            style: AppTextStyles.sans400(
                              fontSize: 16,
                              color: AppColors.nipple,
                            ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: AppColors.nipple,
                            size: 20,
                          ),
                          onTap: () {},
                        ),
                      ),
                      Card(
                        elevation: 0.1,
                        color: AppColors.lightYellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: ListTile(
                          leading: Icon(Icons.logout, color: AppColors.nipple),
                          title: Text(
                            AppStrings.logOut,
                            style: AppTextStyles.sans400(
                              fontSize: 16,
                              color: AppColors.nipple,
                            ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: AppColors.nipple,
                            size: 20,
                          ),
                          onTap: controller.logout,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
