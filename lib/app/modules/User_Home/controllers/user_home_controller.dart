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
          'https://content.jdmagicbox.com/comp/hooghly/r7/9999pxx33.xx33.230616005820.n9r7/catalogue/jethimar-mess-and-pg-hooghly-bed-and-breakfast-b1x2fbrz40.jpg',
      'messName': 'Green Leaf Mess',
      'rating': 4.2,
      'review': 85,
      'price': 2300.0,
    },
    {
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJ-vnrc5KzCc-PsTY4D0a3wfgciWXLZPG4vgcZIYSYjAfqnaZt31P6CeDSc-QKh6aQnhA&usqp=CAU',
      'messName': 'City View Mess',
      'rating': 4.8,
      'review': 200,
      'price': 2700.0,
    },
    {
      'imageUrl':
          'https://content3.jdmagicbox.com/v2/comp/kolkata/l6/033pxx33.xx33.210416195011.h5l6/catalogue/hazra-mess-jadavpur-kolkata-paying-guest-accommodations-jsxpk1rw5m.jpg',
      'messName': 'Elite Dine Mess',
      'rating': 4.3,
      'review': 95,
      'price': 2600.0,
    },
    {
      'imageUrl':
          'https://content.jdmagicbox.com/comp/kolkata/g3/033pxx33.xx33.221109071000.w5g3/catalogue/second-home-p-g-accommodation-kolkata-hostels-tl99dkutf1-250.jpg',
      'messName': 'Budget Bites Mess',
      'rating': 4.0,
      'review': 60,
      'price': 2100.0,
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
