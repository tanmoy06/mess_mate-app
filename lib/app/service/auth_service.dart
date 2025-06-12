import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mess_mate/app/constants/app_urls.dart';
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

  Future<bool> refreshAccessToken() async {
    final refreshToken = await LoginService().getRefreshToken();
    if (refreshToken == null) return false;
    final url = Uri.parse(AppUrls.refreshTokenHandler);
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $refreshToken',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      print('token refreshed');
      final data = jsonDecode(response.body);
      final accessToken = data['accessToken'];
      final newRefreshToken = data['refreshToken'];
      await LoginService().updateJwtToken(accessToken);

      if (newRefreshToken != null) {
        await LoginService().updateRefreshToken(newRefreshToken);
      }

      return true;
    }
    return false;
  }
}
