import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mess_mate/app/constants/app_colors.dart';
import 'package:mess_mate/app/constants/app_text_styles.dart';
import 'package:mess_mate/app/service/responsive_ui_service.dart';

import '../controllers/booking_controller.dart';

class BookingView extends GetView<BookingController> {
  const BookingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Please Book Me 🫦',
          style: AppTextStyles.sans800(fontSize: 20, color: AppColors.black),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: Image.network(
          "https://t.pimg.jp/049/348/392/1/49348392.jpg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
