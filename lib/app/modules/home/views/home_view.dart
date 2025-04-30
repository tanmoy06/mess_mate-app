import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mess_mate/app/components/custom_appbar.dart';
import 'package:mess_mate/app/constants/app_colors.dart';
import 'package:mess_mate/app/constants/app_text.dart';
import 'package:mess_mate/app/constants/app_text_styles.dart';
import 'package:mess_mate/app/models/mess_data.dart';
import 'package:mess_mate/app/service/responsive_ui_service.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomAppbar(onChanged: (value) {}, onSubmitted: (value) {}),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Container(
              height: 46.kh,
              width: 46.kw,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1, color: AppColors.borderGrey),
              ),
              child: Icon(Icons.notifications),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${controller.messList.length} ${AppStrings.propertiesFound}',
                    style: AppTextStyles.sans700(
                      fontSize: 16,
                      color: AppColors.black,
                    ),
                  ),
                  Container(
                    height: 40.kh,
                    width: 80.kw,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.grey,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.filter_alt),
                            Text(
                              AppStrings.filter,
                              style: AppTextStyles.sans400(
                                fontSize: 12,
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              18.kheightBox,
              Expanded(
                child: ListView.builder(
                  itemCount: controller.messList.length,
                  itemBuilder: (context, index) {
                    final mess = controller.messList[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: MessCard(
                        imageUrl: mess['imageUrl'] as String,
                        name: mess['name'] as String,
                        location: mess['location'] as String,
                        services: List<String>.from(mess['services'] as List),
                        price: mess['price'] as double,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
