import 'package:flutter/material.dart';
import 'package:mess_mate/app/constants/app_colors.dart';
import 'package:mess_mate/app/constants/app_text_styles.dart';
import 'package:mess_mate/app/service/responsive_ui_service.dart';

class FeaturedProperties extends StatelessWidget {
  final String imageUrl;
  final String messName;
  final String gender;
  // final double rating;
  // final int review;
  final double price;

  const FeaturedProperties({
    super.key,
    required this.imageUrl,
    required this.messName,
    // required this.rating,
    // required this.review,
    required this.price,
    required this.gender,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 140.kh,
          width: 160.kw,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.blueGrey,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(imageUrl, fit: BoxFit.cover),
          ),
        ),
        5.kheightBox,
        Text(
          messName,
          style: AppTextStyles.sans700(fontSize: 14, color: Color(0xff1a1a1a)),
        ),
        Container(
          height: 24.kh,
          width: 80.kw,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: AppColors.borderGrey),
            borderRadius: BorderRadius.circular(6),
            color:
                gender == "Coed Pg"
                    ? Colors.lightGreen[100]
                    : gender == "Boys Pg"
                    ? Colors.lightBlue[100]
                    : gender == "Girls Pg"
                    ? Colors.red[100]
                    : Colors.blueGrey,
          ),
          child: Center(
            child: Text(
              gender,
              style: AppTextStyles.sans600(
                color:
                    gender == "Boys Pg"
                        ? AppColors.blue
                        : gender == "Girls Pg"
                        ? AppColors.red
                        : gender == "Coed Pg"
                        ? Colors.green
                        : AppColors.nipple,
              ),
            ),
          ),
        ),
        Text(
          '₹${price.toStringAsFixed(0)} /month',
          style: AppTextStyles.sans600(fontSize: 12, color: Color(0xff6b7280)),
        ),
      ],
    );
  }
}
