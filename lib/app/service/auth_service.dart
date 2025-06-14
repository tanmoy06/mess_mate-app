import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mess_mate/app/constants/app_urls.dart';
import 'package:mess_mate/app/service/device_info_service.dart';
import 'package:mess_mate/app/service/login_service.dart';

class AuthService {
  Future<bool> isLoggedIn() async {
    final token = await LoginService().getJwtToken();
    if (token == null) return false;

    final response = await http.get(
      Uri.parse(AppUrls.getSavedMess),
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 401) {
      return await refreshAccessToken();
    }
    return false;
  }

  static Future<bool> refreshAccessToken() async {
    final refreshToken = await LoginService().getRefreshToken();
    print('token from refressAccessToken function: $refreshToken');
    if (refreshToken == null || refreshToken.isEmpty) {
      return false;
    }
    final url = Uri.parse(AppUrls.refreshTokenHandler);
    final deviceService = Get.find<DeviceInfoService>();
    final deviceInfo = await deviceService.getNormalizedDeviceInfo();
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $refreshToken',
        'Content-Type': 'application/json',
        'x-device-info': deviceInfo,
      },
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
      final newAccessToken = data['newAccessToken'];
      final newRefreshToken = data['newRefreshToken'];
      if (newAccessToken == null) {
        throw Exception('New Access token missing in response');
      }
      print(newAccessToken);
      await LoginService().updateJwtToken(newAccessToken);
      if (newRefreshToken != null) {
        await LoginService().updateRefreshToken(newRefreshToken);
      }

      return true;
    } else {
      print('Refresh token response: ${response.statusCode} ${response.body}');
      return false;
    }
  }
}
