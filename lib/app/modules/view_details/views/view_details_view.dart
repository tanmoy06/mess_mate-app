import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mess_mate/app/components/custom_button.dart';
import 'package:mess_mate/app/constants/app_colors.dart';
import 'package:mess_mate/app/constants/app_text.dart';
import 'package:mess_mate/app/constants/app_text_styles.dart';
import 'package:mess_mate/app/constants/assets.dart';
import 'package:mess_mate/app/service/responsive_ui_service.dart';

import '../controllers/view_details_controller.dart';

class ViewDetailsView extends GetView<ViewDetailsController> {
  const ViewDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 350.kh,
                    width: 100.w,
                    color: Colors.red,
                    child: Image.network(
                      controller.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => Get.back(),
                            child: Container(
                              height: 34.kh,
                              width: 34.kw,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.white,
                              ),
                              child: Center(child: Icon(Icons.arrow_back)),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                height: 34.kh,
                                width: 34.kw,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.white,
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.share,
                                    color: AppColors.black,
                                    size: 16,
                                  ),
                                ),
                              ),
                              5.kwidthBox,
                              Container(
                                height: 34.kh,
                                width: 34.kw,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.white,
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    Assets.heart,
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10.w,
                    right: 10.w,
                    child: Container(
                      height: 70.kh,
                      width: 80.w,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          // 'Green Nest Boy\'s hostel',
                          controller.messName,
                          style: AppTextStyles.sans800(
                            fontSize: 20,
                            color: AppColors.black,
                          ),
                        ),
                        Container(
                          height: 20.kh,
                          width: 56.kw,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: AppColors.lightBlue,
                          ),
                          child: Center(
                            child: Text(
                              '20% off',
                              style: AppTextStyles.sans600(
                                fontSize: 9,
                                color: AppColors.blue,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    5.kheightBox,
                    Text(
                      'Sector 5, Salt Lake, Kolkata- 700023',
                      style: AppTextStyles.sans400(
                        fontSize: 12,
                        color: AppColors.black,
                      ),
                    ),
                    10.kheightBox,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.star_outline, size: 20),
                        5.kwidthBox,
                        Text(
                          // '4.5 (120 reviews)',
                          '${controller.rating} (${controller.review} reviews)',
                          style: AppTextStyles.sans400(
                            fontSize: 12,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                    30.kheightBox,
                    Text(
                      'Amentities',
                      style: AppTextStyles.sans700(
                        fontSize: 18,
                        color: AppColors.black,
                      ),
                    ),
                    20.kheightBox,
                    Container(
                      height: 160.kh,
                      width: 100.w,
                      decoration: BoxDecoration(color: AppColors.grey),
                    ),
                    20.kheightBox,
                    // Text(
                    //   'Rules & Timings',
                    //   style: AppTextStyles.sans700(
                    //     fontSize: 18,
                    //     color: AppColors.black,
                    //   ),
                    // ),
                    // 10.kheightBox,
                    // Divider(color: AppColors.borderGrey),
                    Text(
                      'Location',
                      style: AppTextStyles.sans700(
                        fontSize: 18,
                        color: AppColors.black,
                      ),
                    ),
                    10.kheightBox,
                    Container(
                      height: 200.kh,
                      width: 100.w,
                      color: AppColors.grey,
                    ),
                    20.kheightBox,
                    CustomElevatedButton(
                      borderColor: AppColors.grey,
                      buttonColor: AppColors.grey,
                      buttonText: 'Get Directions',
                      textStyle: AppTextStyles.sans700(
                        fontSize: 16,
                        color: AppColors.black,
                      ),
                      height: 50.kh,
                      width: 180.kw,
                      onPressed: () {},
                    ),
                    20.kheightBox,
                    Text(
                      'Reviews',
                      style: AppTextStyles.sans700(
                        fontSize: 18,
                        color: AppColors.black,
                      ),
                    ),
                    10.kheightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "4.5",
                              style: AppTextStyles.sans800(
                                fontSize: 36,
                                color: AppColors.black,
                              ),
                            ),
                            const Row(
                              children: [
                                Icon(Icons.star, color: Colors.black),
                                Icon(Icons.star, color: Colors.black),
                                Icon(Icons.star, color: Colors.black),
                                Icon(Icons.star, color: Colors.black),
                                Icon(Icons.star_border, color: Colors.black),
                              ],
                            ),
                            4.kheightBox,
                            Text(
                              "120 reviews",
                              style: AppTextStyles.sans400(
                                fontSize: 16,
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Column(
                              children:
                                  controller.ratings.map((rating) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 4.0,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(rating['stars'].toString()),
                                          4.kwidthBox,
                                          Expanded(
                                            child: LinearProgressIndicator(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              value: rating['percent'] / 100,
                                              backgroundColor: AppColors.grey,
                                              color: AppColors.black,
                                              minHeight: 8,
                                            ),
                                          ),
                                          8.kwidthBox,
                                          Text("${rating['percent']}%"),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    80.kheightBox,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: 80,
        width: 100.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          color: Colors.white,
          border: Border(
            top: BorderSide(width: 1, color: AppColors.borderGrey),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Starting from',
                    style: AppTextStyles.sans700(
                      fontSize: 12,
                      color: AppColors.textGrey,
                    ),
                  ),
                  Text(
                    '₹${controller.price}/month',
                    style: AppTextStyles.sans700(
                      fontSize: 14,
                      color: AppColors.blue,
                    ),
                  ),
                ],
              ),
              CustomElevatedButton(
                buttonText: AppStrings.bookNow,
                height: 50,
                width: 140,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
