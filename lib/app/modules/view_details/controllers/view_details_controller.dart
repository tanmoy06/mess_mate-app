import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart' as http;
import 'package:mess_mate/app/constants/app_urls.dart';
import 'package:mess_mate/app/data/provider/api_provider.dart';
import 'package:mess_mate/app/models/messModel.dart';

class ViewDetailsController extends GetxController {
  late final String imageUrl;
  late final String messName;
  late final double rating;
  late final int review;
  late final double price;
  late final String address;
  late final String geoHash;
  late final String mobileNo;
  late final String id;
  late final Location location;

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
    address = args['address'];
    geoHash = args["geoHash"];
    location = args["location"];
    mobileNo = args["mobileNo"];
    id = args['_id'];
    super.onInit();
  }

  Future<void> _viewDetails() async {
    try {
      final messDetailsUrl = '${AppUrls.viewDetails}/$id';
      final response = await ApiProvider.getWithoutAuth(messDetailsUrl);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('Mess Data: ${data['data']}');
      } else if (response.statusCode == 404) {
        print('Mess not found');
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  void onReady() {
    _viewDetails();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
