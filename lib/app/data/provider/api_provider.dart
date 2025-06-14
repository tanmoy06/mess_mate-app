import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mess_mate/app/constants/app_urls.dart';
import 'package:mess_mate/app/service/auth_service.dart';
import 'package:mess_mate/app/service/device_info_service.dart';
import 'package:mess_mate/app/service/login_service.dart';

class ApiProvider {
  static final _baseUrl = AppUrls.baseUrl;

  static Future<http.Response> getWithAuth(String endpoint) async {
    return await _sendRequest(() async {
      final headers = await _authHeaders();
      return await http.get(Uri.parse('$_baseUrl$endpoint'), headers: headers);
    });
  }

  static Future<http.Response> getWithoutAuth(String endpoint) async {
    final deviceService = Get.find<DeviceInfoService>();
    final deviceInfo = await deviceService.getNormalizedDeviceInfo();
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl$endpoint'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'User-Agent': 'PostmanRuntime/7.32.3',
          'x-device-info': deviceInfo,
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> post(String endpoint, Map<String, dynamic> body) async {
    return await _sendRequest(() async {
      final headers = await _authHeaders();
      return await http.post(
        Uri.parse('$_baseUrl$endpoint'),
        headers: headers,
        body: jsonEncode(body),
      );
    });
  }

  static Future<http.Response> _sendRequest(
    Future<http.Response> Function() request,
  ) async {
    http.Response response = await request();

    if (response.statusCode == 401 || response.statusCode == 403) {
      final success = await AuthService.refreshAccessToken();
      if (success) {
        response = await request();
      } else {
        // await LoginService().clearUserSession();
        throw Exception("Session expired. Please login again.");
      }
    }
    return response;
  }

  static Future<Map<String, String>> _authHeaders() async {
    final deviceService = Get.find<DeviceInfoService>();
    final deviceInfo = await deviceService.getNormalizedDeviceInfo();
    final token = await LoginService().getJwtToken();
    return {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'User-Agent': 'PostmanRuntime/7.32.3',
      'x-device-info': deviceInfo,
    };
  }
}
