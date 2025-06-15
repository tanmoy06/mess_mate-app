import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
import 'package:mess_mate/app/constants/app_urls.dart';
import 'package:mess_mate/app/models/pg_owner_model.dart';
import 'package:mess_mate/app/modules/map_page/controllers/map_page_controller.dart';
import 'package:mess_mate/app/service/login_service.dart';

class UserHomeController extends GetxController {
  final MapPageController _mapPageController = Get.find();
  double? lat;
  double? long;
  var messList = <PgOwnerModel>[].obs;
  final LoginService _loginService = Get.find<LoginService>();
  final RxBool isLoading = false.obs;
  final RxBool isLoadingNearbyMess = false.obs;
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
          // print(userDetails);
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

  void observeUserLocation() {
    ever<LatLng?>(_mapPageController.userLocation, (location) {
      if (location != null) {
        lat = location.latitude;
        long = location.longitude;
        print("User moved to: ${location.latitude}, ${location.longitude}");
        _nearbyMess();
      }
    });
  }

  Future<void> _nearbyMess() async {
    isLoadingNearbyMess.value = true;
    try {
      final double? latitude = 88.54547458965988;
      final double? longitude = 22.962834194644188;
      final int page = 1;

      final response = await http.get(
        Uri.parse(AppUrls.findMessUrl).replace(
          queryParameters: {
            'lat': longitude.toString(),
            'lng': latitude.toString(),
            'page': page.toString(),
          },
        ),
      );

      if (response.statusCode == 200) {
        try {
          final Map<String, dynamic> json = jsonDecode(response.body);
          final List<dynamic> nearByMesses = json['data'];
          final data =
              nearByMesses
                  .map(
                    (item) =>
                        PgOwnerModel.fromJson(item as Map<String, dynamic>),
                  )
                  .toList();

          messList.value = data;
        } catch (e) {
          Get.snackbar('Fetch Error', e.toString());
        }
      } else {
        Get.snackbar('${response.statusCode}', response.body);
      }
    } catch (e) {
      Get.snackbar('Fetch Error', e.toString());
    } finally {
      isLoadingNearbyMess.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    // observeUserLocation();
    _nearbyMess();
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
}
