import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mess_mate/app/constants/app_urls.dart';
import 'package:mess_mate/app/service/login_service.dart';

class UserHomeController extends GetxController {
  final LoginService _loginService = Get.find<LoginService>();

  final RxBool isLoading = false.obs;
  final Rx<Map<String, dynamic>?> userDetails = Rx<Map<String, dynamic>?>(null);
  final RxnString userType = RxnString(null);
  final userFirstName = ''.obs;
  final userLastName = ''.obs;
  final userEmail = ''.obs;
  Future<void> _fetchAllData() async {
    isLoading.value = true;

    try {
      final String? storedType = await _loginService.getUserType();
      final String? storedId = await _loginService.getUserId();
      final String? jwtToken = await _loginService.getJwtToken();

      String? userIdToFetch;

      if (storedType == "student") {
        userIdToFetch = storedId;
      } else {
        userIdToFetch =
            ""; // Default for non-student types, adjust as per your backend
      }

      if (userIdToFetch == null || userIdToFetch.isEmpty) {
        Get.snackbar(
          'Info',
          'Cannot fetch profile details without a valid user ID.',
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      if (jwtToken == null || jwtToken.isEmpty) {
        Get.snackbar(
          'Error',
          'Authentication token missing. Please log in again.',
          snackPosition: SnackPosition.BOTTOM,
        );
        // Optionally, redirect to login if token is missing
        // Get.offAllNamed(Routes.LOGIN);
        return;
      }

      userType.value = storedType;
      final Uri detailsUrl = Uri.parse(AppUrls.fetchUserDetails).replace(
        queryParameters: {"userId": userIdToFetch, "type": storedType ?? ''},
      );

      final response = await http.get(
        detailsUrl,
        headers: {
          'Content-type': 'application/json',
          'Authorization': 'Bearer $jwtToken',
        },
      );
      if (response.statusCode == 200) {
        try {
          final Map<String, dynamic> responseData = jsonDecode(response.body);
          userDetails.value = responseData;
          userFirstName.value = responseData['firstName'];
          userLastName.value = responseData['lastName'];
          userEmail.value = responseData['email'];
          print(userDetails);
        } on FormatException catch (e) {
          Get.snackbar('JSON parsing error', e.message);
          throw Exception(
            'Received non-JSON response from server (Status 200). '
            'Response starts with: "${response.body.substring(0, response.body.length > 50 ? 50 : response.body.length)}..."',
          );
        }
      } else {
        String errorMessage =
            'Failed to load profile details. Status: ${response.statusCode}. ';
        try {
          var errorBody = jsonDecode(response.body);
          errorMessage += errorBody['message'] ?? 'An unknown error occurred.';
        } catch (e) {
          errorMessage +=
              'Raw response: "${response.body.substring(0, response.body.length > 100 ? 100 : response.body.length)}..."';
        }
        throw Exception(errorMessage);
      }
    } catch (error) {
      Get.snackbar(
        'Error',
        error.toString().contains('Exception:')
            ? error.toString().replaceFirst('Exception: ', '')
            : 'An unexpected error occurred while loading profile data. Check your network or API endpoint.',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> refreshProfileDetails() async {
    await _fetchAllData();
  }

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
    _fetchAllData();
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
