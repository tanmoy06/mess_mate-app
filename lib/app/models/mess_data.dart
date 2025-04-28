import 'package:flutter/material.dart';
import 'package:mess_mate/app/components/custom_button.dart';
import 'package:mess_mate/app/constants/app_colors.dart';
import 'package:mess_mate/app/constants/app_text.dart';
import 'package:mess_mate/app/constants/app_text_styles.dart';
import 'package:mess_mate/app/service/responsive_ui_service.dart';

class MessCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String location;
  final List<String> services;
  final double price;

  const MessCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.location,
    required this.services,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(
              imageUrl,
              height: 140.kh,
              width: 100.w,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: AppTextStyles.sans700(
                        color: AppColors.black,
                        fontSize: 14,
                      ),
                    ),
                    Icon(Icons.favorite_outline),
                  ],
                ),
                4.kheightBox,
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 16, color: Colors.grey),
                    4.kwidthBox,
                    Expanded(
                      child: Text(
                        location,
                        style: AppTextStyles.sans400(
                          color: AppColors.textGrey,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                8.kheightBox,
                Wrap(
                  spacing: 8,
                  children:
                      services
                          .map(
                            (service) => Chip(
                              label: Text(service),
                              backgroundColor: Colors.blue.shade50,
                            ),
                          )
                          .toList(),
                ),
                8.kheightBox,
                Text(
                  '₹$price',
                  style: AppTextStyles.sans700(
                    color: AppColors.blue,
                    fontSize: 15,
                  ),
                ),
                Text(
                  AppStrings.month,
                  style: AppTextStyles.sans500(
                    color: AppColors.blue,
                    fontSize: 12,
                  ),
                ),
                12.kheightBox,
                Row(
                  children: [
                    Expanded(
                      child: CustomElevatedButton(
                        textStyle: AppTextStyles.sans500(
                          fontSize: 14,
                          color: AppColors.white,
                        ),
                        buttonText: AppStrings.viewDetails,
                        height: 44.kh,
                        width: 100.kw,
                        onPressed: () {},
                      ),
                    ),
                    8.kwidthBox,
                    Expanded(
                      child: CustomElevatedButton(
                        textStyle: AppTextStyles.sans500(
                          fontSize: 14,
                          color: AppColors.blue,
                        ),
                        buttonColor: AppColors.white,
                        buttonText: AppStrings.bookNow,
                        height: 44.kh,
                        width: 100.kw,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
