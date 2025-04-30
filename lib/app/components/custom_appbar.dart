import 'package:flutter/material.dart';
import 'package:mess_mate/app/constants/app_colors.dart';
import 'package:mess_mate/app/constants/app_text.dart';
import 'package:mess_mate/app/constants/app_text_styles.dart';
import 'package:mess_mate/app/service/responsive_ui_service.dart';

class CustomAppbar extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSubmitted;
  const CustomAppbar({
    super.key,
    required this.onChanged,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.kh,
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            hintText: AppStrings.searchLocationOrProperty,
            hintStyle: AppTextStyles.sans400(color: AppColors.textGrey),
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 10),
          ),
        ),
      ),
    );
  }
}
