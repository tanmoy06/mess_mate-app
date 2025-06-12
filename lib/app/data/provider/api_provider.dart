import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mess_mate/app/constants/app_urls.dart';
import 'package:mess_mate/app/service/login_service.dart';

class ApiProvider {
  static final _baseUrl = AppUrls.baseUrl;

  static Future<http.Response> get(String endpoint) async {
    return await _sendRequest(() async {
      final headers = await _authHeaders();
      return await http.get(Uri.parse('$_baseUrl$endpoint'), headers: headers);
    });
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

    if (response.statusCode == 401) {
      final success = await _refreshToken();
      if (success) {
        response = await request();
      } else {
        await LoginService().clearUserSession();
        throw Exception("Session expired. Please login again.");
      }
    }
    return response;
  }

  static Future<Map<String, String>> _authHeaders() async {
    final token = await LoginService().getJwtToken();
    return {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
  }

  static Future<bool> _refreshToken() async {
    final refreshToken = await LoginService().getRefreshToken();
    if (refreshToken == null) return false;

    final response = await http.post(
      Uri.parse('$_baseUrl/auth/refresh'),
      headers: {
        'Authorization': 'Bearer $refreshToken',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      await LoginService().updateJwtToken(data['accessToken']);
      if (data['refreshToken'] != null) {
        await LoginService().updateRefreshToken(data['refreshToken']);
      }
      return true;
    }

    return false;
  }
}
