import 'package:get/get.dart';

class UserHomeController extends GetxController {
  final List<Map<String, dynamic>> featuredData = [
    {
      'imageUrl':
          'https://img.staticmb.com/mbphoto/pg/grd1/cropped_images/2020/Jul/25/Photo_h400_w540/GR1-15642-354092_400_540.jpeg',
      'messName': 'Sunrise Mess',
      'rating': 4.5,
      'review': 120,
      'price': 2500.0,
    },
    {
      'imageUrl':
          'https://img.staticmb.com/mbphoto/pg/grd1/cropped_images/2020/Jul/25/Photo_h400_w540/GR1-15642-354092_400_540.jpeg',
      'messName': 'Sunrise Mess',
      'rating': 4.5,
      'review': 120,
      'price': 2500.0,
    },
    {
      'imageUrl':
          'https://img.staticmb.com/mbphoto/pg/grd1/cropped_images/2020/Jul/25/Photo_h400_w540/GR1-15642-354092_400_540.jpeg',
      'messName': 'Sunrise Mess',
      'rating': 4.5,
      'review': 120,
      'price': 2500.0,
    },
    {
      'imageUrl':
          'https://img.staticmb.com/mbphoto/pg/grd1/cropped_images/2020/Jul/25/Photo_h400_w540/GR1-15642-354092_400_540.jpeg',
      'messName': 'Sunrise Mess',
      'rating': 4.5,
      'review': 120,
      'price': 2500.0,
    },
  ];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
