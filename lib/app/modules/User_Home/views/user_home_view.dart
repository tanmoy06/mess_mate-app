import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mess_mate/app/components/custom_appbar.dart';
import 'package:mess_mate/app/components/featured_properties.dart';
import 'package:mess_mate/app/constants/app_colors.dart';
import 'package:mess_mate/app/constants/app_text.dart';
import 'package:mess_mate/app/constants/app_text_styles.dart';
import 'package:mess_mate/app/constants/assets.dart';
import 'package:mess_mate/app/service/responsive_ui_service.dart';

import '../controllers/user_home_controller.dart';

class UserHomeView extends GetView<UserHomeController> {
  const UserHomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 240.kh,
                width: 100.w,
                child: Image.asset(Assets.homePageImage, fit: BoxFit.cover),
              ),
              Align(
                alignment: Alignment.topRight,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10.0, top: 10.0),
                    child: Container(
                      height: 46.kh,
                      width: 46.kw,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.notifications),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: Text(
                  'Find your Perfect\nAccommondation',
                  style: AppTextStyles.sans700(
                    fontSize: 24,
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.location,
                      style: AppTextStyles.sans400(
                        color: AppColors.textGrey,
                        fontSize: 12,
                      ),
                    ),
                    5.kheightBox,
                    Row(
                      children: [
                        Image.asset(Assets.location, height: 20),
                        5.kwidthBox,
                        Text(
                          'Current location',
                          style: AppTextStyles.sans400(
                            fontSize: 12,
                            color: AppColors.black,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.keyboard_arrow_down),
                        ),
                      ],
                    ),
                    CustomAppbar(),
                    10.kheightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Featured Properties',
                          style: AppTextStyles.sans700(
                            fontSize: 16,
                            color: AppColors.black,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'See all',
                            style: AppTextStyles.sans400(
                              color: AppColors.blue,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 222.kh,
                      width: 100.w,
                      child: GridView.builder(
                        itemCount: controller.featuredData.length,
                        scrollDirection: Axis.horizontal,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 0,
                        ),
                        itemBuilder: (context, index) {
                          final item = controller.featuredData[index];
                          return FeaturedProperties(
                            imageUrl: item['imageUrl'],
                            messName: item['messName'],
                            rating: item['rating'],
                            review: item['review'],
                            price: item['price'],
                          );
                        },
                      ),
                    ),
                    10.kheightBox,
                    Text(
                      'Explore popular cities',
                      style: AppTextStyles.sans700(
                        fontSize: 16,
                        color: AppColors.black,
                      ),
                    ),
                    10.kheightBox,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
