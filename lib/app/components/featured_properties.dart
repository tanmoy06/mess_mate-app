import 'package:flutter/material.dart';
import 'package:mess_mate/app/constants/app_text_styles.dart';
import 'package:mess_mate/app/service/responsive_ui_service.dart';

class FeaturedProperties extends StatelessWidget {
  final String imageUrl;
  final String messName;
  final double rating;
  final int review;
  final double price;

  const FeaturedProperties({
    super.key,
    required this.imageUrl,
    required this.messName,
    required this.rating,
    required this.review,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 160.kh,
          width: 160.kw,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.blueGrey,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(imageUrl, fit: BoxFit.fill),
          ),
        ),
        5.kheightBox,
        Text(
          messName,
          style: AppTextStyles.sans700(fontSize: 14, color: Color(0xff1a1a1a)),
        ),
        Row(
          children: [
            Text(
              rating.toStringAsFixed(1),
              style: AppTextStyles.sans600(
                fontSize: 12,
                color: Color(0xff6b7280),
              ),
            ),
            4.kwidthBox,
            Text(
              '($review reviews)',
              style: AppTextStyles.sans600(
                fontSize: 12,
                color: Color(0xff6b7280),
              ),
            ),
          ],
        ),
        Text(
          '₹${price.toStringAsFixed(0)} /month',
          style: AppTextStyles.sans600(fontSize: 12, color: Color(0xff6b7280)),
        ),
      ],
    );
  }
}
