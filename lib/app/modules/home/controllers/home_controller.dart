import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  final messList = [
    {
      'imageUrl':
          'https://img.staticmb.com/mbphoto/pg/grd1/cropped_images/2020/Jul/25/Photo_h400_w540/GR1-15642-354092_400_540.jpeg',
      'name': 'Green Valley Boys Mess',
      'location': 'Simhat, Harighata, Near Makaut University',
      'services': ['Food', 'RO Water'],
      'price': 3500.0,
    },
    {
      'imageUrl':
          'https://content.jdmagicbox.com/v2/comp/kolkata/f8/033pxx33.xx33.131125082713.z3f8/catalogue/mohit-agarwal-beadon-street-kolkata-paying-guest-accommodations-for-women-yevdpl3290.jpg',
      'name': 'Raat kapano Mess',
      'location': 'Sector 5, Kolkata',
      'services': ['Food', 'WiFi', 'Laundry'],
      'price': 4000.0,
    },
    {
      'imageUrl':
          'https://content.jdmagicbox.com/comp/kolkata/z8/033pxx33.xx33.230121220656.l5z8/catalogue/sarawagi-boys-pg-kolkata-hostels-youn8leeeq.jpg',
      'name': 'Sutta Lover Mess',
      'location': 'Sector 5, Kolkata',
      'services': ['Cigarette', 'Food', 'WiFi', 'Laundry', 'AC', 'Aunty', 'TV'],
      'price': 1200.0,
    },
    {
      'imageUrl':
          'https://content.jdmagicbox.com/comp/kolkata/h9/033pxx33.xx33.140219174825.g5h9/catalogue/dum-dum-perfect-hostel-and-pg-dum-dum-kolkata-paying-guest-accommodations-059a03s7n2-250.jpg',
      'name': 'Random Mess',
      'location': 'Sector 5, Kolkata',
      'services': ['Food', 'WiFi', 'Laundry'],
      'price': 4000.0,
    },
  ];
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
