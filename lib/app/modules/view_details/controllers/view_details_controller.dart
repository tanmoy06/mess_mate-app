import 'package:get/get.dart';

class ViewDetailsController extends GetxController {
  late final String imageUrl;
  late final String messName;
  late final double rating;
  late final int review;
  late final double price;

  final List<Map<String, dynamic>> ratings = const [
    {'stars': 5, 'percent': 40},
    {'stars': 4, 'percent': 30},
    {'stars': 3, 'percent': 15},
    {'stars': 2, 'percent': 10},
    {'stars': 1, 'percent': 5},
  ];

  @override
  void onInit() {
    final args = Get.arguments;
    imageUrl = args['imageUrl'];
    messName = args['messName'];
    rating = args['rating'];
    review = args['review'];
    price = args['price'];
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
}
