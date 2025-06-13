import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mess_mate/app/constants/app_colors.dart';
import 'package:mess_mate/app/constants/app_text_styles.dart';
import 'package:mess_mate/app/components/mess_card.dart';
import 'package:mess_mate/app/routes/app_pages.dart';
import '../controllers/saved_pg_controller.dart';

class SavedPgView extends GetView<SavedPgController> {
  const SavedPgView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Saved Mess',
          style: AppTextStyles.sans800(color: AppColors.black, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.messList.length,
          itemBuilder: (context, index) {
            final mess = controller.messList[index];
            return Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
              child: MessCard(
                imageUrl: mess.profilePhoto,
                messName: mess.messName,
                address: mess.address,
                services: ['Food', 'RO Water'],
                price: 1200,
                onViewDetails: () {
                  Get.toNamed(
                    Routes.VIEW_DETAILS,
                    arguments: {
                      'imageUrl': mess.profilePhoto,
                      'messName': mess.messName,
                      'rating': 4.5,
                      'review': 120,
                      'price': 1200.0,
                      'location': mess.location,
                      'address': mess.address,
                      'aboutMess': mess.aboutMess,
                      'geoHash': mess.geoHash,
                      'mobileNo': mess.mobileNo,
                      '_id': mess.id,
                    },
                  );
                },
                onBookNow: () {},
              ),
            );
          },
        );
      }),
    );
  }
}
